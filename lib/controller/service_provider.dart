// import 'package:contact_learn/model/model.dart';
// import 'package:contact_learn/service/servise.dart';
// import 'package:flutter/material.dart';

// class ServiceProvider extends ChangeNotifier {
//   ServiceApi service = ServiceApi();
//   List<ApiModel> contacts = [];

//   Future<List<ApiModel>> fetchALlUsers() async {
//     try {
//       contacts = await ServiceApi().getAll();
//     } catch (e) {
//       throw Exception();
//     }
//     notifyListeners();
//     return [];
//   }

//   Future<void> deletaAlldata(String id) async {
//     try {
//       final isDone = await service.deleteData(id);
//       if (isDone) {
//         // contacts.removeWhere((element) => element.id == id);
//       }
//     } catch (e) {
//       throw Exception('Failed to delete');
//     }
//     notifyListeners();
//   }
// }

import 'package:contact_learn/model/model.dart';
import 'package:contact_learn/service/servise.dart';
import 'package:flutter/material.dart';

class Apiprovider extends ChangeNotifier {
  ServiceApi serviceapi = ServiceApi();

  Future<List<ApiModel>> getall() async {
    return await serviceapi.getAll();
  }

  Future<void> adddata(ApiModel model) async {
    await serviceapi.addData(model);
    notifyListeners();
  }

  Future<void> deleteddata(String id) async {
    await serviceapi.deleteData(id);
    notifyListeners();
  }

  Future<void> updatedata(ApiModel model) async {
    await serviceapi.updateData(model);
    notifyListeners();
  }
}
