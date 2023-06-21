import { Component } from '@angular/core';
import { FormControl, FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {

  get email(){
    return this.formLogin.get('email') as FormControl;
  }

  get password(){
    return this.formLogin.get('password') as FormControl;
  }

  formLogin: FormGroup;

  constructor(private formBuilder: FormBuilder) {
    this.formLogin = this.formBuilder.group({
      email: ['', [Validators.required ,Validators.email]],
      password: ['', [Validators.required]]
    });
  }

}

