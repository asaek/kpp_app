abstract class BaseMapper<i> {
  fromMap(Map<String, dynamic> json) {
    return i;
  }

  fromMapAll(Map<String, dynamic> json) {
    return List<i>;
  }
}
