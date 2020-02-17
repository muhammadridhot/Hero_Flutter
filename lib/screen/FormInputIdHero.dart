import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInputIdHero extends StatelessWidget{
  var id;
  var getHeroById;
  var deleteHero;


  FormInputIdHero(this.id, this.getHeroById, this.deleteHero);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      child: Container(
        margin: EdgeInsets.fromLTRB(0,15.0,10.0,10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.lightBlue,
            )
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              controller: id,
              decoration: InputDecoration(
                  hintText: 'ID'
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Get By Id"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: getHeroById,
                ),
                RaisedButton(
                  child: Text("Delete By Id"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: deleteHero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}