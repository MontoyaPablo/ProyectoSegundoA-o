import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuarioService, Usuario } from 'src/app/services/usuario.service';


@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})


export class RegistroComponent implements OnInit {


  formRegistro: FormGroup;
  usuario: Usuario = new Usuario();

  constructor(private formBuilder: FormBuilder, private usuarioService: UsuarioService, private router: Router){

    this.formRegistro = this.formBuilder.group(
      {
        nombre:['', [Validators.required]],
        apellido: ['',[Validators.required]],
        email: ['', [Validators.required, Validators.email]],
        password: ['', [Validators.required, Validators.minLength(8)]],
        direccion: ['', [Validators.required]],
      }
    )
  }

  ngOnInit(): void {

  }

  onEnviar(event: Event, usuario: Usuario): void {
    event.preventDefault;

    if (this.formRegistro.valid)
    {
      console.log('Enviando al servidor...');
      console.log(usuario)
      this.usuarioService.onCrearUsuario(usuario).subscribe(
        data => {
          console.log(data.id);
          if (data.id > 0)
          {
            alert("El registro ha sido creado satisfactoriamente. A  continuacion inicie sesion")
            this.router.navigate(['/login'])
          }
        }
      )
    }
    else
    {
      this.formRegistro.markAllAsTouched();
    }
  };

  get Nombre(){
    return this.formRegistro.get('nombre');
  }

  get Apellido(){
    return this.formRegistro.get('apellido');
  }

  get Email(){
    return this.formRegistro.get('email');
  }

  get Password(){
    return this.formRegistro.get('password');
  }

  get Direccion(){
    return this.formRegistro.get('direccion');
  }

}
