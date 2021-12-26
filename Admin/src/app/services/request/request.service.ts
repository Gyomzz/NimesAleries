import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ApiService } from '../api/api.service';

@Injectable({
  providedIn: 'root',
})
export class RequestService {

  constructor(private http: HttpClient) {}

  getBestProduct(): void {
    console.log(ApiService.bestProductsUrl());

    this.http
    .get(ApiService.bestProductsUrl())
    .subscribe((product) => {
        console.log(product);
    });
  }
}
