import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../../shared/shared.module';
import { StudentPaymentRoutingModule } from './student-payment-routing.module';
import { StudentPaymentComponent } from './student-payment.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [StudentPaymentComponent],
  imports: [CommonModule, StudentPaymentRoutingModule, SharedModule, ReactiveFormsModule],
})
export class StudentPaymentModule {}
