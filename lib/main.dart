import 'package:flutter/material.dart';
import 'package:memorize_flutter/cards.notifier.dart';
import 'package:memorize_flutter/gameGrid.view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyCards(),
      child: MaterialApp(
        title: 'Memorize',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: GameGrid(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
