import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GraphProgressComponent } from './graph-progress.component';

describe('GraphProgressComponent', () => {
  let component: GraphProgressComponent;
  let fixture: ComponentFixture<GraphProgressComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GraphProgressComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GraphProgressComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
