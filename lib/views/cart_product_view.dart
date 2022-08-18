import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/controllers/cart_controller.dart';
import 'package:shopee/views/home_page.dart';

class CartView extends StatelessWidget {
  CartView({Key? key, }) : super(key: key);
  final CartController cartController = Get.put(CartController());
  // final Product product;

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
            Navigator.pop(context);
            // Get.back();
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
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetX<CartController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // return ProductTile(
                      //   product: controller.cartItems[index],
                      // );
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.24,
                          decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      borderRadius: BorderRadius.circular(3),
                                      
                                    ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.network(
                                  controller.cartItems[index].imageLink,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cartItems[index].name,
                                      maxLines: 2,
                                      // textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${controller.cartItems[index].price}',
                                      style: const TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      height:
                                          MediaQuery.of(context).size.height * 0.039,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.039,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[350],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width *
                                                0.15,
                                            child: TextButton(
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                  color: Colors.green.shade900,
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.039,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[350],
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: Radius.circular(4),
                                                topRight: Radius.circular(4),
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
          ),
    );
  }
}
