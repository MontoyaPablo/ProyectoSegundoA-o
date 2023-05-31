import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';


@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.component.html',
  styleUrls: ['./contacto.component.css']
})
export class ContactoComponent {

  get name(){
    return this.formContacto.get('name') as FormControl;
  }

  get email(){
    return this.formContacto.get('email') as FormControl;
  }

  get asunto(){
    return this.formContacto.get('asunto');
  }

  get mensaje(){
    return this.formContacto.get('mensaje');
  }


  formContacto: FormGroup;

  constructor(private formBuilder: FormBuilder) {
    this.formContacto = this.formBuilder.group({
      name: ['', [Validators.required]],
      email: ['', [Validators.required ,Validators.email]],
      asunto: ['', [Validators.required, Validators.maxLength(20)]],
      mensaje: ['', [Validators.required]],
    });
  }

  procesar(){
    console.log(this.formContacto.value)
  }

}
