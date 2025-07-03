import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { StudentEducationalPaymentsRoutingModule } from './student-educational-payments-routing.module';
import { SharedModule } from '../../shared/shared.module';
import { StudentEducationalPaymentsComponent } from './student-educational-payments.component';

@NgModule({
  declarations: [StudentEducationalPaymentsComponent],
  imports: [CommonModule, StudentEducationalPaymentsRoutingModule, SharedModule, ReactiveFormsModule],
})
export class StudentEducationalPaymentsModule {}
