import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  MapPosition cent = new MapPosition(
      center: LatLng(41.6938, 44.8015),
      bounds: LatLngBounds(LatLng(1, 0), LatLng(0, 0)),
      hasGesture: false);
  Widget desktop(BuildContext context) {
    final _text = TextEditingController();
    final _text2 = TextEditingController();
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange[100],
                ),
                child: FlutterMap(
                  options: MapOptions(
                    onPositionChanged: (position, hasGesture) {
                      setState(() {
                        cent = position;
                      });
                    },
                    initialCenter: LatLng(41.6938, 44.8015),
                    initialZoom: 8.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                  ],
                ))),
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange[300],
              ),
              child: Center(
                  child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[400]),
                                  child: Center(
                                    child: Text(
                                        style: TextStyle(fontSize: 40),
                                        "longitude"),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[200]),
                                  child: Center(
                                      child: Text(
                                          style: TextStyle(fontSize: 30),
                                          cent.center!.longitude.toString())),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[400]),
                                  child: Center(
                                    child: Text(
                                        style: TextStyle(fontSize: 40),
                                        "Latitude"),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[200]),
                                  child: Center(
                                      child: Text(
                                          style: TextStyle(fontSize: 30),
                                          cent.center!.latitude.toString())),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[400]),
                                  child: Center(
                                    child: Text(
                                        style: TextStyle(fontSize: 40),
                                        "Location"),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[200]),
                                  child: Center(
                                      child: TextField(
                                          obscureText: false,
                                          controller: _text2,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText:
                                                'enter specific location (optional)',
                                          ))),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[400]),
                                  child: Center(
                                    child: Text(
                                        style: TextStyle(fontSize: 40),
                                        "Email"),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange[200]),
                                  child: Center(
                                      child: TextField(
                                          obscureText: false,
                                          controller: _text,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'enter email (required)',
                                          ))),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .deepOrange[100], // Set the background color
                              foregroundColor: Colors
                                  .deepOrange[1000], // Set the foreground color
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            if (!_text.text.isEmpty) {
                              final Map<String, String> headers = {
                                HttpHeaders.contentTypeHeader:
                                    "application/json",
                              };
                              final dio = Dio();
                              dio.post(
                                "https://d77a-212-58-120-4.ngrok-free.app/submit/",
                                options: Options(headers: headers),
                                data: {
                                  "log": cent.center!.longitude.toString(),
                                  "lang": cent.center!.latitude.toString(),
                                  "zoom": cent.zoom.toString(),
                                  "spec": _text2.text,
                                  "email": _text.text,
                                },
                              );
                              Navigator.pushNamed(context, '/danke');
                            }
                          },
                          child:
                              Text(style: TextStyle(fontSize: 40), 'Submit')),
                    ),
                  ),
                ],
              )),
            ))
      ],
    );
  }

  Widget mobile(BuildContext context) {
    final _text = TextEditingController();
    final _text2 = TextEditingController();
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange[100],
                ),
                child: FlutterMap(
                  options: MapOptions(
                    onPositionChanged: (position, hasGesture) {
                      setState(() {
                        cent = position;
                      });
                    },
                    initialCenter: LatLng(41.6938, 44.8015),
                    initialZoom: 8.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                  ],
                ))),
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange[300],
              ),
              child: Center(
                  child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[400]),
                              child: Center(
                                child: Text(
                                    style: TextStyle(fontSize: 20),
                                    "longitude"),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[200]),
                              child: Center(
                                  child: Text(
                                      style: TextStyle(fontSize: 12),
                                      cent.center!.longitude.toString())),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[400]),
                              child: Center(
                                child: Text(
                                    style: TextStyle(fontSize: 20), "Latitude"),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[200]),
                              child: Center(
                                  child: Text(
                                      style: TextStyle(fontSize: 12),
                                      cent.center!.latitude.toString())),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[400]),
                              child: Center(
                                child: Text(
                                    style: TextStyle(fontSize: 20), "Location"),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[200]),
                              child: Center(
                                  child: TextField(
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText:
                                            'enter specific location (optional)',
                                      ))),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[400]),
                              child: Center(
                                child: Text(
                                    style: TextStyle(fontSize: 20), "Email"),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange[200]),
                              child: Center(
                                  child: TextField(
                                      obscureText: false,
                                      controller: _text,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'enter email (required)',
                                      ))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .deepOrange[100], // Set the background color
                              foregroundColor: Colors
                                  .deepOrange[1000], // Set the foreground color
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            if (!_text.text.isEmpty) {
                              final Map<String, String> headers = {
                                HttpHeaders.contentTypeHeader:
                                    "application/json",
                              };
                              final dio = Dio();
                              dio.post(
                                "https://d77a-212-58-120-4.ngrok-free.app/submit/",
                                options: Options(headers: headers),
                                data: {
                                  "log": cent.center!.longitude.toString(),
                                  "lang": cent.center!.latitude.toString(),
                                  "zoom": cent.zoom.toString(),
                                  "spec": _text2.text,
                                  "email": _text.text,
                                },
                              );
                              Navigator.pushNamed(context, '/danke');
                            }
                          },
                          child:
                              Text(style: TextStyle(fontSize: 30), 'Submit')),
                    ),
                  ),
                ],
              )),
            ))
      ],
    );
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 1000;
    return Scaffold(
      body: Stack(children: [
        // Background image
        Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Logo and button
        LayoutBuilder(builder: (context, constraints) {
          if (!isMobile) {
            return desktop(context);
          } else {
            return mobile(context);
          }
        })
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/info');
        },
        foregroundColor: Colors.black,
        backgroundColor: Colors.deepPurple[200],
        child: const Icon(Icons.info),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
