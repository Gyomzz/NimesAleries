import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GraphVisitesComponent } from './graph-visites.component';

describe('GraphVisitesComponent', () => {
  let component: GraphVisitesComponent;
  let fixture: ComponentFixture<GraphVisitesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GraphVisitesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GraphVisitesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
