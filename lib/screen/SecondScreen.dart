import 'package:fetch_in_flutter/screen/ResultListHero.dart';
import 'package:flutter/cupertino.dart';

class SecondScreen extends StatelessWidget{

  var loading;
  var hero;

  SecondScreen(this.loading, this.hero);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ResultListHero();
  }
}

