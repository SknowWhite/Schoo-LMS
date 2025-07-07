import { ChangeDetectorRef, Component, Injector } from "@angular/core";
import {
  adminBusSubscriptionsServiceProxy,
  pagedAdminBusSucbription,
  AdminStudentBusSubscriptionDto,
  AdminUpdateStudentBusSubscriptionDto,
  BusFeesPlanDto,
  pagedBusFeesPlanDto,
} from "../../shared/service-proxies/service-proxies";
import {
  PagedListingComponentBase,
  PagedRequestDto,
} from "../../shared/paged-listing-component-base";
import { finalize } from "rxjs/operators";

@Component({
  selector: "app-admin-bus-subscription",
  templateUrl: "./admin-bus-subscription.component.html",
  styleUrls: ["./admin-bus-subscription.component.css"],
})
export class AdminBusSubscriptionComponent extends PagedListingComponentBase<AdminStudentBusSubscriptionDto> {
  keyword: any;
  subscriptions: AdminStudentBusSubscriptionDto[] = [];
  busLines: BusFeesPlanDto[] = [];
  subscriptionStatus = subscriptionStatus;

  studentSubscription: AdminStudentBusSubscriptionDto | null = null;

  // Form fields for students
  selectedLine: string;
  notes: string;

  // Columns for the table
  displayedColumns: string[] = [];

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
    this.setDisplayedColumns();
  }

  protected list(
    request: PagedRequestDto,
    pageNumber: number,
    finishedCallback: Function
  ): void {
    request.keyword = this.keyword;
    this.loadData();
  }

  protected delete(entity: AdminStudentBusSubscriptionDto): void {
    abp.message.confirm(
      this.l("DeleteBusSubscription"),
      undefined,
      (result: boolean) => {
        if (result) {
          this.service
            .delete(entity.studentId)
            .pipe(
              finalize(() => {
                abp.notify.success(this.l("SuccessfullyDeleted"));
                this.loadData();
                this.refresh();
              })
            )
            .subscribe();
        }
      }
    );
  }

  loadBusLines(): void {
    this.service.GetBusFeesPlanAll("", 0, 1000).subscribe((data: any) => {
      debugger;
      this.busLines = data;
      this.cd.detectChanges();
    });
  }
  loadData(): void {
    this.service.getAll("", 0, 1000).subscribe((data: any) => {
      if (this.isAdmin) {
        this.subscriptions = data;
      } else {
        this.subscriptions = data.filter(
          (sub) => sub.studentName === this.appSession.getShownLoginName()
        );
        this.studentSubscription = this.subscriptions[0] || null;

        if (this.studentSubscription) {
          this.selectedLine = this.studentSubscription.busLineName;
          this.notes = this.studentSubscription.notes;
        }
      }

      this.cd.detectChanges();
    });
  }

  changeStatus(sub: AdminStudentBusSubscriptionDto, status: number): void {
    const request: AdminUpdateStudentBusSubscriptionDto = {
      studentId: sub.studentId,
      busFeePlanId: this.getBusFeePlanIdByLine(sub.busLineName),
      notes: sub.notes,
      status: status,
    };
    abp.message.confirm(
      this.l("UpdateBusSubscriptionStatus"),
      undefined,
      (result: boolean) => {
        if (result) {
          this.service.updateRequest(request).subscribe(() => {
            this.loadData();
          });
        }
      }
    );
  }

  updateSubscription(sub: AdminStudentBusSubscriptionDto): void {
    const request: AdminUpdateStudentBusSubscriptionDto = {
      studentId: sub.studentId,
      busFeePlanId: this.getBusFeePlanIdByLine(sub.busLineName),
      notes: sub.notes,
      status: sub.status,
    };
    abp.message.confirm(
      this.l("UpdateBusSubscription"),
      undefined,
      (result: boolean) => {
        if (result) {
          this.service.updateRequest(request).subscribe(() => {
            abp.notify.success("Updated successfully");
            this.loadData();
          });
        }
      }
    );
  }

  submitSubscription(): void {
    const selectedPlan = this.busLines.find(
      (line) => line.line === this.selectedLine
    );
    if (!selectedPlan) return;
    var studentId = 0;
    if (!this.studentSubscription) {
      studentId = this.appSession.userId;
    } else {
      studentId = this.studentSubscription.studentId;
    }

    const request: AdminUpdateStudentBusSubscriptionDto = {
      studentId: studentId,
      busFeePlanId: selectedPlan.id,
      notes: this.notes,
      status: subscriptionStatus.Pending,
    };

    abp.message.confirm(
      this.l("UpdateBusSubscription"),
      undefined,
      (result: boolean) => {
        if (result) {
          this.service.updateRequest(request).subscribe(() => {
            abp.notify.success(
              this.studentSubscription
                ? "Subscription updated"
                : "Subscription submitted"
            );
            this.loadData();
          });
        }
      }
    );
  }

  getBusFeePlanIdByLine(lineName: string): number {
    const plan = this.busLines.find((line) => line.line === lineName);
    return plan ? plan.id : 0;
  }

  hasRole(role: string): boolean {
    return this.appSession.userRoles?.includes(role);
  }

  get isAdmin(): boolean {
    return this.hasRole("Admin");
  }

  private setDisplayedColumns(): void {
    this.displayedColumns = ["studentName", "busLine", "notes", "status"];
    if (this.isAdmin) {
      this.displayedColumns.push("actions");
    }
  }
}

export enum subscriptionStatus {
  Pending = 0,
  Approved = 1,
  Rejected = 2,
}
