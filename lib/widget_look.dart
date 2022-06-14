


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetLookTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Pavlova Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: Pavlova(),
  );
}

class Pavlova extends StatelessWidget {

  final List<String> images = [
    'images/9741eea6.jpg', 'images/64270636.png',
    'images/64270636.png', 'images/IMG_20180211_225024.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: _buildGrid(images)
        //child: _buildGridCount()
        child: _expanded()
      ),
    );
  }

  //グリッド　横列に並べるitemサイズで制御
  Widget _buildGrid(List<String> images) => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: images.map((image) => Container(
        child: Image.asset(image),
    )).toList()
  );

  //GridView.count 横列に並べるitem個数で制御
  final _viewData = <Widget>[
    Container(
      color: Colors.red,
      child:
      const Text(
        "1",
        style: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.blue,
      child:
      const Text(
        "2",
        style: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
      ),
    ),
    Container(
      color: Colors.green,
      child:
      const Text(
        "3",
        style: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.w400, fontFamily: "Roboto"),
      ),
    ),
  ];
  Widget _buildGridCount() => GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      padding: EdgeInsets.all(10),
      children: _viewData,
  );
  //ListView
  //Flutterではウィジェットの中身は基本的にスクロールできない
  Widget _buildList() => ListView(
    children: <Widget>[
      _tile('映画館１', '映画館です', Icons.theaters),
      _tile('映画館２', '映画館です', Icons.theaters),
      _tile('映画館３', '映画館です', Icons.theaters),
      Divider(),
      _tile('レストラン1', 'レストランです', Icons.restaurant),
      _tile('レストラン2', 'レストランです', Icons.restaurant),
      _tile('レストラン3', 'レストランです', Icons.restaurant),
    ],
  );
  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title, style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );

  //Expanded:RowやColumnの子Widget間の隙間を目一杯埋めたいときに使います
  Widget _expanded() => Center(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                height: 100,
                color: Colors.blue,
                child: Text("fix")
            ),
            Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Text("expanded"),
                ))
          ],
        ),
        Expanded(
            child: Container(
                color: Colors.grey
            )
        )
      ],
    ),
  );

}

