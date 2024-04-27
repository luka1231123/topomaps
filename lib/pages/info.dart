import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class info extends StatelessWidget {
  const info({super.key});

  //get widthText => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        foregroundColor: Colors.black,
        backgroundColor: Colors.deepPurple[200],
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Stack(children: [
        // Background image
        Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        LayoutBuilder(builder: (context, constraints) {
          String s =
              'Hi! We sell 3d topographical maps.\nOur products are printed with biodigradble PLA and then painted.\nto order one yourself you can find a location you like on the map\nenter your email and hit submit\nour system automatically detects the map location\nafter submition an email will come with more details';
          double widthText;
          if (MediaQuery.of(context).size.width > 600) {
            widthText = 40;
            s = s + "\n hover and click shift + scroll to look at the pictures";
          } else {
            //print(MediaQuery.of(context).size.width);
            widthText = 30;
          }
          return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
            Center(
                child: Container(
              color: Colors.deepOrange[200],
              width: MediaQuery.of(context).size.width / 1.05,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Center(
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: widthText),
                    s),
              ),
            )),
            Center(
                child: Container(
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/back.jpg',
                          fit: BoxFit.cover,
                          //width: double.infinity,
                          //height: double.infinity,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/back2.jpg',
                          fit: BoxFit.cover,
                          //width: double.infinity,
                          //height: double.infinity,
                        )),
                  ),
                ],
              ),
              color: Colors.deepOrange[300],
              width: MediaQuery.of(context).size.width / 1.05,
              height: MediaQuery.of(context).size.height / 1.5,
            )),
          ]);
        })
      ]),
    );
  }
}
