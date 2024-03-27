import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c10_str/models/NewsResponse.dart';
import 'package:news_c10_str/models/source_response.dart';
import 'package:news_c10_str/shared/components/constants.dart';



class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": "bcd4ad270b794f94bee66a981f269bce","category": category});
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);

    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url =
        Uri.https(Constants.BASE_URL, "/v2/everything", {"sources": sourceId});
    var response = await http
        .get(url, headers: {"x-api-key": "bcd4ad270b794f94bee66a981f269bce"});

    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> getSearchNewsData(String sourceId,String searchText) async{
    Uri url =
    Uri.https(Constants.BASE_URL, "/v2/everything", {"sources": sourceId,"q":searchText,"searchIn":"title,description"});
    var response = await http
        .get(url, headers: {"x-api-key": "bcd4ad270b794f94bee66a981f269bce"});

    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
