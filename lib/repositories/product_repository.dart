import 'package:uzum/datasources/product_remote_datasource.dart';
import 'package:uzum/models/product_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final ProductRemoteDataSource remote = ProductRemoteDataSource();

  Future<List<ProductModel>> getProducts({DocumentSnapshot? startAfter}) {
    return remote.fetchProducts(startAfter: startAfter);
  }

  Future<DocumentSnapshot?> getLastDoc({DocumentSnapshot? startAfter}) {
    return remote.getLastDocument(startAfter: startAfter);
  }
}
