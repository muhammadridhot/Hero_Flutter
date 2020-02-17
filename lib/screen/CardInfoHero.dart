import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardInfoHero extends StatelessWidget{
  var valueName, valueHp, valueDamage, valueArmor, valueTitle;
  var loadNameImage;
  var loadAttackImage;
  var loadArmorImage;

  CardInfoHero(
      this.valueName,
      this.valueHp,
      this.valueDamage,
      this.valueArmor,
      this.valueTitle,
      this.loadNameImage,
      this.loadAttackImage,
      this.loadArmorImage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 2,
          color: Colors.lightBlue,
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
                  Text(valueName == "" ? 'Empty' : valueName,style: TextStyle(fontSize: 17),)
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 35,
                      width: 35,
                      child: Tab(
                        icon: Image.asset('images/health_point.png'),
                      )),
                  Text(valueHp == "" ? 'Empty' : valueHp,style: TextStyle(fontSize: 17),)
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
                  Text(valueDamage == "" ? 'Empty' : valueDamage,style: TextStyle(fontSize: 17),)
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
                  Text(valueArmor == "" ? 'Empty' : valueArmor,style: TextStyle(fontSize: 17),)
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
                  Text(valueTitle == "" ? 'Empty' : valueTitle,style: TextStyle(fontSize: 17),)
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            height: 90,
            width: 90,
            child: Image.asset('images/enigma.png'),
          )
        ],
      ),
    );
  }

}