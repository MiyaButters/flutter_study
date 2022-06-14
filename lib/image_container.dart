import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({Key? key}) : super(key: key);
  @override
  State<ImageContainer> createState() => _ImagaContainerPageState();
}

class _ImagaContainerPageState extends State<ImageContainer> {

  final List<String> images  = [
    'images/64270636.png', 'images/64270636.png',
    'images/64270636.png', 'images/64270636.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Icon(Icons.create),
          ]),
        ),
        drawer: Drawer(child: const Center(child: Text("Drawer"))),
        body: Center(
            child: _buildImageContainer(images)

        )
    );
  }

  Widget _buildImageContainer(List<String> images){   //fold 要素を単一の値に圧縮する。
    final slicedImages = images.fold<List<List<String>>>([], (list, image) {
      if(list.length == 0 || list.last.length >= 2) {
        list.add(<String>[]);
      }
      list.last.add(image);
      return list;
    });
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children:slicedImages.map((rowImages) => Row(
            children: rowImages.map((image) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.black38),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              margin: EdgeInsets.all(4),
              child: Image.asset(image, fit: BoxFit.cover),
            )).toList()
        )).toList(),
      ),
    );
  }

}

