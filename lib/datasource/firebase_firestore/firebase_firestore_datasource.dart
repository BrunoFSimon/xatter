import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xatter/datasource/firebase_firestore/filter/firebase_firestore_filter.dart';

class FirebaseFirestoreDatasource {
  Future<Map<String, dynamic>> getDoc({required String path}) async {
    try {
      final doc = await FirebaseFirestore.instance.doc(path).get();
      if (doc.exists) {
        return doc.data()!;
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error getting document: $e');
    }
  }

  Future<Map<String, dynamic>> addDoc({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await FirebaseFirestore.instance
          .collection(collectionPath)
          .add(data);

      final resultData = Map<String, dynamic>.from(data);
      resultData['id'] = docRef.id;

      return resultData;
    } catch (e) {
      throw Exception(
        'Error adding document to collection $collectionPath: $e',
      );
    }
  }

  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    List<FirebaseFirestoreQueryFilter>? filters,
  }) async {
    try {
      Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection(
        path,
      );

      for (FirebaseFirestoreQueryFilter filter in filters ?? []) {
        switch (filter.operator) {
          case FirebaseFirestoreQueryOperator.isEqualTo:
            query = query.where(filter.field, isEqualTo: filter.value);
            break;
        }
      }

      final snapshot = await query.get();
      return snapshot.docs.map((doc) {
        final dataWithId = Map<String, dynamic>.from(doc.data());
        dataWithId['id'] = doc.id;
        return dataWithId;
      }).toList();
    } catch (e) {
      throw Exception('Error getting collection: $e');
    }
  }
}
