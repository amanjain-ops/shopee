import 'package:flutter/material.dart';
import 'package:shopee/controllers/product_conteoller.dart';
import 'package:shopee/models/product.dart';
import 'package:get/get.dart';
import 'package:shopee/views/product_view.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product,}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        Get.to(()=>ProductView(product: product,),arguments: {
          'id': product.id,
          'name': product.name,
          'des': product.description,
          'image': product.imageLink,
          'brand': product.brand,
          'price': product.price,
          'fav': product.isFavorite,
          'prod': product,
        })
        ;
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GetX<ProductController>(
                      builder: (controller) {
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: product.isFavorite.value
                                ? const Icon(Icons.favorite_rounded)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              if(product.isFavorite.value){
                                ProductController.favItems.remove(product);
                              }else{
                                ProductController.favItems.add(product);
                              }
                              product.isFavorite.toggle();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                product.name,
                maxLines: 2,
                style: const TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(fontSize: 32, fontFamily: 'avenir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
