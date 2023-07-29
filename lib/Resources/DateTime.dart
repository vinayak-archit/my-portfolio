// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class dateDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           // AppBar
//           backgroundColor: Colors.green.shade900,

//           // AppBar title
//           title: Text("Geeksforgeeks"),
//         ),
//         body: Container(
//           // Container/Wrapper
//           width: double.infinity,
//           child: Column(

//               // use Column for more Text()
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   // Day,Month Date,Year
//                   DateFormat.yMMMEd().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // Day,Month/Date in Numbers
//                   DateFormat.MEd().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // DayName,MonthName Date
//                   DateFormat.MMMMEEEEd().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // DayName,MonthName Date,Year
//                   DateFormat.yMMMMEEEEd().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // Full DayName only
//                   DateFormat.EEEE().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // Short DayName
//                   DateFormat.E().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // Month-Number
//                   DateFormat.M().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // short MonthName
//                   DateFormat.MMM().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // full MonthName
//                   DateFormat.LLLL().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   // Current Time only
//                   DateFormat.j().format(DateTime.now()),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ]),
//         ));
//   }
// }
