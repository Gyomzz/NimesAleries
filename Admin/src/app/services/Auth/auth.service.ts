import { HttpHeaders, HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, throwError } from 'rxjs';
import { ApiService } from '../api/api.service';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  endpoint: string = ApiService.rootUrl;
  headers = new HttpHeaders().set('Content-Type', 'application/json');
  currentUser = {};
  token: BehaviorSubject<string>;
  constructor(private http: HttpClient, public router: Router) {
    this.token = new BehaviorSubject<string>('');
  }

  signIn(id: string, password: string) {
    let user = {
      username: id,
      password: password,
    };
    return this.http
      .post<any>(`${this.endpoint}/login`, user)
      .subscribe((res: any) => {
        localStorage.setItem('access_token', res.token);
        this.token.next(res.token);
        this.router.navigate(['home']);
      });
  }

  getToken() {
    return localStorage.getItem('access_token');
  }

  signOut(): Promise<void> {
    return new Promise<void>((res, rej) => {
      this.token.next('');
      res();
    });
  }

  handleError(error: HttpErrorResponse) {
    let msg = '';
    if (error.error instanceof ErrorEvent) {
      // client-side error
      msg = error.error.message;
    } else {
      // server-side error
      msg = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    return throwError(msg);
  }
}
