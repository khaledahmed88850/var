abstract class DataBaseServices {
  Future<List<Map<String, dynamic>>> getData({
    required String path,
    required int limit,
  });
  Future<Map<String, dynamic>> getRandomSingleDocument({required String path});
  Future<List<Map<String, dynamic>>> getRandomDocuments({
    required String path,
    required int limit,
  });
}
