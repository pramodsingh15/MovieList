import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/movie_list/movie_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailsPage extends StatefulWidget {
  String id;
  List<MovieModal> movieList;
  MovieDetailsPage(this.id, this.movieList);
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  String id;
  List<MovieModal> list;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    list = widget.movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Container(
                        height: 280,
                        color: Colors.transparent,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                  child: Image.network(
                                    "${list.elementAt(0).imagePath}",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20.0, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  Icon(Icons.home, color: Colors.white)
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 180.0, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${list.elementAt(0).movieTitle}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.grey,
                                        child: Text(
                                          "${list.elementAt(0).movietype1}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        child: Text(
                                          "${list.elementAt(0).movietype2}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                  RatingBar(
                                    initialRating: 3,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.redAccent,
                                      size: 10,
                                    ),
                                    allowHalfRating: true,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        onPressed: () => {},
                        child: Icon(
                          Icons.home,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Share",
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "IMDb ",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        "${list.elementAt(0).imdb}",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "80%",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      Text(
                        " Match",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0.0,
                  top: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Year",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "${list.elementAt(0).year}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Country",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "${list.elementAt(0).country}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Length",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "${list.elementAt(0).length}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 35, left: 35),
                child: Divider(
                  color: Colors.grey,
                  height: 5,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "${list.elementAt(0).desc}",
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 35, left: 35),
                child: Divider(
                  color: Colors.grey,
                  height: 5,
                ),
              ),
              Text(
                "Screenshots",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              CarouselSlider(
                height: 200.0,
                enlargeCenterPage: true,
                items: list1.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Image.network(
                            i,
                            fit: BoxFit.fill,
                          ));
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List list1 = [
  'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQA_-tL18_rj9zEcjN6n41NEaJm-kRNF9UeOtvksZ4z_OW6jRA9',
  'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSXHgJxXktkn_mfZ5rL7pgomg7Fc1lJMgJ0cc2FUtDXMSCJwmRz',
  'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTqsZyQAmAMH1qTKuMjNXCNy5V7_aGesfRC6xc2LeF6y_UlWwAt',
  'http://www.gstatic.com/tv/thumb/v22vodart/24380/p24380_v_v8_ad.jpg',
  'http://www.movienewsletters.net/photos/156876R1.jpg'
];
