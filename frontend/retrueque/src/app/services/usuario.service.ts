import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';


export class Usuario
{
  nombre: string = "";
  apellido: string = "";
  email: string = "";
  password: string = "";
  direccion: string= "";
  id: number =  0;
}


@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  url="https://reqres.in/api/users/1"
  //Noemi, aca hay que cambiar la direccion de Reqres.in a la de nuestra API de registro.

  constructor(private http:HttpClient) {
    console.log('Servicios Usuarios esta corriendo')
   }

   onCrearUsuario(usuario:Usuario):Observable<Usuario>{
      return this.http.post<Usuario>(this.url, usuario)
   }
}
