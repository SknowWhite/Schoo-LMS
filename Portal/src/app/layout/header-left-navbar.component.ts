import { Component, ChangeDetectionStrategy, OnInit } from '@angular/core';
import { LayoutStoreService } from '@shared/layout/layout-store.service';
import { AppSessionService } from '@shared/session/app-session.service';

@Component({
  selector: 'header-left-navbar',
  templateUrl: './header-left-navbar.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class HeaderLeftNavbarComponent implements OnInit {
  sidebarExpanded: boolean;

  constructor(private _layoutStore: LayoutStoreService,private appSession: AppSessionService) {}

  ngOnInit(): void {
    this._layoutStore.sidebarExpanded.subscribe((value) => {
      this.sidebarExpanded = value;
    });
  }

  toggleSidebar(): void {
    this._layoutStore.setSidebarExpanded(!this.sidebarExpanded);
  }
  
  hasRole(role: string): boolean {
    return this.appSession.userRoles?.includes(role);
  }
  
}
