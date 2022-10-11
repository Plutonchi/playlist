import 'package:flutter/material.dart';

import '../screen/list.dart';

class Fon extends StatelessWidget {
  const Fon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 260,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/head.png'),
                fit: BoxFit.contain,
              ),
              color: Colors.pink,
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => first()),
                  );
                },
                icon: Icon(Icons.next_plan),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
