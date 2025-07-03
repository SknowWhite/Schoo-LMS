import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { StudentEducationalPaymentsComponent } from './student-educational-payments.component';

const routes: Routes = [
  {
      path: '',
      component: StudentEducationalPaymentsComponent,
      pathMatch: 'full',
  },
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StudentEducationalPaymentsRoutingModule { }
