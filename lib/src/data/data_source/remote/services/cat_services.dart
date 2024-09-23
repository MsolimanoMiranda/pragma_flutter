import 'dart:convert';

import 'package:challenge_pragma_msolimano/src/data/api/api_config.dart';
import 'package:challenge_pragma_msolimano/src/domain/models/list_cats.dart';
import 'package:challenge_pragma_msolimano/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;

class CatServices {
  Future<Resource<ListCats>> find(String filter, int page) async {
    try {
      print(filter.isEmpty);
      const limit = 15;
      ListCats catsResponse = ListCats(cats: []);
      final setUrl = filter.isEmpty
          ? '${ApiConfig.API_URL}?limit=$limit&page=$page'
          : '${ApiConfig.API_URL}/search?limit=$limit&page=$page&q=$filter';
      print(setUrl);
      final url = Uri.parse(setUrl);
      final response = await http.get(url, headers: ApiConfig.HEADER_CAT_API);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        catsResponse.cats = ListCats.fromJsonList(data).cats;
      }
      return Success(catsResponse);
    } catch (e) {
      print(e);
      ListCats catsResponse = ListCats(cats: []);
      return Success(catsResponse);
    }
  }
}
