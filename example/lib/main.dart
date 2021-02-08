import 'dart:async';

import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    applyStringExtension();
  }

  Future<void> applyStringExtension() async {
    var email = "chiragprami@gmail.com";
    var isValidEmail = email.isEmail();
    var number = "2500";
    var convertedTODouble = number.convertToDouble();
    var convertedTODoubleWithFraction = number.convertToDouble(fraction: 2);
    var convertedToInt = number.convertToInt();
    String userName;
    var checkIsNullOrNot = userName.nullSafeString();
    var checkUserNameIsNull = userName.isNull();
    var alphaNumber = "9234AA44dd";
    var isAlphanumeric = number.isAlphanumeric();
    var userProfile = "20.20";
    var isValidPercentage = userProfile.isPercentage();
  }

  Future<void> applyContext(BuildContext context) async {
    /// Redirect screen
    context.redirectTo(child: NewScreen());

    /// Redirect Only It's Clear back stack widget and starting from this screen
    context.redirectTo(child: NewScreen());

    /// Hide Keyboard
    context.hideKeyboard();

    /// open Full Screen Dialog with transparent background
    context.openDialog(child: NewScreen());
  }

  get easyText => context.easyText(
      color: Colors.red,
      textSize: 12.0,
      fontFamily: "Roboto",
      text: "Hello Forks",
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Column(
          children: [
            easyText,
            WidgetUtils.spaceVertical(size: 2),
            WidgetUtils.spaceHorizontal(size: 2),
          ],
        ),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
