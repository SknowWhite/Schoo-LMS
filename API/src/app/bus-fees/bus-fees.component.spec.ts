import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BusFeesComponent } from './bus-fees.component';

describe('BusFeesComponent', () => {
  let component: BusFeesComponent;
  let fixture: ComponentFixture<BusFeesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BusFeesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BusFeesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
