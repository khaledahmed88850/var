import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/services/database_services.dart';
import 'package:flutter_application_1/core/utils/firebase_endpoints.dart';

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
  Future<List<Map<String, dynamic>>> getRandomDocuments() async {
    CollectionReference collection = firestore.collection(
      FirebaseEndpoints.passwordChallenge,
    );
    // await firestore
    //     .collection(FirebaseEndpoints.passwordChallenge)
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

    while (randomIds.length < 8 && randomIds.length < allDocIds.length) {
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
}
