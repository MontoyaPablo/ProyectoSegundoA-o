import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { NavComponent } from './shared/nav/nav.component';
import { HomeComponent } from './components/home/home.component';
import { ContactoComponent } from './components/contacto/contacto.component';
import { QuienessomosComponent } from './components/quienessomos/quienessomos.component';
import { ProductosComponent } from './components/productos/productos.component';
import { LoginComponent } from './components/login/login.component';
import { CarritoComponent } from './components/carrito/carrito.component';
import { RegistroComponent } from './components/registro/registro.component';




const routes: Routes = [

  { path: '' , component: HomeComponent },
  { path: 'contacto' , component: ContactoComponent},
  { path : 'quienessomos' , component: QuienessomosComponent},
  { path: 'productos' , component: ProductosComponent},
  { path: 'login' , component: LoginComponent},
  { path: 'carrito' , component: CarritoComponent},
  { path: 'registro' , component: RegistroComponent}
  ];



@NgModule({
  imports:[
    RouterModule.forRoot(routes)
  ],
  exports: [RouterModule],
})
export class AppRoutingModule { }
