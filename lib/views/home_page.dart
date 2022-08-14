import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/controllers/product_conteoller.dart';
import 'package:shopee/views/favorite_page.dart';
import 'package:shopee/views/product_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.adaptive.arrow_back, color: Colors.black),
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
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Shopee',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  icon: const  Icon(Icons.favorite_rounded),
                  onPressed: () {
                    Get.toNamed('/fav');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.grid_view),
                  onPressed: () => () {},
                )
              ],
            ),
          ),
          Expanded(
            child: GetX<ProductController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemCount: productController.productItems.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        product: controller.productItems[index],
                      );
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
