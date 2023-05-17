import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
  mostrar: Boolean=false;
  mensaje_enlace: String='Ocultar';

  register={
    email:'',
    password:'',
  }
  
  popUp(){
    if ( this.mostrar){
      this.mostrar =false;
      this.mensaje_enlace='USUARIO';
    }else{
      this.mostrar=true;
      this.mensaje_enlace='CERRAR';
    }
  }

  loginOk() {
    console.log(this.register);
  }
  close() {
    console.log()
  }

}

