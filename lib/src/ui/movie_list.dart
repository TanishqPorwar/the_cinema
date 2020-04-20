import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import 'details_page.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchNowMovies();
    bloc.fetchUpMovies();
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
                StreamBuilder(
                  stream: bloc.nowMovies,
                  builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot, mediaQuery, "Now-Showing: ");
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                StreamBuilder(
                  stream: bloc.upMovies,
                  builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot, mediaQuery, "Up-Coming: ");
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                StreamBuilder(
                  stream: bloc.popularMovies,
                  builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot, mediaQuery, "Popular: ");
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
                  child: GestureDetector(
                    child: Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          (snapshot.data.results[index].poster_path != null)
                              ? 'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}'
                              : 'https://i.pinimg.com/originals/96/a0/0d/96a00d42b0ff8f80b7cdf2926a211e47.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
