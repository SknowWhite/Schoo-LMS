import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentPaymentsNewLogicComponent } from './student-payments-new-logic.component';

describe('StudentPaymentsNewLogicComponent', () => {
  let component: StudentPaymentsNewLogicComponent;
  let fixture: ComponentFixture<StudentPaymentsNewLogicComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [StudentPaymentsNewLogicComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(StudentPaymentsNewLogicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
