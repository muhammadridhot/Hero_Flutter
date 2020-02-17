import 'package:fetch_in_flutter/models/HeroModel.dart';
import 'package:fetch_in_flutter/screen/CardInfoHero.dart';
import 'package:fetch_in_flutter/screen/FormInputIdHero.dart';
import 'package:fetch_in_flutter/screen/ListClassHero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInputHero extends StatelessWidget {
  var getAllHero;
  var getHeroById;
  var addHero;
  var updateHero;
  var deleteHero;
  var idTextEditingCtrl;
  var nameTextEditingCtrl;
  var hpTextEditingCtrl;
  var damageTextEditingCtrl;
  var armorTextEditingCtrl;
  var titleTextEditingCtrl;
  var valueName, valueHp, valueDamage, valueArmor, valueTitle, valueClassHero;
  var dropDown;
  var dropDownValue;

  FormInputHero(
      this.getAllHero,
      this.getHeroById,
      this.addHero,
      this.updateHero,
      this.deleteHero,
      this.idTextEditingCtrl,
      this.nameTextEditingCtrl,
      this.hpTextEditingCtrl,
      this.damageTextEditingCtrl,
      this.armorTextEditingCtrl,
      this.titleTextEditingCtrl,
      this.valueName,
      this.valueHp,
      this.valueDamage,
      this.valueArmor,
      this.valueTitle,
      this.valueClassHero,
      this.dropDownValue,
      this.dropDown);

  Image loadNameImage() {
    if (valueClassHero == "Knight") {
      return Image.asset('images/knight.png');
    } else if (valueClassHero == "Ninja") {
      return Image.asset('images/ninja.png');
    } else if (valueClassHero == "Samurai") {
      return Image.asset('images/samurai.png');
    } else if (valueClassHero == "Mage") {
      return Image.asset('images/witch.png');
    } else if (valueClassHero == "Gun") {
      return Image.asset('images/kill.png');
    }
  }

  Image loadAttackImage() {
    if (valueClassHero == "Knight") {
      return Image.asset('images/attack.png');
    } else if (valueClassHero == "Ninja") {
      return Image.asset('images/kunai.png');
    } else if (valueClassHero == "Samurai") {
      return Image.asset('images/katana.png');
    } else if (valueClassHero == "Mage") {
      return Image.asset('images/magic-wand.png');
    } else if (valueClassHero == "Gun") {
      return Image.asset('images/gun.png');
    }
  }

  Image loadArmorImage() {
    if (valueClassHero == "Knight") {
      return Image.asset('images/knight_armor.png');
    } else if (valueClassHero == "Ninja") {
      return Image.asset('images/armor_ninja.png');
    } else if (valueClassHero == "Samurai") {
      return Image.asset('images/samurai_armor.png');
    } else if (valueClassHero == "Mage") {
      return Image.asset('images/armor_witch.png');
    } else if (valueClassHero == "Gun") {
      return Image.asset('images/armor_gun.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("INI FORM INPUT HERO ${this.valueClassHero}");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 2,
          color: Colors.lightBlue,
        ),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          CardInfoHero(valueName, valueHp, valueDamage, valueArmor, valueTitle,
              loadNameImage, loadAttackImage, loadArmorImage),
          TextFormField(
            key: Key("txtNameHero"),
            decoration: InputDecoration(
              hintText: 'Name',
            ),
            controller: nameTextEditingCtrl,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Hp',
            ),
            controller: hpTextEditingCtrl,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Damage',
            ),
            controller: damageTextEditingCtrl,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Armor',
            ),
            controller: armorTextEditingCtrl,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Title',
            ),
            controller: titleTextEditingCtrl,
          ),
          Row(
            children: <Widget>[
              FormInputIdHero(idTextEditingCtrl, getHeroById, deleteHero),
              Column(
                children: <Widget>[
                  LisClassHero(dropDownValue, dropDown),
                  RaisedButton(
                    key: Key("btnAddHero"),
                    child: Icon(Icons.add),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: addHero,
                  ),
                  RaisedButton(
                    child: Icon(Icons.update),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: updateHero,
                  ),
                  RaisedButton(
                    child: Text('Get All'),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: getAllHero,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
