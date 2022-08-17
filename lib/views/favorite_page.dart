import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/controllers/product_conteoller.dart';
import 'package:shopee/views/home_page.dart';
import 'package:shopee/views/product_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Favorite Products",
          style: TextStyle(
              fontFamily: 'avenir',
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // child: GetX<ProductController>(
        //   builder: (controller) {
        //     // if(ProductTile.count >= 1 ){
        //       return StaggeredGridView.countBuilder(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 16,
        //       crossAxisSpacing: 16,
        //       itemCount: controller.productItems.length,
        //       itemBuilder: (context, index) {
        //         if (controller.productItems[index].isFavorite.value) {
        //           return ProductTile(
        //             product: controller.productItems[index],
        //           );
        //         }
        //         else {
        //           return const Center(
        //             child: Text(
        //               "There is no Favorite Product",
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 24,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           );
        //         }
        //       },
        //       staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        //     );
        //     }
        //   //   else {
        //   //         return const Center(
        //   //           child: Text(
        //   //             "There is no Favorite Product",
        //   //             style: TextStyle(
        //   //               color: Colors.black,
        //   //               fontSize: 24,
        //   //               fontWeight: FontWeight.bold,
        //   //             ),
        //   //           ),
        //   //         );
        //   //       }

        //   // },
        // ),
        child: GetX<ProductController>(
          builder: (controller) {
            if (ProductController.favItems.isEmpty) {
              return const Center(
                child: Text(
                  "There is no Favorite Product",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: ProductController.favItems.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: ProductController.favItems[index],
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            );
          },
        ),
      ),
    );
  }
}
