import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height / 10,
        width: width,
        padding: const EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.white, Colors.blue]),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  print('pop');
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
