import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Task } from '../interface/task';


@Injectable({
  providedIn: 'root'
})
export class TaskService {

  constructor(
    private http:HttpClient
  ) { }
  getAllTasks(){
    const path='http://127.0.0.1:8000/api/productos/';
    return this.http.get<Task[]>(path);
  }
}
