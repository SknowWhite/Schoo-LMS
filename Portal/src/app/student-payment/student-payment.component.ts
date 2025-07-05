import { ChangeDetectorRef, Component, Injector, OnInit } from '@angular/core';
import { AppComponentBase } from '@shared/app-component-base';
import {
  EducationalPaymentServiceProxy,
  StudentDTO,
  StudentPaymentDetails,
  StudentSubscribtion,
} from '@shared/service-proxies/service-proxies';

@Component({
  selector: 'app-student-payment',
  templateUrl: './student-payment.component.html',
  styleUrls: ['./student-payment.component.css'],
})
export class StudentPaymentComponent extends AppComponentBase implements OnInit {
  studentId = 0;

  isFulPaymentPaid: boolean = false;
  isInstallmentsPaid: boolean = false;
  fawryLink: string | null = null;

  selectedInstallmentId: number | null = null;

  PaymentDetails: PaymentDetails = new PaymentDetails();

  constructor(
    private cdr: ChangeDetectorRef,
    injector: Injector,
    private _PaymentService: EducationalPaymentServiceProxy
  ) {
    super(injector);
  }

  ngOnInit(): void {
    this._PaymentService.getStudentByName(this.appSession.getShownLoginName()).subscribe((data: any) => {
      this.studentId = data.studentId;
      this.refreshPaymentData();
    });
  }

  refreshPaymentData(): void {
    this._PaymentService.getEduPaymentData(this.studentId).subscribe((data: any) => {
      const paymentDetails: PaymentDetails = new PaymentDetails();
      paymentDetails.student = data.studentInfo;
      paymentDetails.busLines = data.busLines.map((bus: any) => ({
        id: bus.id,
        name: bus.name,
        amount: bus.amount,
        status: this.mapPaymentStatus(bus.paymentStatus),
        invoiceNumber: bus.invoiceNumber
      }));

      const hasFullPayment = data.educationalPayments.some(p => p.isFullPayment);
      paymentDetails.paymentMode = hasFullPayment ? 'full' : 'installments';

      const fullPayment = data.educationalPayments.find(p => p.isFullPayment);
      if (fullPayment) {
        paymentDetails.fullAmount = fullPayment.amountPaid;
        paymentDetails.discountedAmount = fullPayment.amountPaid * 0.95;
        paymentDetails.fullPaymentDueDate = new Date(fullPayment.paymentDate);
        paymentDetails.PaymentStatus = this.mapPaymentStatus(fullPayment.paymentStatus);
        paymentDetails.invoiceNumber = fullPayment.invoiceNumber;

      }

      paymentDetails.installments = data.educationalPayments
        .filter(p => !p.isFullPayment)
        .map(p => ({
          id: p.id,
          dueDate: new Date(p.paymentDate),
          amount: p.amountPaid,
          status: this.mapPaymentStatus(p.paymentStatus),
          invoiceNumber: p.invoiceNumber
        }));

      this.PaymentDetails = paymentDetails;
      this.isFullPayment(this.PaymentDetails);
      this.isInstallmentsPayment(this.PaymentDetails);
      this.cdr.detectChanges();
    });
  }

  get isEligibleForDiscount(): boolean {
    return new Date() <= this.PaymentDetails.fullPaymentDueDate;
  }

  getSelectedInstallmentAmount(): number {
    const inst = this.PaymentDetails.installments.find(i => i.id === this.selectedInstallmentId);
    return inst ? inst.amount : 0;
  }

  payFull(): void {
    const amount = this.isEligibleForDiscount ? this.PaymentDetails.discountedAmount : this.PaymentDetails.fullAmount;
    const payment = new StudentPaymentDetails();
    payment.studentId = this.studentId;
    payment.isFullPayment = true;
    payment.amountPaid = amount;
    payment.paymentDate = new Date();
    payment.selectedInstallmentIds =0;

    this._PaymentService.SubmitPayment(payment).subscribe((data: any) => {
      this.fawryLink = data;
      this.notify.success('Full payment submitted successfully!');
      this.refreshPaymentData();
    });
  }

  paySelectedInstallment(): void {
    if (!this.selectedInstallmentId) return;

    const payment = new StudentPaymentDetails();
    payment.studentId = this.studentId;
    payment.isFullPayment = false;
    payment.amountPaid = this.getSelectedInstallmentAmount();
    payment.paymentDate = new Date();
    payment.selectedInstallmentIds = this.selectedInstallmentId;

    this._PaymentService.SubmitPayment(payment).subscribe((data: any) => {
      this.fawryLink = data;
      this.notify.success('Installment payment submitted successfully!');
      this.refreshPaymentData();
    });
  }

  private mapPaymentStatus(status: number): string {
    switch (status) {
      case 0: return 'New';
      case 1: return 'Pending';
      case 2: return 'Paid';
      case 3: return 'Failed';
      case 4: return 'Canceled';
      default: return 'Unknown';
    }
  }

  private isFullPayment(details: PaymentDetails) {
    this.isFulPaymentPaid = (details.PaymentStatus === 'Paid' || details.PaymentStatus === 'Pending') && details.installments.length === 0;
  }

  private isInstallmentsPayment(details: PaymentDetails) {
    this.isInstallmentsPaid = details.installments.some(x => x.status === 'Paid' || x.status === 'Pending');
  }
payBus(): void {
  const selectedBus = this.PaymentDetails.busLines.find(x => x.id === this.PaymentDetails.selectedBusLineId);
  if (!selectedBus || selectedBus.status === 'Paid') return;

  const payment = new StudentPaymentDetails();
  payment.studentId = this.studentId;
  payment.isFullPayment = false;
  //payment.amountPaid = selectedBus.amount;
  payment.paymentDate = new Date();
  payment.selectedInstallmentIds = 0; // for bus

 /* this._PaymentService.SubmitBusPayment(payment).subscribe((data: any) => {
    this.fawryLink = data;
    this.notify.success('Bus payment submitted successfully!');
    this.refreshPaymentData();
  });*/
}

isBusLinePaymentDisabled(): boolean {
  const selectedId = this.PaymentDetails.selectedBusLineId;
  if (!selectedId) return true;

  const selected = this.PaymentDetails.busLines.find(x => x.id === selectedId);
  return !selected || selected.status === 'Paid';
}
}

export class PaymentDetails {
  student!: StudentDTO;
  paymentMode: 'full' | 'installments' = 'full';
  fullAmount!: number;
  discountedAmount!: number;
  PaymentStatus: string = '';
  fullPaymentDueDate!: Date;
  invoiceNumber?: string;
busLines: {
  id: number;
  name: string;
  notes: string;
  status: string;
  invoiceNumber?: string;
}[];

selectedBusLineId?: number;

  installments: {
    id: number;
    dueDate: Date;
    amount: number;
    status: string;
      invoiceNumber?: string; // <-- NEW

  }[] = [];
}

