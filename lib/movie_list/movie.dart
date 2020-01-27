import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/movie_list/movie_detailspage.dart';
import 'package:demo/movie_list/movie_modal.dart';
import 'package:flutter/material.dart';

class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  List<MovieModal> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 0,
            ),
            Expanded(
              child: CarouselSlider(
                height: 200.0,
                enlargeCenterPage: true,
                items: movieChoice.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: InkWell(
                              child: Image.network(
                                i.imagePath,
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                String id = i.id;
                                print(id);
                                if (id.contains(i.id)) {
                                  list.add(i);
                                }
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetailsPage(id, list)));
                              },
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  physics: ScrollPhysics(),
                  children: List.generate(movieChoice.length, (index) {
                    return Center(
                      child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 8,
                                child: Image.network(
                                    movieChoice[index].imagePath)),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 75,
                                child: Text(
                                  movieChoice[index].movieTitle,
                                  style: TextStyle(fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          String id = movieChoice[index].id;
                          print(id);
                          if (id.contains(movieChoice[index].id)) {
                            list.add(movieChoice[index]);
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsPage(id, list)));
                        },
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

const List<MovieModal> movieChoice = const <MovieModal>[
  const MovieModal(
      id: "1",
      imagePath:
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQA_-tL18_rj9zEcjN6n41NEaJm-kRNF9UeOtvksZ4z_OW6jRA9",
      movieTitle: "Avengers",
      movietype1: "Action",
      movietype2: "Thriller",
      imdb: "8.9",
      year: "2012",
      country: "USA",
      length: "145",
      desc:
          "Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers."),
  const MovieModal(
      id: "2",
      imagePath:
          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSXHgJxXktkn_mfZ5rL7pgomg7Fc1lJMgJ0cc2FUtDXMSCJwmRz",
      movieTitle: "DoLittle",
      movietype1: "Comedy",
      movietype2: "Thriller",
      imdb: "7.8",
      year: "2020",
      country: "USA",
      length: "120",
      desc:
          "Dolittle is a 2020 American fantasy adventure film directed by Stephen Gaghan, from a screenplay by Gaghan, Dan Gregor, and Doug Mand, from a story by Thomas Shepherd."),
  const MovieModal(
      id: "3",
      imagePath: "http://www.movienewsletters.net/photos/156876R1.jpg",
      movieTitle: "IronMan 3",
      movietype1: "Action",
      movietype2: "Thriller",
      imdb: "7.6",
      year: "2016",
      country: "India",
      length: "135",
      desc:
          "Iron Man 3 is a 2013 American superhero film based on the Marvel Comics character Iron Man,"),
  const MovieModal(
      id: "4",
      imagePath:
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTqsZyQAmAMH1qTKuMjNXCNy5V7_aGesfRC6xc2LeF6y_UlWwAt",
      movieTitle: "Rambo",
      movietype1: "Comedy",
      movietype2: "Thriller",
      imdb: "7.9",
      year: "2013",
      country: "Britain",
      length: "1126",
      desc:
          "Rambo is an American media franchise centered on a series of action films. There have been five films released so far in the series: First Blood (1982)."),
  const MovieModal(
      id: "5",
      imagePath:
          "http://www.gstatic.com/tv/thumb/v22vodart/24380/p24380_v_v8_ad.jpg",
      movieTitle: "Stuart Little",
      movietype1: "Comedy",
      movietype2: "Thriller",
      imdb: "8.4",
      year: "2014",
      country: "USA",
      length: "155",
      desc:
          "Stuart Little is a 1999 American family CGI animated/live-action comedy film loosely based on the novel of the same name by E. B. White. "),
  const MovieModal(
      id: "6",
      imagePath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPzzfxN6Ugvq902Ut7A-QkCDOqLzzbiYQ2bPk2pn5D9fBZBrT_",
      movieTitle: "SpiderMan",
      movietype1: "Action",
      movietype2: "Thriller",
      imdb: "8.4",
      year: "2014",
      country: "USA",
      length: "150",
      desc:
          "Spider-Man: Far From Home is a 2019 American superhero film based on the Marvel Comics character Spider-Man, co-produced by Columbia Pictures and Marvel Studios. "),
];
