import { Component } from '@angular/core';
import { OnInit } from '@angular/core';
import * as AOS from 'aos';



@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {
  ngOnInit() {
    AOS.init();
  }
}

