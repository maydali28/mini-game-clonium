import 'package:flutter/material.dart';
import 'package:audio_widget/audio_widget.dart';

class Sound extends StatefulWidget {
  @override
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<Sound> {
  @override
  Widget build(BuildContext context) {
    bool sound = true;
    return Audio.assets(
      path: "assets/Loveshadow.mp3",
      play: sound,
      child: ButtonTheme(
        minWidth: 50,
        height: 50,
        child: FlatButton(
          child: Icon(
            sound ? Icons.volume_up : Icons.volume_off,
            color: Color(0xff19817e),
          ),
          onPressed: () {
            setState(() {
              sound = !sound;
            });
          },
        ),
      ),
    );
  }
}

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Color(0xffccffff),
        hoverColor: Color(0xff64e9e9),
        highlightColor: Color(0xffcdffcd),
        splashColor: Color(0xff19817e),
        animationDuration: Duration(seconds: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            width: 5.0,
            color: Color(0xff81b9da),
          ),
        ),
        textColor: Color(0xff81b9da),
        child: Text(
          "OPTIONS",
          style: TextStyle(
            fontFamily: 'Rowdies',
            fontSize: 40,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
