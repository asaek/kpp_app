import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:kyari_app/ui/common/tokens/tiuupografia.dart';

class OurText extends StatelessWidget {
  final String text;
  final Color colorText;
  final double? fontSize;
  final TextAlign? textAlign;
  const OurText({
    Key? key,
    required this.text,
    required this.colorText,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: colorText, fontSize: fontSize),
      textAlign: TextAlign.center,
      maxLines: 4,
    );
  }
}

class H1 extends StatelessWidget {
  final String text;
  const H1({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      colorText: Colors.blueAccent,
      key: Key('${key}h1'),
    );
  }
}

class H2 extends StatelessWidget {
  final String text;
  const H2({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OurText(text: text, colorText: Colors.black, fontSize: H2_SIZE);
  }
}

class TextNoticia extends StatelessWidget {
  final Color colorText;
  final String text;
  const TextNoticia({
    Key? key,
    required this.text,
    required this.colorText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 4,
      style: TextStyle(
        color: colorText,
        fontSize: 15,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextNoticiaTraducidad extends StatelessWidget {
  final String text;
  final Color colorText;

  const TextNoticiaTraducidad(
      {Key? key, required this.text, required this.colorText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 4,
      style: TextStyle(
        color: colorText,
        fontSize: 15,
        overflow: TextOverflow.ellipsis,
      ),
    ).translate();
  }
}
