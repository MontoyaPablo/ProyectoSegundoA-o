import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavComponent } from './nav/nav.component';
import { LoginComponent } from './login/login.component';
import { FormsModule } from '@angular/forms';




@NgModule({
  declarations: [
    NavComponent,
    LoginComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
  ],
  exports:[
    NavComponent,
    LoginComponent
  ]
})
export class SharedModule {}

