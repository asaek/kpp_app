import 'dart:convert';

class TweetKyaryObjeto {
  TweetKyaryObjeto({
    required this.tweetId,
    this.imagenesTweet,
    required this.textoTweet,
    this.imagenesId,
    this.fechaTweet,
  });

  String tweetId;
  List<String>? imagenesTweet;
  String textoTweet;
  String? imagenesId;
  String? fechaTweet;

  factory TweetKyaryObjeto.fromJson(String str) =>
      TweetKyaryObjeto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TweetKyaryObjeto.fromMap(Map<String, dynamic> json) =>
      TweetKyaryObjeto(
        tweetId: json["tweet_id"],
        imagenesTweet: List<String>.from(json["imagenes_tweet"].map((x) => x)),
        textoTweet: json["texto_tweet"],
        imagenesId: json["imagenes_id"],
        fechaTweet: json["fecha_tweet"],
      );

  Map<String, dynamic> toMap() => {
        "tweet_id": tweetId,
        "imagenes_tweet": List<dynamic>.from(imagenesTweet!.map((x) => x)),
        "texto_tweet": textoTweet,
        "imagenes_id": imagenesId,
        "fecha_tweet": fechaTweet,
      };
}
