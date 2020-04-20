import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_cinema/src/ui/book_time_slot/book_time_slot_page.dart';
import 'package:the_cinema/src/ui/svg_image.dart';
import 'backdrop.dart';

class DetailsPage extends StatefulWidget {
  var result;
  DetailsPage({this.result});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var movie = widget.result;
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.only(),
            child: Stack(
              children: <Widget>[
                Image.network(
                  'https://ak2.picdn.net/shutterstock/videos/3845792/thumb/6.jpg',
                  height: mediaQuery.size.height,
                  width: mediaQuery.size.width,
                  fit: BoxFit.cover,
                ),
                Container(color: Color(0x00).withOpacity(0.6)),
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        BackdropImage(movie.poster_path),
                        _buildWidgetAppBar(mediaQuery, context),
                        _buildWidgetFloatingActionButton(mediaQuery),
                        _buildWidgetIconBuyAndShare(mediaQuery),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          _buildWidgetTitleMovie(context),
                          SizedBox(height: 4.0),
                          _buildWidgetGenreMovie(context),
                          SizedBox(height: 16.0),
                          _buildWidgetRating(),
                          SizedBox(height: 16.0),
                          _buildWidgetShortDescriptionMovie(context),
                          SizedBox(height: 16.0),
                          _buildWidgetSynopsisMovie(context),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  ],
                ),
                _buildBtnBookSeat()
              ],
            )),
      ),
    );
  }

  _buildBtnBookSeat() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 54,
        child: FlatButton(
          color: ThemeData.dark().accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySvgImage(
                width: 18.25,
                height: 16.1,
                path: 'assets/images/ic_sofa.svg',
              ),
              SizedBox(width: 5),
              Text('Book seats', style: TextStyle(fontSize: 20)),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookTimeSlotPage(
                  movie: widget.result,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWidgetAppBar(MediaQueryData mediaQuery, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: mediaQuery.padding.top == 0 ? 16.0 : mediaQuery.padding.top + 8.0,
        right: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Center(child: Text("The Cinema")),
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetFloatingActionButton(MediaQueryData mediaQuery) {
    return Column(
      children: <Widget>[
        SizedBox(height: mediaQuery.size.height / 2 - 60),
        Center(
          child: FloatingActionButton(
            onPressed: () {
              // TODO: do something in here
            },
            child: Icon(
              Icons.play_arrow,
              color: ThemeData.dark().primaryColor,
              size: 32.0,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetIconBuyAndShare(MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: mediaQuery.size.height / 2 - 40,
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.add),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetTitleMovie(BuildContext context) {
    return Center(
      child: Text(
        widget.result.title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildWidgetGenreMovie(BuildContext context) {
    return Center(
      child: Text(
        'Action',
        style: Theme.of(context).textTheme.subtitle.merge(
              TextStyle(color: Colors.grey),
            ),
      ),
    );
  }

  Widget _buildWidgetRating() {
    return Center(
      child: RatingBar(
        initialRating: (widget.result.vote_average).toDouble(),
        itemCount: 10,
        allowHalfRating: true,
        direction: Axis.horizontal,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return Icon(
            Icons.star,
            color: Colors.red[400],
          );
        },
        tapOnlyMode: true,
        itemSize: 24.0,
        unratedColor: Colors.black,
        onRatingUpdate: (rating) {
          /* Nothing to do in here */
        },
      ),
    );
  }

  Widget _buildWidgetShortDescriptionMovie(BuildContext context) {
    var date = widget.result.release_date.split("-");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Country\n',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(color: Colors.white54),
                      ),
                ),
                TextSpan(
                  text: 'USA',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Release\n',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(color: Colors.white54),
                      ),
                ),
                TextSpan(
                  text: '${date[2]}/${date[1]}/${date[0]}',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Lenght\n',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(color: Colors.white54),
                      ),
                ),
                TextSpan(
                  text: '112 min',
                  style: Theme.of(context).textTheme.subtitle.merge(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetSynopsisMovie(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Text(
          widget.result.overview,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
