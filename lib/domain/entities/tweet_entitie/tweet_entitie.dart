class TweetKyaryEntitie {
  TweetKyaryEntitie({
    required this.tweetId,
    this.imagenesTweet,
    required this.textoTweet,
    this.imagenesId,
    this.fechaTweet,
    this.tweetURL,
  });

  String tweetId;
  List<String>? imagenesTweet;
  String textoTweet;
  List<String>? imagenesId;
  String? fechaTweet;
  String? tweetURL;
}
