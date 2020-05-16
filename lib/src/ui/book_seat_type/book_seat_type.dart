import 'package:flutter/material.dart';
import 'package:the_cinema/src/ui/book_seat_slot/book_seat_slot.dart';
import 'package:the_cinema/src/ui/book_seat_type/how_many_seats.dart';
import 'package:the_cinema/src/ui/book_time_slot/book_time_slot_page.dart';
import 'package:the_cinema/src/ui/book_time_slot/cine_timeslot.dart';
import 'package:the_cinema/src/ui/conts.dart';
import 'package:the_cinema/src/ui/svg_image.dart';

// book seat type page
class BookSeatType extends StatefulWidget {
  var movie;
  BookSeatType(this.movie);
  @override
  _BookSeatTypeState createState() => _BookSeatTypeState();
}

class _BookSeatTypeState extends State<BookSeatType> {
  ItemCineTimeSlot _itemCineTimeSlot;

  @override
  void initState() {
    _itemCineTimeSlot = ItemCineTimeSlot(
        'Cinema 4K Dolby', '${DateTime.now().weekday} April, 2020', '', [
      ItemTimeSlot('10:00 AM', 10, true),
      ItemTimeSlot('1:30 PM', 13, true),
      ItemTimeSlot('6:30 PM', 6, true),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // show the selected time slot of the theatre
                    WidgetCineTimeSlot.selected(
                      item: _itemCineTimeSlot,
                      selectedIndex: 0,
                      showCineName: true,
                      showCineDot: false,
                    ),
                    SizedBox(height: 14),
                    // select number of seats and seat type
                    WidgetHowManySeats(),
                  ],
                ),
              ),
              // select seat button
              _buildBtnSelectSeat(),
            ],
          ),
        ),
      ),
    );
  }

  _buildBtnSelectSeat() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 54,
        child: FlatButton(
          color: COLOR_CONST.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Select seats', style: FONT_CONST.MEDIUM_WHITE_16),
              SizedBox(
                width: 8,
              ),
              MySvgImage(
                  path: "assets/images/ic_sofa.svg", width: 16, height: 16),
            ],
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookSeatSlot()));
          },
        ),
      ),
    );
  }
}
