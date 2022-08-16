import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/controllers/product_conteoller.dart';
import 'package:shopee/views/home_page.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

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
            Get.off(() => HomePage());
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${Get.arguments['des']}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
