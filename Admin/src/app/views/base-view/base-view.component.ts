import { Component, OnInit } from '@angular/core';
import { Data } from 'src/app/models/data.model';
import { Subscription } from 'rxjs';
import { DataService } from 'src/app/services/data/data.service';

@Component({
  selector: 'app-base-view',
  templateUrl: './base-view.component.html',
  styleUrls: ['./base-view.component.css']
})
export class BaseViewComponent implements OnInit {
  data: Array<Data>;
  dataSub: Subscription;

  constructor(private dataService : DataService) {
    this.data= [];
    this.dataSub = new Subscription();
   }

  ngOnInit(): void {
    this.dataSub = this.dataService.data.subscribe((datas: Array<Data>) => {
      this.data = datas;
    })
  }

}
