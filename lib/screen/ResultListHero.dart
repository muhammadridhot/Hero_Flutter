import 'dart:convert';

import 'package:fetch_in_flutter/models/ListHero.dart';
import 'package:fetch_in_flutter/screen/CardInfoHero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;

class ResultListHero extends StatefulWidget {
//  var hero;
//  var loading;

//  ResultListHero({this.loading});

  @override
  _ResultListHeroState createState() => _ResultListHeroState();
}

class _ResultListHeroState extends State<ResultListHero> {
  bool dialVisible = true;
  ListHero hero;
  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }


  bool loading;
  Future<ListHero> getAllHero() async {
    setState(() => loading = true);
    final response =
    await http.get('http://10.0.2.2:8081/hero');

    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        final heroModelJson = ListHero.fromJson(data);
        hero = heroModelJson;
        loading = false;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }


  String dropDownValueSort = 'Name';

  String dropdDownSort(String newValue) {
    setState(() {
      dropDownValueSort = newValue;
      return dropDownValueSort;
    });
  }

  Future<ListHero> getAllHeroSortName() async {
//    setState(() => loading = true);
    final uri = Uri.parse('http://10.0.2.2:8081/sort/');
    var params = {"by":dropDownValueSort};
    final newUri = uri.replace(queryParameters: params);
    final response =
    await http.get(newUri);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        print(response.body);
        final heroModelJson = ListHero.fromJson(data);
        hero = heroModelJson;
//        loading = false;
      });

    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<void> myDialog() async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Input'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
            Container(
            child: DropdownButton<String>(
              value: dropDownValueSort,
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: dropdDownSort,
              items: <String>['Name','Hp','Damage','Armor','Titlte','Class']
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: (){
                getAllHeroSortName();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  void initState() {
    super.initState();
    this.getAllHero();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print("Build ResultListHero");
    return Scaffold(
      body: Container(
        child: this.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: hero.data.length,
                itemBuilder: (context, index) {
                  final x = hero.data[index];
                  Image loadNameImage() {
                    if (x.classHero == "Knight") {
                      return Image.asset('images/knight.png');
                    } else if (x.classHero == "Ninja") {
                      return Image.asset('images/ninja.png');
                    } else if (x.classHero == "Samurai") {
                      return Image.asset('images/samurai.png');
                    } else if (x.classHero == "Mage") {
                      return Image.asset('images/witch.png');
                    } else if (x.classHero == "Gun") {
                      return Image.asset('images/kill.png');
                    }
                  }

                  Image loadAttackImage() {
                    if (x.classHero == "Knight") {
                      return Image.asset('images/attack.png');
                    } else if (x.classHero == "Ninja") {
                      return Image.asset('images/kunai.png');
                    } else if (x.classHero == "Samurai") {
                      return Image.asset('images/katana.png');
                    } else if (x.classHero == "Mage") {
                      return Image.asset('images/magic-wand.png');
                    } else if (x.classHero == "Gun") {
                      return Image.asset('images/gun.png');
                    }
                  }

                  Image loadArmorImage() {
                    if (x.classHero == "Knight") {
                      return Image.asset('images/knight_armor.png');
                    } else if (x.classHero == "Ninja") {
                      return Image.asset('images/armor_ninja.png');
                    } else if (x.classHero == "Samurai") {
                      return Image.asset('images/samurai_armor.png');
                    } else if (x.classHero == "Mage") {
                      return Image.asset('images/armor_witch.png');
                    } else if (x.classHero == "Gun") {
                      return Image.asset('images/armor_gun.png');
                    }
                  }

                  Color loadColorBorder() {
                    if (x.classHero == "Knight") {
                      return Colors.lightBlue;
                    } else if (x.classHero == "Ninja") {
                      return Colors.blueGrey;
                    } else if (x.classHero == "Samurai") {
                      return Colors.red;
                    } else if (x.classHero == "Mage") {
                      return Colors.green;
                    } else if (x.classHero == "Gun") {
                      return Colors.brown;
                    }
                  }

                  Image loadImageSkill() {
                    if (x.classHero == "Knight") {
                      return Image.asset('images/skill_knight.png');
                      ;
                    } else if (x.classHero == "Ninja") {
                      return Image.asset('images/skill_ninja.png');
                      ;
                    } else if (x.classHero == "Samurai") {
                      return Image.asset('images/skill_samurai.png');
                      ;
                    } else if (x.classHero == "Mage") {
                      return Image.asset('images/skill_mage.png');
                      ;
                    } else if (x.classHero == "Gun") {
                      return Image.asset('images/skill_gun.png');
                    }
                  }

                  Future<Null> deleteHero() {
                    var id = x.id.toString();
                    var url = 'http://10.0.2.2:8081/hero/' + id;
                    http.delete(url).then((response) {
                      print("success");
                      print(response.body);
                      getAllHero();
                    }, onError: (err) {
                      print(err);
                    });
                  }

                  return Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 4,
                        color: loadColorBorder(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 35,
                                    child: Tab(
                                      icon: loadNameImage(),
                                    )),
                                Text(
                                  x.name,
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 35,
                                    child: Tab(
                                      icon: Image.asset(
                                          'images/health_point.png'),
                                    )),
                                Text(
                                  x.hp.toString(),
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 35,
                                    child: Tab(
                                      icon: loadAttackImage(),
                                    )),
                                Text(
                                  x.damage.toString(),
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 35,
                                    child: Tab(
                                      icon: loadArmorImage(),
                                    )),
                                Text(
                                  x.armor.toString(),
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 35,
                                    child: Tab(
                                      icon: Image.asset('images/award.png'),
                                    )),
                                Text(
                                  x.title,
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0,30.0,20.0,10.0),
                              height: 90,
                              width: 90,
                              child: loadImageSkill(),
                            ),
                            Container(
                              margin: EdgeInsets.all(0.0),
                              padding: EdgeInsets.only(right: 0),
                              child: IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.delete),
                                onPressed: deleteHero,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
//          return Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10),
//              color: Color(0xff03a9f4),
//            ),
//            padding: EdgeInsets.all(10.0),
//            margin: EdgeInsets.all(15.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  x.name,
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//                Text(
//                  x.hp.toString(),
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//                Text(
//                  x.damage.toString(),
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//                Text(
//                  x.armor.toString(),
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//                Text(
//                  x.title,
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//              ],
//            ),
//          );
                }),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        visible: dialVisible,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.sort),
              backgroundColor: Colors.lightBlueAccent,
              label: 'Sort',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap:
//              myDialog
              getAllHeroSortName
          ),
        ],
      ),
    );
  }
}
