import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/Auth/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-auth-view',
  templateUrl: './auth-view.component.html',
  styleUrls: ['./auth-view.component.css'],
})
export class AuthViewComponent implements OnInit {
  errMsg: string;
  id: string;
  password: string;
  constructor(private authService: AuthService, private router: Router) {
    this.errMsg = '';
    this.id = '';
    this.password = '';
  }

  ngOnInit(): void {}

  onSubmitSignIn() {
    this.authService
      .signIn(this.id, this.password)
      .then(() => {
        this.router.navigate(['home']);
      })
      .catch((errMsg) => {
        this.errMsg = errMsg;
      });
  }
}
