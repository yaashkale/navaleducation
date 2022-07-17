import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainHeaderComponent } from './main-header/main-header.component';
import { CarousalMainComponent } from './carousal-main/carousal-main.component';
import { ReccomendationMainComponent } from './reccomendation-main/reccomendation-main.component';
import { LoginMainComponent } from './login-main/login-main.component';

@NgModule({
  declarations: [
    AppComponent,
    MainHeaderComponent,
    CarousalMainComponent,
    ReccomendationMainComponent,
    LoginMainComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
