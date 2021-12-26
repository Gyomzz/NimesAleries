import { Component,OnInit } from '@angular/core';
import { ChartConfiguration, ChartDataset, ChartOptions } from 'chart.js';
import { ChartType } from 'chart.js';

@Component({
  selector: 'app-graphique',
  templateUrl: './graphique.component.html',
  styleUrls: ['./graphique.component.css']
})
export class GraphiqueComponent implements OnInit {

  type: ChartType;
  labels: string[];
  datasets: ChartDataset[];
  options: ChartOptions;

  constructor() {
    this.type = 'doughnut';

    this.labels = ['Red', 'Orange', 'Yellow', 'Green', 'Blue'];

    this.datasets = [
      {
        label: 'Dataset 1',
        data: [20, 10, 5, 15, 50],
        backgroundColor: ['Orange', 'Green', 'Blue', 'Yellow', 'Red'],
      }
    ];

    this.options = {
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: 'Chart.js Doughnut Chart'
        }
      }
    };

   }

  ngOnInit(): void {
  }
}
