import 'dart:io';

import 'package:demo/movie_list/movie.dart';
import 'package:flutter/material.dart';

class MovieLoginPage extends StatefulWidget {
  @override
  _MovieLoginPageState createState() => _MovieLoginPageState();
}

class _MovieLoginPageState extends State<MovieLoginPage> {
  bool isConnection = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200].withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: InkWell(
                  child: Center(
                    child: Text(
                      "NetFlix",
                      style: TextStyle(color: Colors.red, fontSize: 60),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/movielist.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Container(
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () {
                            if (isConnection) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Movie()));
                            } else {
                              checkInternetConnection(context);
                            }
                          },
                          color: Colors.white,
                          child: Text("Join Free for a month",
                              style: TextStyle(color: Colors.redAccent)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        child: FlatButton(
                          onPressed: () {
                            if (isConnection) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Movie()));
                            } else {
                              checkInternetConnection(context);
                            }
                          },
                          color: Colors.grey[300].withOpacity(0.5),
                          child: Text("Sign In",
                              style: TextStyle(color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 65.0, right: 65, left: 65),
                      child: Divider(
                        color: Colors.white,
                        height: 25,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkInternetConnection(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('check connection-------------->connected');
        isConnection = true;
      }
    } on SocketException catch (_) {
      isConnection = false;
      print('check connection-------------->not connected');
      connectionDialog();
    }
  }

  void connectionDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Please check your Internet connection"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              )
            ],
          );
        });
  }
}
