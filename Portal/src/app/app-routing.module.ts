import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AppRouteGuard } from '@shared/auth/auth-route-guard';
import { AppComponent } from './app.component';
import { AdminBusSubscriptionComponent } from './admin-bus-subscription/admin-bus-subscription.component';
import { BusFeesComponent } from './bus-fees/bus-fees.component';
import { StudentsPaymentDetailsComponent } from './students-payment-details/students-payment-details.component';

@NgModule({
  imports: [
    RouterModule.forChild([
      {
        path: '',
        component: AppComponent,
        children: [
          {
            path: 'home',
            loadChildren: () => import('./home/home.module').then((m) => m.HomeModule),
            canActivate: [AppRouteGuard],
          },
          {
            path: 'about',
            loadChildren: () => import('./about/about.module').then((m) => m.AboutModule),
            canActivate: [AppRouteGuard],
          },
          {
            path: 'users',
            loadChildren: () => import('./users/users.module').then((m) => m.UsersModule),
            data: { permission: 'Pages.Users' },
            canActivate: [AppRouteGuard],
          },
          {
            path: 'roles',
            loadChildren: () => import('./roles/roles.module').then((m) => m.RolesModule),
            data: { permission: 'Pages.Roles' },
            canActivate: [AppRouteGuard],
          },
          {
            path: 'tenants',
            loadChildren: () => import('./tenants/tenants.module').then((m) => m.TenantsModule),
            data: { permission: 'Pages.Tenants' },
            canActivate: [AppRouteGuard],
          },
          {
            path: 'update-password',
            loadChildren: () => import('./users/users.module').then((m) => m.UsersModule),
            canActivate: [AppRouteGuard],
          },
          {
            path: 'students',
            loadChildren: () => import('./students/students.module').then((m) => m.StudentsModule),
            canActivate: [AppRouteGuard],
           
          },
          {
            path: 'studentPayment',
            loadChildren: () => import('./student-payment/student-payment.module').then((m) => m.StudentPaymentModule),
            canActivate: [AppRouteGuard],
          } /*{
            path: 'importedStudents',
            loadChildren: () => import('./imorted-student/').then((m) => m.StudentPaymentModule),
            canActivate: [AppRouteGuard],
          },*/,
          {
            path: 'StudentEducationalPayments',
            loadChildren: () => import('./student-educational-payments/student-educational-payments.module').then((m) => m.StudentEducationalPaymentsModule),
            canActivate: [AppRouteGuard],
          }
          ,
          {
              path: 'AdminBusSubscription',
              component: AdminBusSubscriptionComponent,
              canActivate: [AppRouteGuard],
              pathMatch: 'full', 
          },
          {
              path: 'busFees',
              component: BusFeesComponent,
              canActivate: [AppRouteGuard],
              pathMatch: 'full',
          },
           {
              path: 'StudentsPaymentDetails',
              component: StudentsPaymentDetailsComponent,
              canActivate: [AppRouteGuard],
              pathMatch: 'full',
          },
        ],
      },
    ]),
  ],
  exports: [RouterModule],
})
export class AppRoutingModule {}
