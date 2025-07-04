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
  pageSizeOptions = [5, 10, 20, 50, 100]; // you can change these as you like

  installmentOptions = [
    { label: 'Installment 1', value: 'installment1' },
    { label: 'Installment 2', value: 'installment2' },
    { label: 'Installment 3', value: 'installment3' },
    { label: 'Installment 4', value: 'installment4' },
    { label: 'Full', value: 'full' },
    { label: 'Subscribed to Bus', value: 'bus' }
  ];

ngOnInit(): void {
  this.searchForm = this.fb.group({
    name: [''],
    mobileNumber: [''],
    studentId: [''],  
    grade: [''],     
    installments: ['']
  });

  this.loadStudents();
}


  onSearch(): void {
    this.pageNumber = 1;
    this.loadStudents();
  }

loadStudents(): void {
  const { name, mobileNumber, studentId, grade, installments } = this.searchForm.value;

  this._paymentService
    .getAllStudentWithPayments(
      name,
      mobileNumber,
      this.pageNumber,
      this.pageSize,
      installments,
      studentId,
      grade
    )
    .subscribe((result) => {
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
  this.searchForm.reset({
    installments: '' // set to match placeholder value
  });
  this.pageNumber = 1;
  this.loadStudents();
}


  onPageSizeChange(event: any): void {
  this.pageNumber = 1; // Reset to first page
  this.loadStudents(); // Reload data with new page size
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
  busInstallments : string;
  isBusSubscribed : boolean;
}
