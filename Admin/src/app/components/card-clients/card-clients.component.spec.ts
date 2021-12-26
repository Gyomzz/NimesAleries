import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CardClientsComponent } from './card-clients.component';

describe('CardClientsComponent', () => {
  let component: CardClientsComponent;
  let fixture: ComponentFixture<CardClientsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CardClientsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CardClientsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
