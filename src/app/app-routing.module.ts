import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutusComponent } from './aboutus/aboutus.component';

import { ContactComponent } from './contact/contact.component';
import { DropdownComponent } from './dropdown/dropdown.component';
import { HomeComponent } from './home/home.component';
import { LoginMainComponent } from './login-main/login-main.component';
import { SignupComponent } from './signup/signup.component';
const routes: Routes = [
  {path: 'login',component: LoginMainComponent},
  {path: 'home',component: HomeComponent},
  {path: 'about',component: AboutusComponent},
  {path: 'dropdown',component: DropdownComponent},
  {path: 'signup',component: SignupComponent},
  {path: 'contact',component: ContactComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
// export const routingComponents = [LoginMainComponent];