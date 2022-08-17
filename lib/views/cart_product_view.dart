import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/controllers/cart_controller.dart';
import 'package:shopee/models/product.dart';
import 'package:shopee/views/home_page.dart';
import 'package:shopee/views/product_tile.dart';

class CartView extends StatelessWidget {
  CartView({Key? key, required this.product}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.pop(context);
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: cartController.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  const Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => HomePage());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.062,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade500,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Go to Shopping",
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : GetX<CartController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      product: controller.cartItems[index],
                    );
                  },
                );
              },
            ),
    );
  }
}
