import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class buttons extends StatefulWidget {
  const buttons({Key? key}) : super(key: key);

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return '-- :--';
    } else {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
  }

  final audioPlayer = AudioPlayer();

  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void initState() {
    
    super.initState();

    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newduration) {
      setState(() {
        duration = newduration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newposition) {
      setState(() {
        position = newposition;
      });
    });
  }

  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final player = AudioCache(
      prefix: 'assets/audio/',
    );
    final url = await player.load("8.mp3");

    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(
              disabledThumbRadius: 4,
              enabledThumbRadius: 4,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 10,
            ),
            activeTrackColor: Colors.white.withOpacity(0.6),
            inactiveTickMarkColor: Colors.red,
            thumbColor: Colors.white,
            overlayColor: Colors.white,
          ),
          child: Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
              await audioPlayer.resume();
              // return;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                _formatDuration(position),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                _formatDuration(duration),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              color: Colors.white,
              iconSize: 40,
              onPressed: () {},
              icon: Icon(Icons.skip_previous),
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white.withOpacity(0.7),
              ),
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.resume();
                }
              },
            ),
            IconButton(
              color: Colors.white,
              iconSize: 40,
              onPressed: () {},
              icon: Icon(Icons.skip_next),
            ),
          ],
        ),
      ],
    );
  }
}
