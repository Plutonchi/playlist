import 'package:flutter/material.dart';
import 'package:musicplay/screen/choosed.dart';
import 'package:musicplay/slider/sleder.dart';

class images extends StatefulWidget {
  const images({Key? key}) : super(key: key);

  @override
  State<images> createState() => _imagesState();
}

class _imagesState extends State<images> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 45),
            child: Image.asset(
              "assets/images/123.jpg",
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(
                "Mull3",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'alkalami',
                    letterSpacing: 5.0),
              ),
              Text(
                "Мечтатели",
                style: TextStyle(
                    fontSize: 45,
                    fontFamily: "alkalami",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4.0),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
