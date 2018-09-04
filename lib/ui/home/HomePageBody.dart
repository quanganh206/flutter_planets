import 'package:flutter/material.dart';
import 'package:planets/ui/home/PlanetRow.dart';
import 'package:planets/model/planets.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // will reach bottom error
    // return Column(
    //   children: <Widget>[
    //     PlanetRow(planets[0]),
    //     PlanetRow(planets[1]),
    //     PlanetRow(planets[2]),
    //     PlanetRow(planets[3]),
    //   ],
    // );

    // working
    // return Expanded(
    //   child: ListView.builder(
    //     itemBuilder: (context, index) => PlanetRow(planets[index]),
    //     itemCount: planets.length,
    //     padding: EdgeInsets.symmetric(vertical: 16.0),
    //   ),
    // );

    return Expanded(
      child: Container(
        // color lavender
        color: Color(0xFF736AB7), 
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PlanetRow(planets[index]),
                  childCount: planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
