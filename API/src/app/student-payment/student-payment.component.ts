import { ChangeDetectorRef, Component, Injector, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import * as moment from 'moment';
import { EducationalFeeDTO, BusFeeDTO, Installment } from '@shared/models/exportsModesl';
import { AppComponentBase } from '@shared/app-component-base';
import {
  EducationalPaymentServiceProxy,
  StudentDTO,
  StudentImportServiceProxy,
  StudentPaymentDetails,
  StudentSubscribtion,
} from '@shared/service-proxies/service-proxies';
import { debug } from 'console';
@Component({
  selector: 'app-student-payment',
  templateUrl: './student-payment.component.html',
  styleUrls: ['./student-payment.component.css'],
})
export class StudentPaymentComponent extends AppComponentBase implements OnInit {
  activeTab: 'education' | 'bus' = 'education';
  studentId = 0;

  selectedBusLineId: number | null = null;
  subscriptionNote: string = '';
  isFulPaymentPaid: boolean = false;
  isInstallmentsPaid: boolean = false;
  isBusSubscribed: boolean = false;
  PaymentDetails: PaymentDetails = new PaymentDetails();

  constructor(private cdr: ChangeDetectorRef, injector: Injector, private _PaymentService: EducationalPaymentServiceProxy) {
    super(injector);
  }
  ngOnInit(): void {
    this._PaymentService.getStudentByName(this.appSession.getShownLoginName()).subscribe((data: any) => {
      this.studentId = data.studentId;
      this._PaymentService.getEduPaymentData(this.studentId).subscribe((data: any) => {
        const paymentDetails: PaymentDetails = new PaymentDetails();

        // 1. Map student
        paymentDetails.student = data.studentInfo;

        // 2. Determine payment mode
        const hasFullPayment = data.educationalPayments.some((p) => p.isFullPayment);
        paymentDetails.paymentMode = hasFullPayment ? 'full' : 'installments';

        // 3. Full payment info
        const fullPayment = data.educationalPayments.find((p) => p.isFullPayment);
        if (fullPayment) {
          paymentDetails.discountedAmount = fullPayment.amountPaid;
          paymentDetails.fullPaymentDueDate = new Date(fullPayment.paymentDate);
          paymentDetails.PaymentStatus = this.mapPaymentStatus(fullPayment.paymentStatus);
        }

        // 4. Installments mapping
        paymentDetails.installments = data.educationalPayments
          .filter((p) => !p.isFullPayment)
          .map((p, index) => ({
            id: p.id,
            dueDate: new Date(p.paymentDate),
            amount: p.amountPaid,
            status: this.mapPaymentStatus(p.paymentStatus),
            selected: false,
          }));

        // 5. Bus lines mapping
        paymentDetails.busLines = data.busLines.map((b) => ({
          id: b.id,
          name: b.name,
          expectedAmount: b.expectedAmount,
          isSubscribed: b.isSubscribed,
          subscriptionStatus: b.subscriptionStatus,
        }));

        // 6. Optional: pre-select bus line if already subscribed
        const subscribed = paymentDetails.busLines.find((b) => b.isSubscribed);
        if (subscribed) {
          paymentDetails.selectedBusLineId = subscribed.id;
          this.subscriptionNote = paymentDetails.subscriptionNote;
        }

        this.PaymentDetails = paymentDetails;
        console.log(this.PaymentDetails);

        this.isFullPayment(this.PaymentDetails);
        this.isInstallmentsPayment(this.PaymentDetails);
        this.isSubscribedToBus(this.PaymentDetails);
        this.cdr.detectChanges();
      });
    });
  }

  get isEligibleForDiscount(): boolean {
    return new Date() <= this.PaymentDetails.fullPaymentDueDate;
  }

  totalSelectedAmount(): number {
    return this.PaymentDetails.installments
      .filter((inst) => inst.selected && inst.status !== PaymentStatus.Paid)
      .reduce((sum, inst) => sum + inst.amount, 0);
  }

  payFull(): void {
    debugger;
    const amount = this.isEligibleForDiscount ? this.PaymentDetails.discountedAmount : this.PaymentDetails.fullAmount;
    console.log('Paying full amount:', amount);

    const payment: StudentPaymentDetails = new StudentPaymentDetails();
    payment.studentId = this.studentId;
    payment.isFullPayment = true;
    payment.amountPaid = amount;
    payment.paymentDate = new Date();
    payment.selectedInstallmentIds = [];
    this._PaymentService.SubmitPayment(payment).subscribe((data: any) => {
      this.notify.success('Payment submitted successfully');
    });
  }

  payInstallments(): void {
    const selected = this.PaymentDetails.installments.filter((inst) => inst.selected && inst.status !== PaymentStatus.Paid);
    console.log('Paying selected installments:', selected);
    // TODO: Integrate payment logic
    const payment: StudentPaymentDetails = new StudentPaymentDetails();
    payment.studentId = this.studentId;
    payment.isFullPayment = false;
    payment.amountPaid = selected.reduce((sum, inst) => sum + inst.amount, 0);
    payment.paymentDate = new Date();
    payment.selectedInstallmentIds = selected.map((inst) => inst.id);
    this._PaymentService.SubmitPayment(payment).subscribe((data: any) => {
      this.notify.success('Payment submitted successfully');
    });
  }
  private mapPaymentStatus(status: number): string {
    switch (status) {
      case 0:
        return 'New';
      case 1:
        return 'Pending';
      case 2:
        return 'Paid';
      case 3:
        return 'Failed';
      case 4:
        return 'Canceled';
      default:
        return 'Unknown';
    }
  }
  private isFullPayment(details: PaymentDetails) {
    this.isFulPaymentPaid = (details.PaymentStatus === 'Paid' || details.PaymentStatus === 'Pending') && details.installments.length === 0;
  }
  isInstallmentsPayment(details: PaymentDetails) {
    this.isInstallmentsPaid = details.installments.filter((x) => x.status === PaymentStatus.Paid || x.status === PaymentStatus.Pending).length > 0;
  }
  isSubscribedToBus(details: PaymentDetails) {
    this.isBusSubscribed = details.busLines.filter((x) => x.isSubscribed).length > 0;
  }
  subscribeToBus(): void {
    console.log('Subscribing to bus line:', this.selectedBusLineId, 'Note:', this.subscriptionNote);
    const studentSubscribtion: StudentSubscribtion = new StudentSubscribtion();
    studentSubscribtion.studentId = this.studentId;
    studentSubscribtion.BusLineId = this.selectedBusLineId;
    studentSubscribtion.notes = this.subscriptionNote;
    debugger;
    this._PaymentService.SubmitBusSbscriptio(studentSubscribtion).subscribe((data: any) => {
      this.notify.success('Subscription submitted successfully');
    });
  }
  get subscribedBusName(): string | null {
    const bus = this.PaymentDetails.busLines.find((b) => b.isSubscribed);

    return bus ? bus.name : null;
  }
  get subscribedBusStatus(): SubscriptionStatus | null {
    const bus = this.PaymentDetails.busLines.find((b) => b.isSubscribed);
    return bus ? bus.subscriptionStatus : null;
  }
}
export class PaymentDetails {
  student!: StudentDTO;
  paymentMode: 'full' | 'installments' = 'full';
  fullAmount!: number;
  discountedAmount!: number;
  PaymentStatus: string;
  fullPaymentDueDate!: Date;
  installments: {
    id: number;
    dueDate: Date;
    amount: number;
    status: PaymentStatus;
    selected: boolean;
  }[] = [];
  busLines: {
    id: number;
    name: string;
    expectedAmount: number;
    isSubscribed: boolean;
    subscriptionStatus: SubscriptionStatus;
  }[] = [];
  selectedBusLineId: number | null = null;
  subscriptionNote: string = '';
}
export enum PaymentStatus {
  New = 0,
  Pending = 1,
  Paid = 2,
  Failed = 3,
  Canceled = 4,
}
export enum SubscriptionStatus {
  Pending = 0,
  Approved = 1,
  Rejected = 2,
}
