import 'package:flutter/material.dart';
import 'package:the_cinema/src/ui/book_seat_type/book_seat_type.dart';
import 'package:the_cinema/src/ui/conts.dart';

import '../svg_image.dart';
import 'book_time_slot_page.dart';

class WidgetCineTimeSlot extends StatelessWidget {
  ItemCineTimeSlot item;
  int selectedIndex = -1;
  bool showCineName = true;
  bool showCineDot = true;
  var movie;

  WidgetCineTimeSlot(this.item, this.movie);

  WidgetCineTimeSlot.selected({
    @required this.item,
    @required this.selectedIndex,
    @required this.showCineName,
    @required this.showCineDot,
    // @required this.movie,
  });

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 7),
      // color: COLOR_CONST.WHITE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          showCineName
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(item.cineName),
                    ),
                    GestureDetector(
                      onTap: () {
                        // _openCineLocation();
                      },
                      child: Icon(Icons.info_outline),
                    ),
                  ],
                )
              : Container(),
          SizedBox(height: 4),
          Row(
            children: <Widget>[
              showCineDot
                  ? MySvgImage(
                      path: 'assets/images/ic_cine_dot.svg',
                      width: 9.94,
                      height: 12,
                      // color: COLOR_CONST.GRAY1,
                    )
                  : Container(),
              SizedBox(width: showCineDot ? 7 : 0),
              Text(
                item.textLocation,
              ),
              SizedBox(width: 11),
              Text(
                item.textDistance,
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            children: <Widget>[
              for (final timeSlot in item.timeSlots)
                _WidgetTimeSlot(
                    timeSlot,
                    item.timeSlots.indexOf(timeSlot) == selectedIndex,
                    selectedIndex != -1,
                    movie)
            ],
          )
        ],
      ),
    );
  }
}

class _WidgetTimeSlot extends StatelessWidget {
  ItemTimeSlot item;
  bool isSelected;
  bool isSmallMode;
  var movie;

  _WidgetTimeSlot(this.item, this.isSelected, this.isSmallMode, this.movie);

  @override
  Widget build(BuildContext context) {
    var itemWidth = 99.0;
    var itemHeight = 40.0;
    var fontSize = 14.0;
    var textPaddingHoz = 10.0;

    var textStyle = FONT_CONST.REGULAR_BLACK2_14;
    var timeColor = item.hour % 2 == 0 ? COLOR_CONST.GREEN : COLOR_CONST.ORANGE;
    if (!item.active) {
      timeColor = COLOR_CONST.BLACK_30;
    }

    var itemBg = isSelected ? COLOR_CONST.GREEN : COLOR_CONST.TIME_SLOT_BG;
    var itemBorder =
        isSelected ? Colors.transparent : COLOR_CONST.TIME_SLOT_BORDER;

    if (isSelected) {
      timeColor = COLOR_CONST.WHITE;
      textStyle = FONT_CONST.MEDIUM_WHITE_14;
    }

    if (isSmallMode) {
      itemWidth = 84.0;
      itemHeight = 35.0;
      fontSize = 12.0;
    }

    return GestureDetector(
      onTap: () {
        if (!isSmallMode) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookSeatType(movie)));
        }
      },
      child: Container(
        width: itemWidth,
        padding: EdgeInsets.symmetric(vertical: textPaddingHoz),
        margin: EdgeInsets.only(right: 13, bottom: 13),
        decoration: BoxDecoration(
            border: Border.all(
              color: itemBorder,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: itemBg),
        child: Center(
          child: Text(
            item.time,
            style: textStyle.copyWith(color: timeColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}

class ItemTimeSlot {
  String time;
  int hour;
  bool active;
  bool selected;

  ItemTimeSlot(this.time, this.hour, this.active);
}
