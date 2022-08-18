import 'package:get/get.dart';
import 'package:shopee/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price as double));

  addToCart(Product product) {
    // cartItems.value = product as List<Product>;
    cartItems.add(product);
  }
}
