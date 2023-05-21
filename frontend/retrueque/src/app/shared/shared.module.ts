import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavComponent } from './nav/nav.component';
import { LoginComponent } from './login/login.component';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from '../app-routing.module';
import { FooterComponent } from './footer/footer.component';





@NgModule({
  declarations: [
    NavComponent,
    LoginComponent,
    FooterComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    AppRoutingModule,
  ],
  exports:[
    NavComponent,
    LoginComponent,
    FooterComponent,
  ]
})
export class SharedModule {}

