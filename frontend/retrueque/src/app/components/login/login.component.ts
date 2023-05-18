import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {

  mensaje_enlace: String='Ocultar';

  register={
    email:'',
    password:'',
  }


  loginOk() {
    console.log(this.register);
  }
  close() {
    console.log()
  }

}

