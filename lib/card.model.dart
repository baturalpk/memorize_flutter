class EmojiCard {
  late final int _id;
  late final String _content;
  late bool _isFaceUp;
  late bool _isMatched;

  EmojiCard({required int id, required String content}) {
    this._id = id;
    this._content = content;
    this._isFaceUp = false;
    this._isMatched = false;
  }

  // Getters
  int get id => this._id;
  String get content => this._content;
  bool get isFaceUp => this._isFaceUp;
  bool get isMatched => this._isMatched;

  // Setters
  set setFaceUp(bool predicate) => this._isFaceUp = predicate;
  set setMatched(bool predicate) => this._isMatched = predicate;
}
