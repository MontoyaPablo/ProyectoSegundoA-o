
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import AOS from 'aos';

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
