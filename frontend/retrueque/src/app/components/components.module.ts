import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AppRoutingModule } from '../app-routing.module';
import { ReactiveFormsModule } from '@angular/forms';

import { HomeComponent } from './home/home.component';
import { ProductosComponent } from './productos/productos.component';
import { QuienessomosComponent } from './quienessomos/quienessomos.component';
import { ContactoComponent } from './contacto/contacto.component';
import { LoginComponent } from './login/login.component';
import { RegistroComponent } from './registro/registro.component';
import { CarritoComponent } from './carrito/carrito.component';


@NgModule({
  declarations: [
    HomeComponent,
    ProductosComponent,
    QuienessomosComponent,
    ContactoComponent,
    LoginComponent,
    RegistroComponent,
    CarritoComponent,
  ],
  imports: [
    CommonModule,
    AppRoutingModule,
    ReactiveFormsModule
  ],
  exports: [HomeComponent,
    ProductosComponent,
    QuienessomosComponent,
    ContactoComponent]
})
export class ComponentsModule { }
