import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  token: BehaviorSubject<string>;

  constructor() {
    this.token = new BehaviorSubject<string>('');
  }

  signIn(id: string, password: string): Promise<void | string> {
    return new Promise<void | string>((res, rej) => {
      setTimeout(() => {
        if (id === 'LaFaceCachéeDeLaLune' && password === 'Issou2021') {
          this.token.next('azerty');
          res('ok');
        } else {
          rej('Les identifiant sont incorrects');
        }
      }, 1000);
    });
  }
  signOut(): Promise<void> {
    return new Promise<void>((res, rej) => {
      this.token.next('');
      res();
    });
  }
}
