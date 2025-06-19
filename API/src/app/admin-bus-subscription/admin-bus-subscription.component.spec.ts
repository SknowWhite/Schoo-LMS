import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminBusSubscriptionComponent } from './admin-bus-subscription.component';

describe('AdminBusSubscriptionComponent', () => {
  let component: AdminBusSubscriptionComponent;
  let fixture: ComponentFixture<AdminBusSubscriptionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AdminBusSubscriptionComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AdminBusSubscriptionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
