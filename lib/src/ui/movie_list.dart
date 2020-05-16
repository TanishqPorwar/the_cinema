import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'details_page.dart';

List<Widget> imageSliders(List<String> imgList) {
  return imgList
      .map(
        (item) => Container(
          child: Image.asset(
            item,
            fit: BoxFit.contain,
            // height: 300,
          ),
        ),
      )
      .toList();
}

final List<String> imgList = [
  "assets/images/header1.jpg",
  "assets/images/header2.jpg",
  "assets/images/header3.jpg",
];

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // to fetch now showing movies
    bloc.fetchNowMovies();
    // to fetch up coming movies
    bloc.fetchUpMovies();
    // to fetch popular movies
    bloc.fetchPopularMovies();
    var mediaQuery = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSlider(imageSliders(imgList), 3),
                _streamBuilder(bloc.nowMovies, mediaQuery, "Now-Showing: "),
                _streamBuilder(bloc.upMovies, mediaQuery, "Up-Coming: "),
                _streamBuilder(bloc.popularMovies, mediaQuery, "Popular: ")
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(imageSliders, s) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: s),
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }

  /// builds list of movies from the stream
  Widget _streamBuilder(
      Stream<ItemModel> stream, MediaQueryData mediaQuery, String title) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        // if the snapshot of the stream has data
        // then build the movie list
        if (snapshot.hasData) {
          return buildList(snapshot, mediaQuery, title);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // if data not yet loaded return a loader
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child:
                SpinKitWave(color: Colors.green, type: SpinKitWaveType.center),
          ),
        );
      },
    );
  }

  /// build the movie list from the [snapshot.data]
  Widget buildList(AsyncSnapshot<ItemModel> snapshot, MediaQueryData mediaQuery,
      String title) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              FlatButton(onPressed: () {}, child: Text("See more -->"))
            ],
          ),
        ),
        Container(
          height: 200.0,
          child: ListView.builder(
              itemCount: snapshot.data.results.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0,
                    right:
                        index == snapshot.data.results.length - 1 ? 16.0 : 0.0,
                  ),

                  // create a tapable card
                  child: GestureDetector(
                    child: Card(
                      // give the card a circular rectangle shape
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // if the movie has a poster path the show the poster
                        // else show another image
                        child: Image.network(
                          (snapshot.data.results[index].poster_path != null)
                              ? 'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}'
                              : 'https://i.pinimg.com/originals/96/a0/0d/96a00d42b0ff8f80b7cdf2926a211e47.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // goto details page on tap
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                result: snapshot.data.results[index])),
                      );
                    },
                  ),
                );
              }),
        )
      ],
    );
  }
}
