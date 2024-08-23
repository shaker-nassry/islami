import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/hometabs/RadioApi.dart';

class RadioItem extends StatefulWidget {
  final ScrollController _scrollController = ScrollController();
  Radios radio;
  AudioPlayer audioPlayer;

  RadioItem({required this.radio, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.radio.name ?? '',
          style: TextStyle(fontSize: 30, color: Theme.of(context).dividerColor),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  widget._scrollController.animateTo(
                    widget._scrollController.position.minScrollExtent,
                    duration: Duration(milliseconds: 10),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                icon: ImageIcon(AssetImage('assets/images/next.png'))),
            SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: play,
                icon: ImageIcon(AssetImage('assets/images/play.png'))),
            SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: pause,
                icon: Icon(
                  Icons.pause,
                  size: 40,
                )),
            SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                widget._scrollController.animateTo(
                  widget._scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 10),
                  curve: Curves.fastOutSlowIn,
                );
              },
              icon: ImageIcon(AssetImage(
                'assets/images/back.png',
              )),
            )
          ],
        )
      ],
    );
  }

  void play() async {
    await widget.audioPlayer.pause();
    if (widget.radio.url != null) {
      await widget.audioPlayer.play(UrlSource(widget.radio.url!));
    }
    ;
    setState(() {});
  }

  void pause() {
    widget.audioPlayer.pause();
  }
}
