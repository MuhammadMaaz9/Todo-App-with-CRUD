import 'dart:developer';

import 'package:todoappwithapi/models/models.dart';
import 'package:todoappwithapi/services/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Model>?> postdata({isCompleted, title}) async {
    var url = Uri.parse(ApiConstants.baseurl + ApiConstants.userendpoint);
    var response = await http.post(url, body: {
      'title': '$title',
      'description': 'dddddddddddescriptionnnnnn 2',
      'category': 'cccccccccccategoryyyyyyyyyy 2',
      'timestamp': '0123131',
      'priority': '10',
      'user_id': 'ussssssssssser_idddddddddddddddddd 11',
      'isCompleted': "$isCompleted",
      'id': '8'
    });
  }

  Future<List<Model>?> getdata() async {
    try {
      var url = Uri.parse(ApiConstants.baseurl + ApiConstants.userendpoint);
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return modelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Model>?> putData({title, id}) async {
    print('$id');
    print('$title');
    var url =
        Uri.parse(ApiConstants.baseurl + ApiConstants.userendpoint + '/$id');
    var response = await http.put(url, body: {'id': '$id', 'title': '$title'});
    //   try {
    //     if (response.statusCode == 200) {
    //       print(response.statusCode);
    //       return modelFromJson(response.body);
    //     }
    //     if (response.statusCode == 400) {
    //       throw Exception("Bad request");
    //     } else {
    //       print(response.statusCode);
    //       throw Exception('Failed to Edit Item.');
    //     }
    //   } on Exception catch (e) {
    //     log(e.toString());
    //   }
  }
}
