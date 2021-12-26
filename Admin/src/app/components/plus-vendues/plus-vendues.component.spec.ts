import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PlusVenduesComponent } from './plus-vendues.component';

describe('PlusVenduesComponent', () => {
  let component: PlusVenduesComponent;
  let fixture: ComponentFixture<PlusVenduesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PlusVenduesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PlusVenduesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
