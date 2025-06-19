import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImortedStudentComponent } from './imorted-student.component';

describe('ImortedStudentComponent', () => {
  let component: ImortedStudentComponent;
  let fixture: ComponentFixture<ImortedStudentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ImortedStudentComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ImortedStudentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
