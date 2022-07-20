import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainHeaderComponent } from './main-header/main-header.component';
import { CarousalMainComponent } from './carousal-main/carousal-main.component';
import { ReccomendationMainComponent } from './reccomendation-main/reccomendation-main.component';
import { LoginMainComponent } from './login-main/login-main.component';
import { Hero1Component } from './hero1/hero1.component';
import { CardsComponent } from './cards/cards.component';
import { Blog1Component } from './blog1/blog1.component';
import { Blog2Component } from './blog2/blog2.component';
import { FooterComponent } from './footer/footer.component';
import { SignupComponent } from './signup/signup.component';
import { ContactComponent } from './contact/contact.component';
import { DropdownComponent } from './dropdown/dropdown.component';
import { HomeComponent } from './home/home.component';


@NgModule({
  declarations: [
    AppComponent,
    MainHeaderComponent,
    CarousalMainComponent,
    ReccomendationMainComponent,
    LoginMainComponent,
    Hero1Component,
    CardsComponent,
    Blog1Component,
    Blog2Component,
    FooterComponent,
    SignupComponent,
    ContactComponent,
    DropdownComponent,
    HomeComponent
  
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
