import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({this.title, this.onpress, Key key}) : super(key: key);
  final String title;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.blue[700],
        onPressed: () {
          onpress();
        },
        child: Text(
          "NEXT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
