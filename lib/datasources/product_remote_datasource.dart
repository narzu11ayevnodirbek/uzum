import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uzum/models/product_model.dart';

class ProductRemoteDataSource {
  final firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProducts({
    DocumentSnapshot? startAfter,
  }) async {
    Query query = firestore.collection("products").orderBy("title").limit(10);
    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    final snapshot = await query.get();
    return snapshot.docs
        .map(
          (doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>, doc.id),
        )
        .toList();
  }

  Future<DocumentSnapshot?> getLastDocument({
    DocumentSnapshot? startAfter,
  }) async {
    Query query = firestore.collection("products").orderBy("title").limit(10);
    if (startAfter != null) query = query.startAfterDocument(startAfter);
    final snapshot = await query.get();
    return snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
  }
}
