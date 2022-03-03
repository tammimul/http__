import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:htttp/model.dart';



Future<Model> fetchNews() async {
  final response = await http.get(Uri.parse(
  'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=94fdd93e1c6c425eaf6fa2ff9626f851'));
  if (response.statusCode ==200){
    
    return Model.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("failed to load");
  }
}