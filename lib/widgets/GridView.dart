
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewEx extends StatelessWidget {
  const GridViewEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(color: Colors.red, width: 3, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.count(
          crossAxisCount: 3,
          primary: false,
          mainAxisSpacing: 10,
          crossAxisSpacing: 15,
          shrinkWrap: true,
          children: [
            buildContainer('Hello', Colors.green[100]!),
            buildContainer('Ahmed', Colors.green[200]!),
            buildContainer('Azhar', Colors.green[300]!),
            buildContainer('Bilal', Colors.green[400]!),
            buildContainer('Amin', Colors.green[500]!),
            buildContainer('Mirza', Colors.green[600]!),

          ],
      ),
    );

  }

  Container buildContainer(String text, Color color) {
    return Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          padding: const EdgeInsets.all(10),
          child: Text(text),

        );
  }
}

class GridViewList extends StatelessWidget {
  const GridViewList({Key? key}) : super(key: key);
  static final List<String> _list = [
    'Ahmed','Hello','Bilal','Mirza','Ali','Husnain','abs','saaa','sfs'
  ];
  @override
  Widget build(BuildContext context) {
     return Container(
      height: 270,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(color: Colors.red, width: 3, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 200,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(_list[index], style: const TextStyle(color: Colors.red, fontSize: 18), textAlign: TextAlign.center),
            );
          }
      ),
    );
  }
}

class StaggeredGVEx extends StatelessWidget {
  const StaggeredGVEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          border: Border.all(color: Colors.red, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          // controller: ScrollController(),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              buildCustomChild(2,2,'Hi!'),
              buildCustomChild(2,1,'Bilal'),
              buildCustomChild(2,3,'Mr Bilal'),
              buildCustomChild(2,2,'Hello'),
              buildCustomChild(4,2,'Ali Jutt'),
              buildCustomChild(3,2,'Ahmed Raza'),
              buildCustomChild(2,3,'Mr Bilal'),
              buildCustomChild(2,2,'Hello'),
              buildCustomChild(4,2,'Ali Jutt'),
              buildCustomChild(3,2,'Ahmed Raza'),
              buildCustomChild(2,3,'Mr Bilal'),
              buildCustomChild(2,2,'Hello'),
              buildCustomChild(4,2,'Ali Jutt'),
            ],

          ),
        ),
    );
  }

  StaggeredGridTile buildCustomChild(int cross, int main, String text) {
    return StaggeredGridTile.count(
          crossAxisCellCount: cross,
          mainAxisCellCount: main,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.deepOrange, width: 5),
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: Text(text),
          ),
        );
  }

}


