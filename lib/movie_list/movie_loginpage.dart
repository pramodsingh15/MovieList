import 'package:demo/movie_list/movie.dart';
import 'package:flutter/material.dart';

class MovieLoginPage extends StatefulWidget {
  @override
  _MovieLoginPageState createState() => _MovieLoginPageState();
}

class _MovieLoginPageState extends State<MovieLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: InkWell(
                child: Center(
                  child: Text(
                    "NetFlix",
                    style: TextStyle(color: Colors.red, fontSize: 40),
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Movie()));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo.png"), fit: BoxFit.fill),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.grey[300],
                        child: Text("data"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.grey[300],
                        child: Text("data"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
