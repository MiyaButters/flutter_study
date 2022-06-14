import 'package:flutter/material.dart';
import 'dart:math';

class swapTestPage extends StatefulWidget {
  const swapTestPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<swapTestPage> createState() => _SwapTestPageState();
}

class _SwapTestPageState extends State<swapTestPage> {
  late List<Widget> _tiles;
  @override
  void initState() {
    super.initState();
    _tiles = [
      // StatelessColorfulTile(),
      // StatelessColorfulTile(),
      //statefulカラーボックスの場合 keyが無いとwidget、Element間でstate保持が反映されずボタンを押しても変わらない
      StatefulColorfulTile(key: UniqueKey()), // 変更！！
      StatefulColorfulTile(key: UniqueKey()), // 変更！！
    ];
  }

  void _swapTiles() {
    setState(() {
      _tiles.insert(1, _tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: _tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_satisfied), onPressed: _swapTiles),
    );
  }
}
//statelessカラーボックスの場合
// class StatelessColorfulTile extends StatelessWidget {
//   final Color _color = UniqueColorGenerator.getColor();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: _color, child: Padding(padding: EdgeInsets.all(100.0)));
//   }
//}
//statefullカラーボックスの場合
class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({required Key key}) : super(key: key);

  @override
  ColorfulTileState createState() => ColorfulTileState();
}
class ColorfulTileState extends State<StatefulColorfulTile> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _color = UniqueColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: _color,
        child: Padding(
          padding: EdgeInsets.all(100.0),
        ));
  }
}

class UniqueColorGenerator {
  static List _colorOptions = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.indigo,
    Colors.amber,
    Colors.black,
  ];
  static Random _random = new Random();
  static Color getColor() {
    if (_colorOptions.length > 0)
      return _colorOptions.removeAt(_random.nextInt(_colorOptions.length));
    else
      return Color.fromARGB(_random.nextInt(256), _random.nextInt(256),
          _random.nextInt(256), _random.nextInt(256));
  }
}

