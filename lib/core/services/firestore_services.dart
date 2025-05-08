import 'dart:math';
import 'dart:developer' as logger;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/services/database_services.dart';

class FirestoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<List<Map<String, dynamic>>> getData({
    required String path,
    required int limit,
  }) async {
    QuerySnapshot querySnapshot = await firestore.collection(path).get();
    List<Map<String, dynamic>> data =
        querySnapshot.docs
            .map((e) => e.data() as Map<String, dynamic>)
            .toList();
    logger.log('${data.length}');
    data.shuffle();
    return data.take(limit).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getRandomDocuments({
    required String path,
    required int limit,
  }) async {
    CollectionReference collection = firestore.collection(path);
    // await firestore
    //     .collection(FirebaseEndpoints.bankChallenge)
    //     .count()
    //     .get()
    //     .then((res) => logger.log('${res.count}'));
    // Step 1: Fetch all document IDs (efficient as it's lightweight)
    QuerySnapshot querySnapshot = await collection.get();
    List<String> allDocIds = querySnapshot.docs.map((doc) => doc.id).toList();

    if (allDocIds.isEmpty) return []; // No documents available

    // Step 2: Pick 8 unique random IDs
    Random random = Random();
    Set<String> randomIds = {};

    while (randomIds.length < limit && randomIds.length < allDocIds.length) {
      randomIds.add(allDocIds[random.nextInt(allDocIds.length)]);
    }

    // Step 3: Fetch only those 8 documents
    QuerySnapshot randomDocsSnapshot =
        await collection
            .where(FieldPath.documentId, whereIn: randomIds.toList())
            .get();

    // Convert documents to a list of maps
    List<Map<String, dynamic>> randomDocs =
        randomDocsSnapshot.docs
            .map((doc) => {"id": doc.id, ...doc.data() as Map<String, dynamic>})
            .toList();

    return randomDocs;
  }

  @override
  Future<Map<String, dynamic>> getRandomSingleDocument({
    required String path,
  }) async {
    final random = Random().nextDouble();
    var query =
        await firestore
            .collection(path)
            .where('random', isGreaterThanOrEqualTo: random)
            .limit(1)
            .get();

    if (query.docs.isNotEmpty) {
      return query.docs.first.data();
    }

    query =
        await firestore
            .collection(path)
            .where('random', isLessThanOrEqualTo: random)
            .limit(1)
            .get();

    return query.docs.single.data();
  }
}
