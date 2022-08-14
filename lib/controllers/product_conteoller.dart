import 'package:get/get.dart';
import 'package:shopee/models/product.dart';
import 'package:shopee/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productItems = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProduct();
      if (products != null) {
        productItems.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
