import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Models/ProductionCompaniesModel.dart';
import 'package:movies/Models/moviesModel.dart';
import 'dart:convert' as convert;

Future<List<ProductionCompaniesBloc>> getData() async {
  List<ProductionCompaniesBloc> production = [];
  var url = "https://api.themoviedb.org/3/movie/550?api_key=c876c5378dabc83ab16fc2c046e36d85";
  final response = await http.get(Uri.parse(url));
  print("production");
  print(response.body);
  if (response.statusCode != 200) {
  } else {
    Map<String, dynamic> homePageJson = convert.jsonDecode(response.body);
    List<dynamic> responseJson = homePageJson["production_companies"];
    production = responseJson.map((data) {
      return ProductionCompaniesBloc.fromJson(data);
    }).toList();
  }
  return production;
}