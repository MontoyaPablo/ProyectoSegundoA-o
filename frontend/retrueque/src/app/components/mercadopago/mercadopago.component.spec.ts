import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MercadopagoComponent } from './mercadopago.component';

describe('MercadopagoComponent', () => {
  let component: MercadopagoComponent;
  let fixture: ComponentFixture<MercadopagoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MercadopagoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MercadopagoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
