import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/models/product.dart';
import 'package:shopee/views/favorite_page.dart';
import 'package:shopee/views/home_page.dart';
import 'package:shopee/views/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopee',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  HomePage(),
      getPages: [
        GetPage(name: '/fav', page: () =>  const  FavoritePage(),),
        GetPage(name: '/view', page: () =>  const  ProductView(),),

      ],
    );
  }
}

