import 'package:flutter/material.dart';


InputDecoration inputFormat(Color fillColor){
  return new InputDecoration(
    fillColor: fillColor,
    filled: true,
    border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(12.0),
        borderSide: new BorderSide(width: 0.0, color: fillColor)
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  );
}

TextStyle textStyle(double fontSize, Color color, FontWeight fontWeight){
  return new TextStyle(
      color: color,
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontWeight: fontWeight
  );
}

Container pinBox(double width, TextEditingController con, FocusNode focusNode,
    FocusNode nextFocusNode, Color boxColor, Color textColor, BuildContext context, bool show) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.0),
    width: width,
    child: new TextField(
      decoration: inputFormat(boxColor),
      controller: con,
      textAlign: TextAlign.center,
      cursorColor: boxColor,
      maxLines: 1,
      onChanged: (text) {
        if (text.length > 1) {
          con.text = text.substring(text.length - 1);
        }
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
      obscureText: !show,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      autofocus: false,
      style: textStyle(30.0, textColor, FontWeight.bold),
    ),
  );
}

List<Widget> pinBoxs(double width, List<TextEditingController> cons,
    Color boxColor, Color textColor, BuildContext context, bool show) {
  List<Widget> boxs = new List();
  List<FocusNode> focusNodes = new List();
  focusNodes.add(new FocusNode());
  for(int i = 0; i < cons.length ; i++){
    focusNodes.add(new FocusNode());
    if(i == cons.length - 1){
      focusNodes[i+1] = null;
    }
    boxs.add(pinBox(width, cons[i], focusNodes[i], focusNodes[i+1], boxColor, textColor,context, show));
  }
  return boxs;
}

