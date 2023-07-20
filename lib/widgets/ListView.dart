
import 'package:flutter/material.dart';

class ListViewEx extends StatelessWidget {
  const ListViewEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 50,
                alignment: Alignment.center,
                color: index.isEven ? Colors.amber[200]: Colors.amber[600],
                child: Text('This is $index', style: const TextStyle(fontSize: 20),),
            );

        }, separatorBuilder: (BuildContext context, int index) => const Divider(),


      ),
    );
  }
}
