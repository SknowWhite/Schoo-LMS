import { Component, Injector, OnInit } from "@angular/core";
import { AppComponentBase } from "@shared/app-component-base";
import {
  Router,
  RouterEvent,
  NavigationEnd,
  PRIMARY_OUTLET,
} from "@angular/router";
import { BehaviorSubject } from "rxjs";
import { filter } from "rxjs/operators";
import { MenuItem } from "@shared/layout/menu-item";

@Component({
  selector: "sidebar-menu",
  templateUrl: "./sidebar-menu.component.html",
})
export class SidebarMenuComponent extends AppComponentBase implements OnInit {
  menuItems: MenuItem[];
  menuItemsMap: { [key: number]: MenuItem } = {};
  activatedMenuItems: MenuItem[] = [];
  routerEvents: BehaviorSubject<RouterEvent> = new BehaviorSubject(undefined);
  homeRoute = "/app/about";
  isStudent: boolean = false;

  constructor(injector: Injector, private router: Router) {
    super(injector);
  }

  ngOnInit(): void {
    this.isStudent = this.appSession.user?.roles?.includes("Student");
    this.menuItems = this.getMenuItems();
    this.patchMenuItems(this.menuItems);

    this.router.events.subscribe((event: NavigationEnd) => {
      const currentUrl = event.url !== "/" ? event.url : this.homeRoute;
      const primaryUrlSegmentGroup =
        this.router.parseUrl(currentUrl).root.children[PRIMARY_OUTLET];
      if (primaryUrlSegmentGroup) {
        this.activateMenuItems("/" + primaryUrlSegmentGroup.toString());
      }
    });
  }

  getMenuItems(): MenuItem[] {
    if (this.isStudent) {
      // ✅ Minimal menu for students
      return [
        new MenuItem(this.l("HomePage"), "/app/home", "fas fa-home"),
        new MenuItem(
          this.l("Educational Payments"),
          "/app/studentPayment",
          "fas fa-credit-card"
        ),
        new MenuItem(
          this.l(" Bus Subscription"),
          "/app/AdminBusSubscription",
          "fas fa-bus"
        ),
        new MenuItem(
          this.l("Bus Fees - under progress"),
          "/app/busFees",
          "fas fa-money-bill"
        ),
      ];
    } else {
      // ✅ Full menu for other users
      return [
        // new MenuItem(this.l('Users'), '/app/users', 'fas fa-users', 'Pages.Users'),
        // new MenuItem(this.l('Roles'), '/app/roles', 'fas fa-theater-masks', 'Pages.Roles'),
        new MenuItem(this.l("HomePage"), "/app/home", "fas fa-home"),
        new MenuItem(
          this.l("Tenants"),
          "/app/tenants",
          "fas fa-building",
          "Pages.Tenants"
        ),
        new MenuItem(
          this.l("Students"),
          "/app/students",
          "fas fa-user-graduate"
        ),
        new MenuItem(
          this.l("student Payment"),
          "/app/studentPayment",
          "fas fa-credit-card",
          "student"
        ),

        new MenuItem(
          this.l("Bus Subscription"),
          "/app/AdminBusSubscription",
          "fas fa-bus"
        ),
        new MenuItem(
          this.l("Student Payment Details"),
          "/app/StudentEducationalPayments",
          "fas fa-receipt"
        ),
      ];
    }
  }

  patchMenuItems(items: MenuItem[], parentId?: number): void {
    items.forEach((item: MenuItem, index: number) => {
      item.id = parentId ? Number(parentId + "" + (index + 1)) : index + 1;
      if (parentId) {
        item.parentId = parentId;
      }
      if (parentId || item.children) {
        this.menuItemsMap[item.id] = item;
      }
      if (item.children) {
        this.patchMenuItems(item.children, item.id);
      }
    });
  }

  activateMenuItems(url: string): void {
    this.deactivateMenuItems(this.menuItems);
    this.activatedMenuItems = [];
    const foundedItems = this.findMenuItemsByUrl(url, this.menuItems);
    foundedItems.forEach((item) => {
      this.activateMenuItem(item);
    });
  }

  deactivateMenuItems(items: MenuItem[]): void {
    items.forEach((item: MenuItem) => {
      item.isActive = false;
      item.isCollapsed = true;
      if (item.children) {
        this.deactivateMenuItems(item.children);
      }
    });
  }

  findMenuItemsByUrl(
    url: string,
    items: MenuItem[],
    foundedItems: MenuItem[] = []
  ): MenuItem[] {
    items.forEach((item: MenuItem) => {
      if (item.route === url) {
        foundedItems.push(item);
      } else if (item.children) {
        this.findMenuItemsByUrl(url, item.children, foundedItems);
      }
    });
    return foundedItems;
  }

  activateMenuItem(item: MenuItem): void {
    item.isActive = true;
    if (item.children) {
      item.isCollapsed = false;
    }
    this.activatedMenuItems.push(item);
    if (item.parentId) {
      this.activateMenuItem(this.menuItemsMap[item.parentId]);
    }
  }

  isMenuItemVisible(item: MenuItem): boolean {
    if (item.label == "Multi Level Menu") {
      item.permissionName = "Multi Level Menu";
    }
    if (!item.permissionName) {
      return true;
    }
    return this.permission.isGranted(item.permissionName);
  }
}
