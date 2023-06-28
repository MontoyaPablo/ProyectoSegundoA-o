import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, throwError  } from 'rxjs';
import { map } from 'rxjs';
import { Usuario } from './usuario.service';
import { HttpClient } from '@angular/common/http';
import { catchError, tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';
import { loginModel, AuthResData, User } from '../models/auth.model';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  user = new BehaviorSubject<User | null>(null);
  constructor(private http:HttpClient) { }
  login(account: loginModel) {
    return this.http
      .post<AuthResData>('http://127.0.0.1:8000/api/auth/login/', account)
      .pipe(
        catchError((error: HttpErrorResponse) => this.handleError(error)),
        tap((res) => {
          this.handleAuth(res);
        })
      );
  }
  private handleError(error: HttpErrorResponse) {
    console.log(error);
    let errorMessage = 'An unknown error occurred';
    if (!error.error) {
      return throwError(() => errorMessage);
    }
    if (error.error.non_field_errors) {
      errorMessage = error.error.non_field_errors[0];
    }
    if (error.error.email) {
      errorMessage = error.error.email[0];
    }
    if (error.error.username) {
      errorMessage = error.error.username[0];
    }
    return throwError(() => errorMessage);
  }

  private handleAuth(res: AuthResData) {
    const user = new User(
      res.user_id ?? '',
      res.email ?? '',
      res.username ?? '',
      res.name ?? '',
      res.token ?? '',
      res.is_admin ?? false
    );
    this.user.next(user);
    localStorage.setItem('user', JSON.stringify(user));
  }

  getUserId(): string {
    const userData: User | null = JSON.parse(
      localStorage.getItem('user') || '{}'
    );

    if (userData && userData.id) {
      return userData.id;
    }

    return '';
  }

  
}
