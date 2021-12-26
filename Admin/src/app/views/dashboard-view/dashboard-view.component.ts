import { Component, OnInit } from '@angular/core';
import { RequestService } from '../../services/request/request.service';

@Component({
  selector: 'app-dashboard-view',
  templateUrl: './dashboard-view.component.html',
  styleUrls: ['./dashboard-view.component.css']
})
export class DashboardViewComponent implements OnInit {

  constructor(private request: RequestService) { }

  ngOnInit(): void {
    this.request.getBestProduct()
  }

}
