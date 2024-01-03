abstract class BaseMapper<i> {
  noticiaMapper(Map<String, dynamic> json) {
    return i;
  }

  noticiasMapper(Map<String, dynamic> json) {
    return List<i>;
  }
}

abstract class TweetsKyaryBaseMapper<i> {
  fromMapAllTweetsKyary(Map<String, dynamic> json) {
    return List<i>;
  }
}
