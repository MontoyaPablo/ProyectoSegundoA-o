import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './shared/login/login.component';
import { NavComponent } from './shared/nav/nav.component';
import { HomeComponent } from './components/home/home.component';
import { ContactoComponent } from './components/contacto/contacto.component';

const routes: Routes = [
   { path: 'login' , component:LoginComponent},
   { path: 'nav' , component: NavComponent },
   { path: '' , component: HomeComponent },
   { path: 'contacto' , component: ContactoComponent},


  ];



@NgModule({
  imports:[
    RouterModule.forRoot(routes)
  ],
  exports: [RouterModule],
})
export class AppRoutingModule { }
