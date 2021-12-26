import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DashboardViewComponent } from './views/dashboard-view/dashboard-view.component';
import { NavComponent } from './components/nav/nav.component';
import { NavLeftComponent } from './components/nav-left/nav-left.component';
import { ErrorViewComponent } from './views/error-view/error-view.component';
import { BaseViewComponent } from './views/base-view/base-view.component';
import { DataService } from './services/data/data.service';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { PlusVenduesComponent } from './components/plus-vendues/plus-vendues.component';
import { PlusVenduesItemsComponent } from './components/plus-vendues-items/plus-vendues-items.component';
import { GraphVisitesComponent } from './components/graph-visites/graph-visites.component';
import { CardClientsComponent } from './components/card-clients/card-clients.component';
import { AuthViewComponent } from './views/auth-view/auth-view.component';
import { ErrorFormComponent } from './components/error-form/error-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgChartsModule } from 'ng2-charts';
import { GraphiqueComponent } from './components/graphique/graphique.component';
import { DateRangeComponent } from './components/date-range/date-range.component';
import { GraphProgressComponent } from './components/graph-progress/graph-progress.component';
import { HttpClientModule } from '@angular/common/http';
import { RequestService } from './services/request/request.service';

@NgModule({
  declarations: [
    AppComponent,
    DashboardViewComponent,
    NavComponent,
    NavLeftComponent,
    ErrorViewComponent,
    BaseViewComponent,
    PlusVenduesComponent,
    PlusVenduesItemsComponent,
    GraphVisitesComponent,
    CardClientsComponent,
    AuthViewComponent,
    ErrorFormComponent,
    GraphiqueComponent,
    DateRangeComponent,
    GraphProgressComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    NgbModule,
    FormsModule,
    ReactiveFormsModule,
    NgChartsModule,
  ],
  providers: [DataService, RequestService],
  bootstrap: [AppComponent],
})
export class AppModule {}
