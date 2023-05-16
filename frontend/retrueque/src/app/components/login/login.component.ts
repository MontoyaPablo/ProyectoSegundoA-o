import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
    showPopup = false;
    usuario="";
    password="";

    login() {
        console.log('Usuario:', this.usuario);
        console.log('Contraseña:', this.password);

    }

    close() {
      this.showPopup = false;
      console.log("tmb funca");
    }
}

