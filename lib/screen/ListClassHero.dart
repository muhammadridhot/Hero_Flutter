import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LisClassHero extends StatelessWidget{
  var dropDownValue;
  var dropDown;


  LisClassHero(this.dropDownValue, this.dropDown);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: DropdownButton<String>(
        value: dropDownValue,
        underline: Container(
          height: 2,
          color: Colors.blueAccent,
        ),
        onChanged: dropDown,
        items: <String>['Knight','Mage','Gun','Ninja','Samurai']
            .map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

}