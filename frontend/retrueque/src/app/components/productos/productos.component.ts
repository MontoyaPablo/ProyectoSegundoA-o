import { Component } from '@angular/core';
import { TaskService } from './producto/task.service';
import { Task } from './interface/task';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent {
  listaProductos:Task[] = [];
   
  constructor(
    private taskService:TaskService
    
    
  ){}
 
  ngOnInit(): void{
    this.CargarProductos();
  }

  CargarProductos():void {
  this.taskService.getAllTasks()
  .subscribe(productos=>{
    console.log(productos)
    this.listaProductos = productos as Task[];
  } )
 }
}
