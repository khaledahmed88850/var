import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/services/database_services.dart';

class FirestoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<List<Map<String, dynamic>>> getData() async {
    // QuerySnapshot querySnapshot =
    //     await firestore.collection(FirebaseEndpoints.passwordChallenge).get();
    // List<Map<String, dynamic>> data =
    //     querySnapshot.docs
    //         .map((e) => e.data() as Map<String, dynamic>)
    //         .toList();
    // data.shuffle();
    // return data.take(8).toList();
    throw UnimplementedError();
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
    QuerySnapshot collection =
        await FirebaseFirestore.instance.collection(path).get();

    // based on how many documents you have in your collection
    // just pull one random index
    var random = Random().nextInt(collection.docs.length);

    // then just get the document that falls under that random index
    DocumentSnapshot randomDoc = collection.docs[random];
    return randomDoc.data() as Map<String, dynamic>;
  }
}
