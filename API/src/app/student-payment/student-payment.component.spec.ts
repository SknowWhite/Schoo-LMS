import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentPaymentComponent } from './student-payment.component';

describe('StudentPaymentComponent', () => {
  let component: StudentPaymentComponent;
  let fixture: ComponentFixture<StudentPaymentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [StudentPaymentComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(StudentPaymentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
