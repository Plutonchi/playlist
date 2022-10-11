import 'package:flutter/material.dart';

class SeekbarData {
   Duration duration = Duration.zero;
    Duration position = Duration.zero;

SeekbarData(this.position, this.duration);
}

class Seekbbar extends StatefulWidget {
  const Seekbbar({ Key? key }) : super(key: key);

  @override
  State<Seekbbar> createState() => _SeekbbarState();
}

class _SeekbbarState extends State<Seekbbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}