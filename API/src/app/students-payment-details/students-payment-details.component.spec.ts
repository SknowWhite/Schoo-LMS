import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentsPaymentDetailsComponent } from './students-payment-details.component';

describe('StudentsPaymentDetailsComponent', () => {
  let component: StudentsPaymentDetailsComponent;
  let fixture: ComponentFixture<StudentsPaymentDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [StudentsPaymentDetailsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(StudentsPaymentDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
