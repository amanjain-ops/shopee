import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/controllers/cart_controller.dart';
import 'package:shopee/controllers/product_conteoller.dart';
import 'package:shopee/models/product.dart';
import 'package:shopee/views/cart_product_view.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key, required this.product}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  final Product product;

  @override
  Widget build(BuildContext context) {
    RxBool fav = Get.arguments['fav'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                Get.arguments['name'],
                style: const TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Image Section
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.27,
                  color: Colors.white,
                  child: Image.network(Get.arguments['image']),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.21,
                  child: GetX<ProductController>(
                    builder: (controller) {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: fav.value
                              ? const Icon(Icons.favorite_rounded)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            if (fav.value) {
                              ProductController.favItems
                                  .remove(Get.arguments['prod']);
                            } else {
                              ProductController.favItems
                                  .add(Get.arguments['prod']);
                            }
                            fav.toggle();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 5.0,
            ),

            //  Price

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Price: \$${Get.arguments['price']}',
                style: const TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // Product details

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${Get.arguments['des']}'),
                  ),

                  // Buttons add to cart

                  GestureDetector(
                    onTap: () {
                      // print(product.name);
                      cartController.addToCart(product);
                      // cartController.addToCart(cartController.cartItems[Get.arguments['id']]);
                      Get.to(() => CartView(
                            product: product,
                          ));
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
                          "Add to Cart",
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Button Buy Now

                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.062,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
