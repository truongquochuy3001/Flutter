library cart;

import 'package:project_learning_g1/model/Product.dart';

import 'model/Cart.dart';

List<Cart> list = [];

void add(Product p) {
  for (int i = 0; i < list.length; i++)
    if (list[i].model.id == p.id) {
      list[i].quantity++;
      return;
    }
  Cart cartItem = new Cart(model: p, quantity: 1);
  list.add(cartItem);
}

double total() {
  double tong = 0;
  for (int i = 0; i < list.length; i++) {
    tong = tong + list[i].model.price! * list[i].quantity;
  }
  return tong;
}

int productTotal() {
  int pT = 0;
  for (int i = 0; i < list.length; i++) {
    pT = pT + list[i].quantity;
  }
  return pT;
}
