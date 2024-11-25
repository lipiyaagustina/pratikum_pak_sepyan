class Siswa {
  final String name;
  final String muridId;
  bool _isPresent = false;

  Siswa({
    required this.name,
    required this.muridId,
  });

  bool get isPresent => _isPresent;

  void togglePresence() {
    _isPresent = !_isPresent;
  }

  void reset() {
    _isPresent = false;
  }
}