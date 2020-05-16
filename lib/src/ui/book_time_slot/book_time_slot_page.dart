import 'dart:io';
import 'package:flutter/material.dart';

import 'cine_timeslot.dart';

// BookTimeSlot Page
class BookTimeSlotPage extends StatelessWidget {
  var movie;
  BookTimeSlotPage({this.movie});
  List<ItemCineTimeSlot> items = [
    ItemCineTimeSlot(
      'Inox 4K Dolby',
      'Bangalore',
      '2.4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, true),
        ItemTimeSlot('9:30 PM', 21, true),
        ItemTimeSlot('12:30 AM', 0, true),
      ],
    ),
    ItemCineTimeSlot(
      'PVR - Orion mall',
      'Bangalore',
      '3.2 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, false),
      ],
    ),
    ItemCineTimeSlot(
      'Cinepolis - ETA mall',
      'Bangalore',
      '4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
      ],
    ),
    ItemCineTimeSlot(
      'IMAX - 4K',
      'Bangalore',
      '4.4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, true),
      ],
    )
  ];
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              // custom appBar
              _buildWidgetAppBar(mediaQuery, context),
              // Expanded so that the content covers the remaining screen
              Expanded(
                  child: Stack(
                children: <Widget>[
                  // list of theatres and their timeslots
                  _buildListCineTimeSlot(),
                  // bottom button bar which has a datePicker and a language picker
                  _buildBtnToday(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  _buildListCineTimeSlot() {
    // a list of theatres and their show time slots
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index < items.length) {
          var item = items[index];
          return WidgetCineTimeSlot(item, movie);
        } else {
          return SizedBox(height: 55);
        }
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 14,
        );
      },
      itemCount: items.length + 1,
      physics: BouncingScrollPhysics(),
    );
  }

  // date and language pickers
  _buildBtnToday() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 56,
        padding: EdgeInsets.only(left: 20),
//        width: MediaQuery.of(_context).size.width,
        // color: COLOR_CONST.BLUE,
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, size: 14),
                    SizedBox(width: 6),
                    Text(
                        'Today, ${DateTime.now().day}/${DateTime.now().month}'),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 12)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Text('English, 2D'),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down, size: 10)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemCineTimeSlot {
  String cineName;
  String textLocation;
  String textDistance;
  List<ItemTimeSlot> timeSlots;

  ItemCineTimeSlot(
      this.cineName, this.textLocation, this.textDistance, this.timeSlots);
}

// Custom appBar
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
          Icons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ],
    ),
  );
}
