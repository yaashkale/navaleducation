import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainHeaderComponent } from './main-header/main-header.component';
import { CarousalMainComponent } from './carousal-main/carousal-main.component';
import { ReccomendationMainComponent } from './reccomendation-main/reccomendation-main.component';
import { LoginMainComponent } from './login-main/login-main.component';
import { Hero1Component } from './hero1/hero1.component';
import { DropdownComponent } from './dropdown/dropdown.component';


@NgModule({
  declarations: [
    AppComponent,
    MainHeaderComponent,
    CarousalMainComponent,
    ReccomendationMainComponent,
    LoginMainComponent,
    Hero1Component,
    DropdownComponent,
  
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
