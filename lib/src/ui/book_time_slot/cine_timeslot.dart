import 'package:flutter/material.dart';
import 'package:the_cinema/src/ui/book_seat_type/book_seat_type.dart';
import 'package:the_cinema/src/ui/conts.dart';

import '../svg_image.dart';
import 'book_time_slot_page.dart';

/// the list of time slot for each theatre
class WidgetCineTimeSlot extends StatefulWidget {
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

  @override
  _WidgetCineTimeSlotState createState() => _WidgetCineTimeSlotState();
}

class _WidgetCineTimeSlotState extends State<WidgetCineTimeSlot> {
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
          // show the theatre name if true
          widget.showCineName
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(widget.item.cineName),
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
              // show the location icon, distance and the loctaion if true
              widget.showCineDot
                  ? MySvgImage(
                      path: 'assets/images/ic_cine_dot.svg',
                      width: 9.94,
                      height: 12,
                      // color: COLOR_CONST.GRAY1,
                    )
                  : Container(),
              SizedBox(width: widget.showCineDot ? 7 : 0),
              Text(
                widget.item.textLocation,
              ),
              SizedBox(width: 11),
              Text(
                widget.item.textDistance,
              ),
            ],
          ),
          SizedBox(height: 16),
          // show the time slots available for the theatre
          Wrap(
            children: <Widget>[
              for (final timeSlot in widget.item.timeSlots)
                _WidgetTimeSlot(
                    timeSlot,
                    widget.item.timeSlots.indexOf(timeSlot) ==
                        widget.selectedIndex,
                    widget.selectedIndex != -1,
                    widget.movie)
            ],
          )
        ],
      ),
    );
  }
}

// time slot
class _WidgetTimeSlot extends StatefulWidget {
  ItemTimeSlot item;
  bool isSelected;
  bool isSmallMode;
  var movie;

  _WidgetTimeSlot(this.item, this.isSelected, this.isSmallMode, this.movie);

  @override
  __WidgetTimeSlotState createState() => __WidgetTimeSlotState();
}

class __WidgetTimeSlotState extends State<_WidgetTimeSlot> {
  @override
  Widget build(BuildContext context) {
    var itemWidth = 99.0;
    var fontSize = 14.0;
    var textPaddingHoz = 10.0;

    var textStyle = FONT_CONST.REGULAR_BLACK2_14;
    var timeColor =
        widget.item.hour % 2 == 0 ? COLOR_CONST.GREEN : COLOR_CONST.ORANGE;
    if (!widget.item.active) {
      timeColor = COLOR_CONST.BLACK_30;
    }

    var itemBg =
        widget.isSelected ? COLOR_CONST.GREEN : COLOR_CONST.TIME_SLOT_BG;
    var itemBorder =
        widget.isSelected ? Colors.transparent : COLOR_CONST.TIME_SLOT_BORDER;

    if (widget.isSelected) {
      timeColor = COLOR_CONST.WHITE;
      textStyle = FONT_CONST.MEDIUM_WHITE_14;
    }

    if (widget.isSmallMode) {
      itemWidth = 84.0;
      fontSize = 12.0;
    }

    return GestureDetector(
      onTap: () {
        if (!widget.isSmallMode) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookSeatType(widget.movie)));
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
            widget.item.time,
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
