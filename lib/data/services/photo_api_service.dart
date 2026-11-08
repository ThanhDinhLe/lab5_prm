import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lab5_prm/data/models/photo.dart';

class PhotoApiService {
  static const _endpoint = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_endpoint));

    if (response.statusCode != 200) {
      throw Exception('Không thể tải ảnh. HTTP ${response.statusCode}');
    }

    final responseData = jsonDecode(response.body) as List<dynamic>;
    return responseData
        .map((item) => Photo.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
