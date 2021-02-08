
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Extensions {
  static const MethodChannel _channel =
      const MethodChannel('extensions');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}



extension EmailValidator on String {

  /// Email Validation
  bool isEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

 /// Check valid digit ex:1,1.20,10.20,100.00 is valid but 1..20 or  1.20.... etc not valid
  bool isDouble() {
    return RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$')
        .hasMatch(this) ;
  }

  bool isDigit() {
    return RegExp('.*[0-9].*')
        .hasMatch(this) ;
  }

  bool isAlphanumeric() {
    return RegExp('[A-Za-z0-9]*')
        .hasMatch(this) ;
  }



  /// Check valid percentage ex:1,1.20,10.20,100.00 is valid but 1..20 or  1.20.... etc not valid or between 0 to 100
  bool isPercentage() {
    var value = this.convertToDouble();
    print("valid_percentage $value");
    return RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$')
        .hasMatch(this) &&
        value > 0.0 &&
        value < 100.00;
  }


  /// check is string is null including 'null' string
  bool isNull() {
    return this == null
        ? true
        : this.isEmpty
        ? true
        : this == "null"
        ? true
        : false;
  }

  /// convert String to Int
  convertToInt() {
    return this.isNull() ? 0 : int.parse(this);
  }

  /// convert String to double
  convertToDouble({int fraction}) {
    return this.isNull()
        ? 0.0
        : fraction != null
        ? double.parse(double.parse(this).toStringAsFixed(2))
        : double.parse(this);
  }

  /// if string null then blank string display instead of null or exceptions.
  nullSafeString() {
    return this != null ? this : "";
  }
}

extension ContextExtension on BuildContext {

   Future<dynamic> hideKeyboard() async {
    FocusScope.of(this).requestFocus(new FocusNode());
  }

   Future<dynamic> redirectTo({Widget child}) async {
    FocusScope.of(this).requestFocus(new FocusNode());
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => child),
    );
  }

   Future<dynamic> redirectOnly({Widget child}) async {
    FocusScope.of(this).requestFocus(new FocusNode());
    return Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => child),
            (Route<dynamic> route) => false);
  }

   Future<dynamic> pageJump(PageController controller, int nextPage) async {
    var result = controller.animateToPage(nextPage,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    return result;
  }

   Future<dynamic> openDialog(Widget child) async {
    var result = showDialog(
        barrierDismissible: true,
        context: this,
        builder: (_) => Material(
          type: MaterialType.transparency,
          child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: child,
              )),
        ));
    return result;
  }


   static Widget line(
       {bool isHorizontal = true, Color color = Colors.black}) {
     return Container(
       color: color.withOpacity(0.06),
       height: isHorizontal ? 1.0 : double.infinity,
       width: isHorizontal ? double.infinity : 1.0,
     );
   }


    TextStyle applyStyle({
     @required BuildContext context,
     double textSize = 12.0,
     Color textColor = Colors.black,
     FontWeight fontWeight = FontWeight.w500,
     double letterSpacing,
     double fontHeight,
     TextDecoration decoration = TextDecoration.none,
     fontFamily = "roboto",
   }) {
     return TextStyle(
         fontFamily: fontFamily,
         fontSize: textSize,
         color: textColor,
         decoration: decoration,
         fontWeight: fontWeight);
   }

    Widget easyText(
       {
         String text,
         TextAlign textAlign,
         Color color = Colors.teal,
         int maxLines,
         double textSize = 12.0,
         FontWeight fontWeight = FontWeight.w400,
         String fontFamily = "roboto",
         TextDecoration decoration = TextDecoration.none}) {
     return Text(
       '$text',
       textAlign: textAlign,
       style: applyStyle(
         context: this,
         textSize: textSize,
         textColor: color,
         fontFamily: fontFamily,
         decoration: decoration,
         fontWeight: fontWeight,
       ),
     );
   }

}

class WidgetUtils{
  static Widget spaceHorizontal({bool isHorizontal = true, double size}) {
    return Container(
      height: isHorizontal ? 0 : size,
      width: isHorizontal ? size : 0,
    );
  }

  static Widget spaceVertical({double size}) {
    return Container(
      height: double.parse(size.toString()),
      width: 0.0,
    );
  }
}


