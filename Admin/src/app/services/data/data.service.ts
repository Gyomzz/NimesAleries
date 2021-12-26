import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Data } from 'src/app/models/data.model';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  data: BehaviorSubject<Array<Data>>;

  constructor() {
    const dataToPush = [
      new Data('Total des ventes', '140 430 $'),
      new Data('Nb de commandes', '4 300'),
      new Data('Nb de paniers', '430'),
      new Data('Panier moyen', '500 $'),
      new Data('Nb de nouveaux clients', '20 219'),
      new Data('Récurrence de commandes clients', '60%'),
      new Data('Paniers abandonnées', '20%'),
      new Data('Conversion paniers', '80%'),
      new Data('Conversion commandes', '100%'),
    ];
    this.data = new BehaviorSubject<Array<Data>>(dataToPush);
  }
}
