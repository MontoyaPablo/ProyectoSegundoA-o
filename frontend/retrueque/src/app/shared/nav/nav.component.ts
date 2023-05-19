
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import AOS from 'aos';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {

  mostrar: Boolean=false;
  mensaje_enlace: String='USUARIO';

  popUp(){
    if ( this.mostrar){
      this.mostrar =false;
      this.mensaje_enlace='USUARIO';
    }else{
      this.mostrar=true;
      this.mensaje_enlace='CERRAR';
    }
  }

  ngOnInit() {
    AOS.init();

  }


}

