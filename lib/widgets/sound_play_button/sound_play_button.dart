import 'dart:async';

//import 'package:audioplayers/audioplayers.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../includes.dart';

const _kIconSize = 16.0;

class SoundPlayButton extends StatefulWidget {
  final String audioUrl;

  const SoundPlayButton({
    Key? key,
    required this.audioUrl,
  }) : super(key: key);

  @override
  _SoundPlayButtonState createState() => _SoundPlayButtonState();
}

class _SoundPlayButtonState extends State<SoundPlayButton> {
  //final AudioPlayer _audioPlayer = AudioPlayer();

  bool _playing = false;
  int _playingAnimImageIndex = 0;
  Timer? _playingAnimTimer;

  @override
  void initState() {
    //_audioPlayer.onPlayerStateChanged.listen(_handlePlayerStateChanged);
    //_audioPlayer.onPlayerComplete.listen((event) {
    //  _handlePlayerStateChanged(PlayerState.completed);
    //});
    super.initState();
  }

  @override
  void dispose() {
    _stopPlayingAnimTimer();
    super.dispose();
  }

  // void _handlePlayerStateChanged(PlayerState state) {
  //   _playing = state == PlayerState.playing;
  //
  //   if (_playing && !(_playingAnimTimer?.isActive ?? false)) {
  //     _startPlayingAnimTimer();
  //   } else if (!_playing && (_playingAnimTimer?.isActive ?? false)) {
  //     _stopPlayingAnimTimer();
  //   }
  //   if (mounted) setState(() {});
  // }

  void _startPlayingAnimTimer() {
    _stopPlayingAnimTimer();
    _playingAnimTimer = Timer.periodic(
      const Duration(milliseconds: 300),
      (Timer timer) {
        int nextIndex = _playingAnimImageIndex - 1;
        if (nextIndex < 0) {
          nextIndex = 2;
        }
        _playingAnimImageIndex = nextIndex;
        setState(() {});
      },
    );
    _playingAnimImageIndex = 2;
    if (mounted) setState(() {});
  }

  void _stopPlayingAnimTimer() {
    if (_playingAnimTimer != null && _playingAnimTimer!.isActive) {
      _playingAnimTimer?.cancel();
    }
    _playingAnimTimer = null;
    _playingAnimImageIndex = 0;
  }

  void _handleClickPlay() async {
    //UrlSource urlSource = UrlSource(widget.audioUrl);
    //await _audioPlayer.play(urlSource);
    //_startPlayingAnimTimer();
  }

  void _handleClickStop() async {
    //await _audioPlayer.stop();
    _stopPlayingAnimTimer();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Center(
          child: IndexedStack(
            index: _playingAnimImageIndex,
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: _kIconSize,
                height: _kIconSize,
                child: Icon(
                  FluentIcons.speaker_2_20_regular,
                  size: _kIconSize,
                  color: Theme.of(context).textTheme.caption!.color,
                ),
              ),
              SizedBox(
                width: _kIconSize,
                height: _kIconSize,
                child: Icon(
                  FluentIcons.speaker_1_20_regular,
                  size: _kIconSize,
                  color: Theme.of(context).textTheme.caption!.color,
                ),
              ),
              SizedBox(
                width: _kIconSize,
                height: _kIconSize,
                child: Icon(
                  FluentIcons.speaker_0_20_regular,
                  size: _kIconSize,
                  color: Theme.of(context).textTheme.caption!.color,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (!_playing) {
            _handleClickPlay();
          } else {
            _handleClickStop();
          }
        },
      ),
    );
  }
}
