import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AppRoutingModule } from '../app-routing.module';


import { HomeComponent } from './home/home.component';
import { ProductosComponent } from './productos/productos.component';
import { QuienessomosComponent } from './quienessomos/quienessomos.component';
import { ContactoComponent } from './contacto/contacto.component';
import { ReactiveFormsModule } from '@angular/forms';
import { FormularioRegistroComponent } from './formulario-registro/formulario-registro.component';


@NgModule({
  declarations: [
    HomeComponent,
    ProductosComponent,
    QuienessomosComponent,
    ContactoComponent,
    FormularioRegistroComponent,
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
