import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlusVenduesItemsComponent } from './plus-vendues-items.component';

describe('PlusVenduesItemsComponent', () => {
  let component: PlusVenduesItemsComponent;
  let fixture: ComponentFixture<PlusVenduesItemsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlusVenduesItemsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PlusVenduesItemsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
