import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-card-clients',
  templateUrl: './card-clients.component.html',
  styleUrls: ['./card-clients.component.css']
})
export class CardClientsComponent implements OnInit {
  @Input() title: string;
  @Input() number: string;

  constructor() {
    this.number = '';
    this.title = '';
   }

  ngOnInit(): void {
  }

}
