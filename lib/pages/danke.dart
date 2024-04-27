import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class danke extends StatelessWidget {
  const danke({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // Background image
      Image.asset(
        'assets/background.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      LayoutBuilder(builder: (context, constraints) {
        return Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                    color: Colors.deepOrange[200],
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 50),
                          "Thank you! \n we will shortly send you an email with further details"),
                    ))));
      })
    ]));
  }
}
