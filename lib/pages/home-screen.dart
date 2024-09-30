import 'package:flutter/material.dart';
import 'package:flutter_side_project/widgets/custom-button.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: Color(0xFF252525),
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                iconSymbol: Icon(Icons.search),
                ismini: true,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff9effff),
              ),
              width: 365,
              height: 110,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text("notes"),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffB69CFF),
              ),
              width: 365,
              height: 110,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text("notes"),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xfffff599),
              ),
              width: 365,
              height: 110,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text("notes"),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff91f48f),
              ),
              width: 365,
              height: 110,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text("notes"),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xffFF9E9E),
              ),
              width: 365,
              height: 110,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text("notes"),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButton(iconSymbol: Icon(Icons.add)),
    );
  }
}
