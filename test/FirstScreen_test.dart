import 'package:fetch_in_flutter/screen/FirstScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  //BUILD TEST
  testWidgets("hero main screen should have 1 textfield", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: FirstScreen(),));
    final nameTextField = find.byType(TextFormField);
    expect(nameTextField, findsNWidgets(6));
  });
  testWidgets("hero main screen should have 1 RaisedButton", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: FirstScreen(),));
    final buttons = find.byType(RaisedButton);
    expect(buttons, findsNWidgets(5));
  });
  testWidgets("hero main screen should have icon", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: FirstScreen(),));
    final icons = find.descendant(of: find.byType(RaisedButton),matching: find.byType(Icon));
    expect(icons, findsNWidgets(5));
  });
//  testWidgets("hero main screen should have icon", (WidgetTester tester) async{
//    await tester.pumpWidget(MaterialApp(home: FirstScreen(),));
//    final icons = find.byIcon(Icons.add);
//    expect(icons, findsOneWidget);
//  });

  //FUNCTIONAL TEST
  testWidgets("send button should change the textview with input text when clicked", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: FirstScreen(),));
//    await tester.enterText(find.byType(TextFormField), "Ridho");
    await tester.enterText(find.byKey(Key("txtNameHero")), "Ridho");
    await tester.tap(find.byKey(Key("btnAddHero")));
//    await tester.tap(find.byType(RaisedButton));

    await tester.pump();
    expect(find.text("Ridho"), findsOneWidget);
  });

}