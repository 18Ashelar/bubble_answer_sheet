class Answer {
  String _ans;
  Answer(this._ans);

  String get ans => _ans;

  set ans(String value) {
    _ans = value;
  }

  @override
  String toString() {
    return 'Answer{ans: $_ans}';
  }
}
