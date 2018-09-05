import 'package:flutter/material.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/ui/common/PlanetSummary.dart';
import 'package:planets/ui/common/TextStyle.dart';
import 'package:planets/ui/common/Separator.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Planet Detail'),
  //     ),
  //     body: Container(
  //       constraints: BoxConstraints.expand(),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(planet.name),
  //           // Image.asset(
  //           //   planet.image,
  //           //   width: 96.0,
  //           //   height: 96.0,
  //           // ),
  //           Hero(
  //             tag: 'planet-hero-${planet.id}',
  //             child: Image.asset(
  //               planet.image,
  //               width: 96.0,
  //               height: 96.0,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return Container(
      child: Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0x00736AB7),
            Color(0xFF736AB7),
          ],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = 'Overview'.toLowerCase();

    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummary(
          planet,
          horizontal: false,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _overviewTitle,
                style: Style.titleTextStyle,
              ),
              Separator(),
              Text(
                planet.description,
                style: Style.commonTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: BackButton(
        color: Colors.white,
      ),
    );
  }
}
