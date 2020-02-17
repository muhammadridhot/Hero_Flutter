
import 'package:fetch_in_flutter/models/HeroModel.dart';

class ListHero{
  bool success;
  String message;
  List<HeroModel> data;

  ListHero({this.success,this.message,this.data});

  factory ListHero.fromJson(Map<String, dynamic> json){
    List<HeroModel> dataResult = (json['data'] as List)
    .map((dataHeroJson)=> HeroModel.fromJson(dataHeroJson))
        .toList();

    return ListHero(
      success:json['success'],
      message:json['message'],
      data: dataResult,
    );
  }
}