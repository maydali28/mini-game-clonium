import 'package:flutter/material.dart';
import 'package:audio_widget/audio_widget.dart';

class Sound extends StatefulWidget {
  @override
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<Sound> with WidgetsBindingObserver {
  bool _play = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() => _play = true);
    } else if (state == AppLifecycleState.inactive) {
      setState(() => _play = false);
    } else if (state == AppLifecycleState.paused) {
      setState(() => _play = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Audio.assets(
      path: "assets/gamemusic.mp3",
      play: _play,
      child: ButtonTheme(
        minWidth: 50,
        height: 50,
        child: FlatButton(
          child: Icon(
            _play ? Icons.volume_up : Icons.volume_off,
            color: Color(0xff81b9da),
          ),
          onPressed: () {
            setState(() {
              _play = !_play;
            });
          },
        ),
      ),
    );
  }
}
