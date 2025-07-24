import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminInstallmentsComponent } from './admin-installments.component';

describe('AdminInstallmentsComponent', () => {
  let component: AdminInstallmentsComponent;
  let fixture: ComponentFixture<AdminInstallmentsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AdminInstallmentsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AdminInstallmentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
