import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './shared/login/login.component';
import { NavComponent } from './shared/nav/nav.component';
import { HomeComponent } from './components/home/home.component';
import { ContactoComponent } from './components/contacto/contacto.component';
import { QuienessomosComponent } from './components/quienessomos/quienessomos.component';
import { ProductosComponent } from './components/productos/productos.component';
import { FormularioRegistroComponent } from './components/formulario-registro/formulario-registro.component';

const routes: Routes = [

  { path: '' , component: HomeComponent },
  { path: 'contacto' , component: ContactoComponent},
  { path : 'quienessomos' , component: QuienessomosComponent},
  { path: 'productos' , component: ProductosComponent},
  { path: 'formulario-registro', component: FormularioRegistroComponent}
  ];



@NgModule({
  imports:[
    RouterModule.forRoot(routes)
  ],
  exports: [RouterModule],
})
export class AppRoutingModule { }
