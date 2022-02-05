import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  static rootUrl = 'https://api-nimesaleries.herokuapp.com';

  constructor() {}

  static sumOfSalesUrl(): string {
    return `${ApiService.rootUrl}/sumOfSales`;
  }

  static avgCartPriceUrl(): string {
    return `${ApiService.rootUrl}/avgCartPrice`;
  }

  static bestProductsUrl(): string {
    return `${ApiService.rootUrl}/bestProducts`;
  }

  static newClientUrl(): string {
    return `${ApiService.rootUrl}/newClient`;
  }

  static numberOfCartsUrl(): string {
    return `${ApiService.rootUrl}/numberOfCarts`;
  }

  static numberOfOrdersUrl(): string {
    return `${ApiService.rootUrl}/numberOfOrders`;
  }

  static abandonedCartUrl(): string {
    return `${ApiService.rootUrl}/abandonedCart`;
  }

  static convertedCartUrl(): string {
    return `${ApiService.rootUrl}/convertedCart`;
  }
}
