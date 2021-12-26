import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardViewComponent } from './views/dashboard-view/dashboard-view.component';
import { ErrorViewComponent } from './views/error-view/error-view.component';
import { AuthViewComponent } from './views/auth-view/auth-view.component';
import { AuthGuard } from './guards/Auth/auth.guard';

const routes: Routes = [
  {path: '', canActivate: [AuthGuard], component: DashboardViewComponent},
  {path: 'dashboard', canActivate: [AuthGuard], component: DashboardViewComponent},
  {path: 'home', canActivate: [AuthGuard], component: DashboardViewComponent},
  {path: 'auth', component: AuthViewComponent},
  {path: 'not-found', component: ErrorViewComponent},
  {path: '**', redirectTo: 'not-found'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
