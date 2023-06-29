import { Component } from '@angular/core';
import { TaskService } from './producto/task.service';
import { Task } from './interface/task';
import { CarritoService } from 'src/app/services/carrito.service';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { DomSanitizer } from '@angular/platform-browser';
import { ProductDetail } from 'src/app/models/productoscarrito.model';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent {
  listaProductos:ProductDetail[] = [];
  
  constructor(
    private taskService:TaskService,
    private route: ActivatedRoute,
    private productService: TaskService,
    public sanitizer: DomSanitizer,
    public router: Router,
    private cartService: CarritoService,
    
  ){}
 
  ngOnInit(): void{
    this.CargarProductos();
  }

  CargarProductos():void {
  this.taskService.getAllTasks()
  .subscribe(productos=>{
    console.log(productos)
    this.listaProductos = productos as any;
  } )
  
 }


  addToCart(listaProductos: any){
    if (listaProductos) {
      this.cartService.addToCart(listaProductos);
    }
  }
}