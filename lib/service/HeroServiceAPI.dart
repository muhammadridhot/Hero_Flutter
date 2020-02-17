import 'dart:convert';

import 'package:fetch_in_flutter/models/HeroModel.dart';
import 'package:http/http.dart' as http;

class HeroServiceAPI{

  final heroAPIUrl = 'http://10.0.2.2:8081/hero/';
  Future<HeroModel> getHeroById(String id) async{
    final response = await http.get(heroAPIUrl+id);
    var jsonMap = json.decode(response.body);
    return HeroModel.fromJson(jsonMap["data"]);
  }

  Future<List<HeroModel>> getAllHero() async{
    final response = await http.get(heroAPIUrl);
    var jsonMap = json.decode(response.body);
    Iterable listJsonMap = jsonMap["data"];
    List<HeroModel> heroes = listJsonMap.map((element)=>(HeroModel.fromJson(element))).toList();
    return heroes;
  }
}