import { Component, OnInit, Input } from '@angular/core';
import { AbstractControl, NgModel } from '@angular/forms';

@Component({
  selector: 'app-error-form',
  templateUrl: './error-form.component.html',
  styleUrls: ['./error-form.component.css'],
})
export class ErrorFormComponent implements OnInit {
  @Input() control: AbstractControl | undefined | NgModel;
  @Input() controlLabel: string;

  constructor() {
    this.controlLabel = '';
  }

  ngOnInit(): void {}
}
