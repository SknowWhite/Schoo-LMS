import { ChangeDetectorRef, Component, Injector, OnInit } from '@angular/core';
import { AppComponentBase } from '@shared/app-component-base';
import { appModuleAnimation } from '@shared/animations/routerTransition';
import { HomepageDashboard } from '@shared/service-proxies/service-proxies';

@Component({
  templateUrl: './home.component.html',
  animations: [appModuleAnimation()],
})
export class HomeComponent extends AppComponentBase implements OnInit {
  busLinesCount = 0;
  studentCount = 0;
  studentFullPaidCount = 0;
  studentSubscribedToBusCount = 0;
  isStudent = false;
  // For Chart
  chartData: any;

  constructor(
    injector: Injector,
    private cdr: ChangeDetectorRef,
    private _dashboardService: HomepageDashboard
  ) {
    super(injector);
  }

  ngOnInit(): void {
    
    this._dashboardService.getHomepageDashboard().subscribe((data) => {
      this.busLinesCount = data.busLinesCount;
      this.studentCount = data.studentCount;
      this.studentFullPaidCount = data.studentFullPaidCount;
      this.studentSubscribedToBusCount = data.studentSubscribedToBusCount;
      
      this.isStudent = this.appSession.user?.roles?.includes('Student');
      this.cdr.detectChanges();
    });
  }
}
