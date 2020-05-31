import 'package:flutter/material.dart';
import 'package:the_cinema/src/blocs/navigation_bloc/navigation_bloc.dart';

class BookingPage extends StatelessWidget with NavigationState {
  final Function onMenuTap;

  const BookingPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.blueAccent,
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu), onPressed: onMenuTap),
              Text(
                "Booking",
                style: TextStyle(fontSize: 18),
              ),
              IconButton(icon: Icon(Icons.question_answer), onPressed: null),
            ],
          )
        ],
      ),
    );
  }
}
