import { Component } from '@angular/core';
import { FormControl, FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-formulario-registro',
  templateUrl: './formulario-registro.component.html',
  styleUrls: ['./formulario-registro.component.css']
})
export class FormularioRegistroComponent {


  formRegistro: FormGroup;

  constructor(private formBuilder: FormBuilder) {
    this.formRegistro = this.formBuilder.group({
      nombre: ['', [Validators.required]],
      apellido: ['', [Validators.required]],
      dni: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      telefono: ['', [Validators.required]],
      fecNac: ['', [Validators.required]],
      direccion: ['', [Validators.required]],
      codigoPostal: ['', [Validators.required]],
    });
  }

}
