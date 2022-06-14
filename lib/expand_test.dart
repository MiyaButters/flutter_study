

import 'package:flutter/material.dart';

class ExpandTest extends StatelessWidget {
  const ExpandTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpandTest',
        theme: ThemeData(primaryColor: Colors.purple),
        darkTheme: ThemeData(primaryColor: Colors.blueGrey),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("ホーム",style: TextStyle(color: Colors.white)),
        ),
      body: _mainArea(context),
    );

  }
  Widget _mainArea(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleArea(context),
              _buttonArea(context),
          ],
        ),
    );
  }

  Widget _titleArea(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16.0),
        child: Row(    // 1行目
          children: <Widget>[
            Expanded(  // 2.1列目
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(  // 3.1.1行目
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: const Text(
                      "Neko is So cute.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  Container(  // 3.1.2行目
                    child: const Text(
                      "Osaka, Japan",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(  // 2.2列目
              Icons.star,
              color: Colors.red,
            ),
            const Text('41'),  // 2.3列目
          ],
        )
    );
  }

  Widget _buttonArea(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Row( // 1行目
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn(Icons.call, "CALL",context), // 2.1
            _buildButtonColumn(Icons.near_me, "ROUTE",context), // 2.2
            _buildButtonColumn(Icons.share, "SHARE",context) // 2.3
          ],
        ));
  }

  Widget _buildButtonColumn(IconData icon, String label,BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color), // 3.1.1
        Container( // 3.1.2
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color),
          ),
        )
      ],
    );
  }

}