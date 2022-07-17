import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReccomendationMainComponent } from './reccomendation-main.component';

describe('ReccomendationMainComponent', () => {
  let component: ReccomendationMainComponent;
  let fixture: ComponentFixture<ReccomendationMainComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReccomendationMainComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ReccomendationMainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
