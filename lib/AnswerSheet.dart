// import 'package:bubble_answer_sheet/AnswerValue.dart';
// import 'package:flutter/material.dart';
// import 'package:sortedmap/sortedmap.dart';
//
// import 'Screens/AnswerSheetTable.dart';
// import 'Components/BottomBtn.dart';
// import 'Components/Round_icon_button.dart';
// import 'Constants.dart';
//
// class AnswerSheet extends StatefulWidget {
//   ScrollController myController = ScrollController();
//
//   @override
//   _AnswerSheetState createState() => _AnswerSheetState();
// }
//
// class _AnswerSheetState extends State<AnswerSheet> {
//   List<String> list = List(100);
//   Map<int, String> colorChange = new Map();
//   Map<int, Answer> ans = new SortedMap(Ordering.byKey());
//
//   Widget listOfWidgets(List<String> item, Map<int, Answer> map) {
//     List<Widget> list = List<Widget>();
//     for (var i = 0; i < item.length; i++) {
//       String index;
//       int j = i + 1;
//       if (j < 10) {
//         index = "0$j)";
//       } else {
//         index = "$j)";
//       }
//       list.add(
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               index,
//               style: kTextNumStyle,
//             ),
//             RoundIconButton(
//                 onPressed: () {
//                   setState(
//                     () {
//                       ans[i + 1] = Answer("A");
//                       colorChange[i] = "A";
//                     },
//                   );
//                 },
//                 selectedColor: colorChange[i] == "A"
//                     ? kSelectedColor
//                     : kDefaultButtonColor,
//                 ans: "A"),
//             RoundIconButton(
//               onPressed: () {
//                 setState(
//                   () {
//                     ans[i + 1] = Answer("B");
//                     colorChange[i] = "B";
//                   },
//                 );
//               },
//               selectedColor:
//                   colorChange[i] == "B" ? kSelectedColor : kDefaultButtonColor,
//               ans: "B",
//             ),
//             RoundIconButton(
//                 onPressed: () {
//                   setState(
//                     () {
//                       colorChange[i] = "C";
//                       ans[i + 1] = Answer("C");
//                     },
//                   );
//                 },
//                 selectedColor: colorChange[i] == "C"
//                     ? kSelectedColor
//                     : kDefaultButtonColor,
//                 ans: "C"),
//             RoundIconButton(
//               onPressed: () {
//                 setState(
//                   () {
//                     colorChange[i] = "D";
//                     ans[i + 1] = Answer("D");
//                   },
//                 );
//               },
//               selectedColor:
//                   colorChange[i] == "D" ? kSelectedColor : kDefaultButtonColor,
//               ans: "D",
//             ),
//           ],
//         ),
//       );
//     }
//     return Wrap(runSpacing: 20.0, children: list);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bubble Answer Sheet"),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: listOfWidgets(list, ans)),
//             BottomButton(
//                 buttonTitle: 'SUBMIT',
//                 onTap: () {
//                   //CalculatorBrain calc =
//                   // CalculatorBrain(height: height, weight: weight);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AnswerSheetResult(
//                         myObject: ans,
//                       ),
//                     ),
//                   );
//                   //  ),
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
