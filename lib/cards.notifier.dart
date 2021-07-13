import 'package:flutter/foundation.dart';
import 'package:memorize_flutter/card.model.dart';

class MyCards with ChangeNotifier {
  //** Constants
  static const _emojiDB = ["🍕", "🍗", "🍭", "🍉", "🍇", "🍫", "🥦", "🍋"];

  //** Fields
  int _score = 0;
  int _indexOfTheOneAndOnlyFaceUpCard = -1;
  List<EmojiCard> _cards = [];
  bool _isGameEnded = false;

  //** Constructor
  MyCards() {
    _createTheGame();
  }

  //** Private Methods
  void _createTheGame() {
    MyCards._emojiDB.asMap().forEach((i, emoji) => {
          _cards.add(new EmojiCard(id: i * 2, content: emoji)),
          _cards.add(new EmojiCard(id: i * 2 + 1, content: emoji)),
        });
    this._cards..shuffle();
  }

  // Getters
  int get score => _score;
  List<EmojiCard> get cards => _cards;
  bool get isGameEnded => _isGameEnded;

  //** Public Actions
  // Awake onTap to choose a card.
  void choose({required EmojiCard? card}) {
    // TODO: Subtract 1 point as a mismatch penalty.
    final chosenIndex = (_indexOfTheOneAndOnlyFaceUpCard == -1)
        ? _cards.indexOf(card!)
        : _cards.lastIndexOf(card!);

    if (!(_cards[chosenIndex].isFaceUp || _cards[chosenIndex].isMatched)) {
      final potentialMatchIndex = _indexOfTheOneAndOnlyFaceUpCard;

      if (!(potentialMatchIndex == -1)) {
        if (_cards[chosenIndex].content ==
            _cards[potentialMatchIndex].content) {
          _cards[chosenIndex].setMatched = true;
          _cards[potentialMatchIndex].setMatched = true;
          _score += 2;
        }
        _indexOfTheOneAndOnlyFaceUpCard = -1;
      } else {
        _cards.forEach((card) => card.setFaceUp = false);
        _indexOfTheOneAndOnlyFaceUpCard = chosenIndex;
      }
      _cards[chosenIndex].setFaceUp = true;
    }

    this._isGameEnded = true;
    for (var card in this._cards) {
      if (!card.isMatched) {
        this._isGameEnded = false;
        break;
      }
    }

    //**! DEBUG :::::>
    print(card.id.toString() +
        " " +
        card.content +
        " isFaceUp:" +
        card.isFaceUp.toString() +
        " isMatched:" +
        card.isMatched.toString() +
        " " +
        " chosen!");

    // Notify all consumers.
    notifyListeners();
  }

  // Awake onTap to restart the game.
  void restart() {
    this._score = 0;
    this._indexOfTheOneAndOnlyFaceUpCard = -1;
    this._cards = [];
    this._isGameEnded = false;

    this._createTheGame();
    notifyListeners();
  }
}
