import 'package:flutter/cupertino.dart';

//Sliverでいい気がする？
class ChildScrollViewWidget extends StatelessWidget {
  const ChildScrollViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        children: [
          const Text('Hoge'),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 100,
            itemBuilder: (_, index) => Text(
              '$index',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}


