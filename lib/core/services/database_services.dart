abstract class DataBaseServices {
  Future<List<Map<String, dynamic>>> getData();
  Future<List<Map<String, dynamic>>> getRandomDocuments({
    required String path,
    required int limit,
  });
}
