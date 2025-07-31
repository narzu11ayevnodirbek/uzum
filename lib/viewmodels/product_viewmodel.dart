import 'package:get/get.dart';
import 'package:uzum/models/product_model.dart';
import 'package:uzum/repositories/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductViewModel extends GetxController {
  final repository = ProductRepository();

  RxList<ProductModel> products = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  DocumentSnapshot? lastDocument;
  RxBool hasMore = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;
    final fetched = await repository.getProducts(startAfter: lastDocument);
    products.addAll(fetched);

    if (fetched.length < 10) hasMore.value = false;
    if (fetched.isNotEmpty) {
      lastDocument = await repository.getLastDoc(startAfter: lastDocument);
    }
    isLoading.value = false;
  }
}
