import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

import { Task } from '../components/productos/interface/task';

@Injectable({
  providedIn: 'root',
})
export class CarritoService {
  cartItems: Task[] = [];
  private cartItemsSubject = new BehaviorSubject<Task[]>([]);

  constructor() {
    const storedCartItems = localStorage.getItem('cartItems');
    if (storedCartItems) {
      this.cartItems = JSON.parse(storedCartItems);
      this.cartItemsSubject.next(this.cartItems);
    }
  }

  addToCart(product: any) {
    this.cartItems.push(product);
    this.saveCartItemsToLocalStorage();
    this.cartItemsSubject.next(this.cartItems);
  }

  private saveCartItemsToLocalStorage() {
    localStorage.setItem('cartItems', JSON.stringify(this.cartItems));
  }

  removeFromCart(product: Task) {
    const index = this.cartItems.findIndex((item) => item.id_producto === product.id_producto);
    if (index !== -1) {
      this.cartItems.splice(index, 1);
      this.saveCartItemsToLocalStorage();
      this.cartItemsSubject.next(this.cartItems);
    }
  }

  getCartItems(): Task[] {
    return this.cartItems;
  }

  clearCart() {
    this.cartItems = [];
    this.saveCartItemsToLocalStorage();
    this.cartItemsSubject.next(this.cartItems);
  }

  getCartItemsObservable() {
    return this.cartItemsSubject.asObservable();
  }
}