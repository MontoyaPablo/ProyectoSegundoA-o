import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { loadStripe } from '@stripe/stripe-js';
import { environment } from 'src/environments/environment';
import { CarritoService } from 'src/app/services/carrito.service';
import { ProductDetail } from 'src/app/models/productoscarrito.model';
import { ProductosComponent } from '../productos/productos.component';

@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.css']
})
export class CarritoComponent {
  cartItems: any;
  totalAmount: number = 0;
  public stripePublicKey: string = environment.stripePublicKey;

  constructor(private cartService: CarritoService, private http: HttpClient) {
    this.cartItems = this.cartService.getCartItems();
    this.calculateTotalAmount();
  }

  removeFromCart(product: any) {
    this.cartService.removeFromCart(product);
    this.cartItems = this.cartService.getCartItems();
    this.calculateTotalAmount();
  }

  clearCart() {
    this.cartService.clearCart();
    this.cartItems = [];
    this.calculateTotalAmount();
  }

  private calculateTotalAmount() {
    this.totalAmount = this.cartItems.reduce(
      (total:any, item:any) => total + Number(item.precio),
      0
    );
  }

  onCheckout(): void {
    this.http
      .post('http://127.0.0.1:8000/api/pagar/', {
        items: this.cartItems,
      })
      .subscribe(async (res: any) => {
        let stripe = await loadStripe(this.stripePublicKey);
        stripe?.redirectToCheckout({ sessionId: res.id });
      });
  }
}