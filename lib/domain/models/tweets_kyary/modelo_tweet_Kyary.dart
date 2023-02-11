class TweetKyaryObjeto {
  TweetKyaryObjeto(
      {required this.tweetId,
      this.imagenesTweet,
      required this.textoTweet,
      this.imagenesId,
      this.fechaTweet,
      this.tweetURL});

  String tweetId;
  List<String>? imagenesTweet;
  String textoTweet;
  List<String>? imagenesId;
  String? fechaTweet;
  String? tweetURL;

  // factory TweetKyaryObjeto.fromJson(String str) =>
  //     TweetKyaryObjeto.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory TweetKyaryObjeto.fromMap(Map<String, dynamic> json) =>
  //     TweetKyaryObjeto(
  //       tweetId: json["tweet_id"],
  //       imagenesTweet: List<String>.from(json["imagenes_tweet"].map((x) => x)),
  //       textoTweet: json["texto_tweet"],
  //       imagenesId: List<String>.from(json["imagenes_id"].map((x) => x)),
  //       fechaTweet: json["fecha_tweet"],
  //     );

  // Map<String, dynamic> toMap() => {
  //       "tweet_id": tweetId,
  //       "imagenes_tweet": List<dynamic>.from(imagenesTweet!.map((x) => x)),
  //       "texto_tweet": textoTweet,
  //       "imagenes_id": List<dynamic>.from(imagenesTweet!.map((x) => x)),
  //       "fecha_tweet": fechaTweet,
  //     };
}
