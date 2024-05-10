import 'package:contact_learn/model/model.dart';
import 'package:dio/dio.dart';

class ServiceApi {
  Dio dio = Dio();

  Future<List<ApiModel>> getAll() async {
    try {
      final response = await dio
          .get("https://contacts-management-server.onrender.com/api/contacts");
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((json) => ApiModel.fromJsom(json)).toList();
      } else {
        throw Exception('unable to fetch data');
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await dio.delete(
        "https://contacts-management-server.onrender.com/api/contacts/$id");
    return response.statusCode == 200;
  }

  Future<void> addData(ApiModel model) async {
    try {
      final jsonData = model.toJson();

      await dio.post(
        "https://contacts-management-server.onrender.com/api/contacts",
        data: jsonData,
      );
    } catch (e) {
      throw Exception('Failed to add contact: $e');
    }
  }

  Future<void> updateData(ApiModel model) async {
    try {
      await dio.put(
          "https://contacts-management-server.onrender.com/api/contacts/${model.id}",
          data: model.toJson());
    } catch (e) {
      throw Exception('failed to update data');
    }
  }

  // Future<List<ApiModel>> fetch() async {
  //   try {
  //     final response = await dio
  //         .get("https://contacts-management-server.onrender.com/api/contacts");
  //     if (response.statusCode == 200) {
  //       List<dynamic> jsondata = response.data;
  //       return jsondata.map((item) => ApiModel.fromJsom(item)).toList();
  //     } else {
  //       throw Exception('failed to fetch data');
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
}
