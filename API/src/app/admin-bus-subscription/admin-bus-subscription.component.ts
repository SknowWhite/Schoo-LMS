import { ChangeDetectorRef, Component, Injector } from '@angular/core';
import { adminBusSubscriptionsServiceProxy, pagedAdminBusSucbription } from '../../shared/service-proxies/service-proxies';
import { PagedListingComponentBase, PagedRequestDto } from '../../shared/paged-listing-component-base';
import { getActionCache } from '@node_modules/@angular/core/primitives/event-dispatch';

@Component({
  selector: 'app-admin-bus-subscription',
  templateUrl: './admin-bus-subscription.component.html',
  styleUrl: './admin-bus-subscription.component.css',
})
export class AdminBusSubscriptionComponent extends PagedListingComponentBase<AdminStudentBusSubscriptionDto>  {
  keyword: any;
  protected list(request: PagedRequestDto, pageNumber: number, finishedCallback: Function): void {
    alert('list');
    request.keyword = this.keyword;
    this.loadData();
  }
  protected delete(entity: AdminStudentBusSubscriptionDto): void {
  }
  subscriptions: AdminStudentBusSubscriptionDto[];
  busLines: BusFeesPlanDto[];
  subscriptionStatus = subscriptionStatus;


  constructor(    
    injector: Injector,
    private service: adminBusSubscriptionsServiceProxy,    
    cd: ChangeDetectorRef
  ) {
    super(injector, cd);
  }

  ngOnInit(): void {
    this.loadBusLines();
    this.loadData();
  }
  loadBusLines() {
    this.service.GetBusFeesPlanAll('',0,1000).subscribe((data:any) => {
      this.busLines = data;
      console.log(data);
      this.cd.detectChanges();

    });
    }

  loadData() {
    this.service.getAll('',0,1000).subscribe((data:any) => {
      this.subscriptions = data;
      console.log(data);
      console.log(this.subscriptions);
      this.cd.detectChanges();

    });
  }

  changeStatus(sub: any, status: number): void {
    const request: AdminUpdateStudentBusSubscriptionDto = {
      studentId: sub.studentId,
      busFeePlanId: sub.busFeePlanId,
      notes: sub.notes,
      status: status
    };
  
    this.service.updateRequest(request).subscribe({
      next: () => {
        this.loadData(); // refresh list
      },
      error: () => {
      }
    });
  }
  

}

export enum subscriptionStatus {
  Pending = 0,
  Approved = 1,
  Rejected = 2
}

export interface AdminStudentBusSubscriptionDto {
  studentId: number;
  studentName: string;
  busFeePlanId: number;
  busLineName: string;
  notes: string;
  status: number;
}

export interface AdminUpdateStudentBusSubscriptionDto {
  studentId: number;
  busFeePlanId: number;
  notes?: string;
  status: number; // Use the `subscriptionStatus` enum
}

export interface BusFeesPlanDto {
  id: number;
  line?: string;
}