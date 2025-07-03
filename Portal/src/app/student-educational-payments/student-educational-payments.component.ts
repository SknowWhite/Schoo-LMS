import { ChangeDetectorRef, Component, Injector, OnInit } from '@angular/core';
import { AppComponentBase } from '../../shared/app-component-base';
import { FormBuilder, FormGroup } from '@angular/forms';
import { EducationalPaymentServiceProxy } from '@shared/service-proxies/service-proxies';

@Component({
  selector: 'app-student-educational-payments',
  templateUrl: './student-educational-payments.component.html',
  styleUrls: ['./student-educational-payments.component.css']
})
export class StudentEducationalPaymentsComponent extends AppComponentBase implements OnInit {

  constructor(
    private cdr: ChangeDetectorRef,
    injector: Injector,
    private _paymentService: EducationalPaymentServiceProxy,
    private fb: FormBuilder
  ) {
    super(injector);
  }

  searchForm!: FormGroup;
  filteredStudents: StudentEductionalPaymentDto[] = [];
  pageNumber: number = 1;
  pageSize: number = 10;
  totalCount: number = 0;

  ngOnInit(): void {
    this.searchForm = this.fb.group({
      name: [''],
      mobileNumber: ['']
    });

    this.loadStudents();
  }

  onSearch(): void {
    this.pageNumber = 1;
    this.loadStudents();
  }

loadStudents(): void {
  const { name, mobileNumber } = this.searchForm.value;

  this._paymentService.getAllStudentWithPayments(name, mobileNumber, this.pageNumber, this.pageSize)
    .subscribe(result => {
      this.filteredStudents = result.items;
      this.totalCount = result.totalCount;
      this.pageNumber = result.pageNumber;
      this.cdr.detectChanges();
    });
}


  onPageChange(newPage: number): void {
    this.pageNumber = newPage;
    this.loadStudents();
  }

  onClear(): void {
  this.searchForm.reset();
  this.pageNumber = 1;
  this.loadStudents();
}

}
export interface StudentEductionalPaymentDto {
  studentId: number;
  name: string;
  amountPaid: number;
  paymentDate: string; // or Date if you parse it
  installments: string;
  grade: string;
  mobileNumber: string;
  previousAmount: number;
}
