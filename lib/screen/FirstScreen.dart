import 'dart:convert';
import 'package:fetch_in_flutter/models/HeroModel.dart';
import 'package:fetch_in_flutter/models/ListHero.dart';
import 'package:fetch_in_flutter/screen/SecondScreen.dart';
import 'package:fetch_in_flutter/service/HeroServiceAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'FormInputHero.dart';
import 'ResultListHero.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }
}

class FirstScreenState extends State {
//  Future<ListHero> hero;
  var idTextEditingCtrl = TextEditingController();
  var nameTextEditingCtrl = TextEditingController();
  var hpTextEditingCtrl = TextEditingController();
  var damageTextEditingCtrl = TextEditingController();
  var armorTextEditingCtrl = TextEditingController();
  var titleTextEditingCtrl = TextEditingController();
  String dropDownValue = 'Knight';

  ListHero hero;
  bool loading;
  bool getById = false;

  var valueName = "";
  var valueHp = "";
  var valueDamage = "";
  var valueArmor = "";
  var valueTitle = "";
  var valueClassHero = "";

  HeroModel heroById;
  var heroServiceAPI = HeroServiceAPI();

  Future<HeroModel> getHeroByID() async {
    var id = idTextEditingCtrl.text;
    heroServiceAPI.getHeroById(id).then((hero){
      setState(() {
        this.heroById = hero;
        nameTextEditingCtrl.text = hero.name;
        hpTextEditingCtrl.text = hero.hp.toString();
        damageTextEditingCtrl.text = hero.damage.toString();
        armorTextEditingCtrl.text = hero.armor.toString();
        titleTextEditingCtrl.text = hero.title;
        dropDownValue = hero.classHero;
//        valueName = hero.name;
//        valueHp = hero.hp.toString();
//        valueDamage = hero.damage.toString();
//        valueArmor = hero.armor.toString();
//        valueTitle = hero.title;
//        valueClassHero = hero.classHero;
      });
      print(this.heroById.name);
    });

//    var id = idTextEditingCtrl.text;
//    if (id != "") {
//      final response = await http.get("http://10.0.2.2:8081/hero/" + id);
//      setState(() {
//        getById = true;
//        final data = jsonDecode(response.body);
//        final heroModelJson = HeroModel.fromJson(data);
//        modelHero = heroModelJson;
//        idTextEditingCtrl.clear();
//        print(data);
//      });
//      Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(this.loading,this.modelHero)));
//    }

//    var future = http.get("http://10.0.2.2:8081/hero/" + id);
//    future.then((response) {
//      setState(() {
//        final data = jsonDecode(response.body);
//        final heroModelJson = ListHero.fromJson(data);
//        hero = heroModelJson;
//        loading = false;
//      });
//      print(response.body);
//    }, onError: (err) {
//      print(err);
//    });
//    http.get("http://10.0.2.2:8081/hero/"+id).then((response){
//      if (response.statusCode == 200) {
//        print(response.body);
//      }else{
//        throw Exception('Failed to load post');
//      }
//    });
  }

  List<HeroModel> listHero;
  Future<ListHero> getAllHero() async {
//    heroServiceAPI.getAllHero().then((heroes){
//      setState(() {
//        this.listHero = heroes;
//      });
//      print(listHero[1].name);
//    });
    setState(() => loading = true);
    final response = await http.get('http://10.0.2.2:8081/hero');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null){
        final heroModelJson = ListHero.fromJson(data);
        setState(() {
          hero = heroModelJson;
          loading = false;
        });
      }
      print(data);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultListHero()));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Null> addHero() {
    var url = "http://10.0.2.2:8081/hero";
    http
        .post(url,
            body: json.encode({
              "name": nameTextEditingCtrl.text,
              "hp": int.parse(hpTextEditingCtrl.text),
              "damage": int.parse(damageTextEditingCtrl.text),
              "armor": int.parse(armorTextEditingCtrl.text),
              "title": titleTextEditingCtrl.text,
              "classHero": dropDownValue
            }))
        .then((response) {
      if (response.statusCode < 200 ||
          response.statusCode > 400 ||
          json == null) {
        throw Exception('Failed to add hero');
      } else {
        print("Response body : ${response.body}");
        nameTextEditingCtrl.clear();
        hpTextEditingCtrl.clear();
        damageTextEditingCtrl.clear();
        armorTextEditingCtrl.clear();
        titleTextEditingCtrl.clear();
      }
    });
  }

  Future<Null> updateHero() {
    var id = idTextEditingCtrl.text;
    var url = 'http://10.0.2.2:8081/hero/' + id;
    http
        .put(url,
            body: json.encode({
              "name": nameTextEditingCtrl.text,
              "hp": int.parse(hpTextEditingCtrl.text),
              "damage": int.parse(damageTextEditingCtrl.text),
              "armor": int.parse(armorTextEditingCtrl.text),
              "title": titleTextEditingCtrl.text,
              "classHero":dropDownValue
            }))
        .then((response) {
      print("success");
      print(response.body);
      nameTextEditingCtrl.clear();
      hpTextEditingCtrl.clear();
      damageTextEditingCtrl.clear();
      armorTextEditingCtrl.clear();
      titleTextEditingCtrl.clear();
    }, onError: (err) {
      print(err);
    });
  }



  Future<Null> deleteHero() {
    var id = idTextEditingCtrl.text;
    var url = 'http://10.0.2.2:8081/hero/' + id;
    http.delete(url).then((response) {
      print("success");
      print(response.body);
    }, onError: (err) {
      print(err);
    });
  }

  String dropdDown(String newValue) {
    setState(() {
      dropDownValue = newValue;
      valueClassHero = dropDownValue;
      return dropDownValue;
    });
  }

  @override
  void initState() {
    super.initState();
//    this.getAllHero();
    valueClassHero = dropDownValue;
    nameTextEditingCtrl.addListener(() {
      setState(() {
        valueName = nameTextEditingCtrl.text;
      });
    });
    hpTextEditingCtrl.addListener(() {
      setState(() {
        valueHp = hpTextEditingCtrl.text;
      });
    });
    damageTextEditingCtrl.addListener(() {
      setState(() {
        valueDamage = damageTextEditingCtrl.text;
      });
    });
    armorTextEditingCtrl.addListener(() {
      setState(() {
        valueArmor = armorTextEditingCtrl.text;
      });
    });
    titleTextEditingCtrl.addListener(() {
      setState(() {
        valueTitle = titleTextEditingCtrl.text;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("INI FIRST SCREEN ${this.dropDownValue}");
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
      FormInputHero(
          getAllHero,
          getHeroByID,
          addHero,
          updateHero,
          deleteHero,
          idTextEditingCtrl,
          nameTextEditingCtrl,
          hpTextEditingCtrl,
          damageTextEditingCtrl,
          armorTextEditingCtrl,
          titleTextEditingCtrl,
          valueName,
          valueHp,
          valueDamage,
          valueArmor,
          valueTitle,
          valueClassHero,
          dropDownValue,
          dropdDown),
//      Flexible(
//        child: ResultListHero(
//          loading: this.loading,
//          hero: this.hero,
//        ),
//      ),
    ]),
            )));
  }
}
