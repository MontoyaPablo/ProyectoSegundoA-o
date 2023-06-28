import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NavprivadoComponent } from './navprivado.component';

describe('NavprivadoComponent', () => {
  let component: NavprivadoComponent;
  let fixture: ComponentFixture<NavprivadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NavprivadoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NavprivadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
