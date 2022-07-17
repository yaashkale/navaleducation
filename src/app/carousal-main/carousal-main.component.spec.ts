import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CarousalMainComponent } from './carousal-main.component';

describe('CarousalMainComponent', () => {
  let component: CarousalMainComponent;
  let fixture: ComponentFixture<CarousalMainComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CarousalMainComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CarousalMainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
