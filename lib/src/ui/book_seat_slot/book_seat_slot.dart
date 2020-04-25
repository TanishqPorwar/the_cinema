import 'dart:io';

import 'package:flutter/material.dart';
import 'package:the_cinema/src/ui/book_seat_slot/cine_screen.dart';
import 'package:the_cinema/src/ui/book_seat_slot/item_grid_seat_slot.dart';
import 'package:the_cinema/src/ui/book_time_slot/book_time_slot_page.dart';
import 'package:the_cinema/src/ui/book_time_slot/cine_timeslot.dart';
import 'package:the_cinema/src/ui/conts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookSeatSlot extends StatefulWidget {
  @override
  _BookSeatSlotState createState() => _BookSeatSlotState();
}

class _BookSeatSlotState extends State<BookSeatSlot> {
  ItemCineTimeSlot _itemCineTimeSlot;
  Razorpay _razorpay;
  var options = {
    'key': 'rzp_test_4GXRtDKohcEytZ',
    'amount': 200000,
    'name': 'The Cinema',
    'description': 'Book Seats',
    'prefill': {'contact': '9876543210', 'email': 'test@gmail.com'},
  };
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _itemCineTimeSlot = ItemCineTimeSlot(
        'Cinema 4K Dolby', '${DateTime.now().weekday} April, 2020', '', [
      ItemTimeSlot('10:00 AM', 10, true),
      ItemTimeSlot('1:30 PM', 13, true),
      ItemTimeSlot('6:30 PM', 6, true),
    ]);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Success" + response.paymentId);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("E-Ticket"),
          content: Container(
            child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png"),
          ),
          contentPadding: EdgeInsets.all(25.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop('dialog'),
                child: Text("OK")),
          ],
        );
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Error: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Wallet: " + response.walletName);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(fit: StackFit.expand, children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildWidgetAppBar(mediaQuery, context),
                  WidgetCineTimeSlot.selected(
                    item: _itemCineTimeSlot,
                    selectedIndex: 0,
                    showCineName: false,
                    showCineDot: false,
                  ),
                  WidgetCineScreen(),
                  WidgetItemGridSeatSlot(
                    seatTypeName: '\$ 80.0 JACK',
                    seatRows: seatRowsJack,
                  ),
                  SizedBox(height: 14),
                  WidgetItemGridSeatSlot(
                    seatTypeName: '\$ 100.0 QUEEN',
                    seatRows: seatRowsQueen,
                  ),
                  SizedBox(height: 14),
                  WidgetItemGridSeatSlot(
                    seatTypeName: '\$ 120.0 KING',
                    seatRows: seatRowsKing,
                  ),
                  SizedBox(height: 64),
                ],
              ),
            ),
            _buildBtnPay(),
          ]),
        ),
      ),
    );
  }

  _buildBtnPay() {
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
              Text('Pay \$ 200.0', style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: () {
            _razorpay.open(options);
          },
        ),
      ),
    );
  }

  List<SeatRow> seatRowsKing = [
    SeatRow(
      rowId: 'I',
      count: 11,
      offs: [4, 5],
      booked: [],
    ),
    SeatRow(
      rowId: 'J',
      count: 11,
      offs: [],
      booked: [],
    ),
  ];

  List<SeatRow> seatRowsQueen = [
    SeatRow(
      rowId: 'F',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 3],
    ),
    SeatRow(
      rowId: 'G',
      count: 11,
      offs: [4, 5],
      booked: [6, 7, 8],
    ),
    SeatRow(
      rowId: 'H',
      count: 11,
      offs: [],
      booked: [0, 1, 4, 5, 9, 10],
    ),
  ];

  List<SeatRow> seatRowsJack = [
    SeatRow(
      rowId: 'A',
      count: 11,
      offs: [4, 5],
      booked: [0, 1, 2, 3],
    ),
    SeatRow(
      rowId: 'B',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 6, 7],
    ),
    SeatRow(
      rowId: 'C',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'D',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'E',
      count: 11,
      offs: [],
      booked: [2, 3, 4, 5, 6, 7],
    )
  ];
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
