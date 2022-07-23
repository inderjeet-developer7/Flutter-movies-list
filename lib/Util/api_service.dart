import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movies_app/Models/MovieData.dart';

import 'AppConstants.dart';

class ApiService {
  Future<MovieData?> getData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.movieEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        MovieData model = movieDataFromJson(response.body) ;
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}