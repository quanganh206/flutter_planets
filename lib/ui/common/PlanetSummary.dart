import 'package:flutter/material.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/ui/detail/DetailPage.dart';
import 'package:planets/ui/common/TextStyle.dart';
import 'package:planets/ui/common/Separator.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;
  PlanetSummary(this.planet, {this.horizontal = true});
  PlanetSummary.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: 'planet-hero-${planet.id}',
        child: Image(
          image: AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      return Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              image,
              height: 12.0,
            ),
            Container(
              width: 8.0,
            ),
            Text(value, style: Style.smallTextStyle),
          ],
        ),
      );
    }

    ;

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 72.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 4.0,
          ),
          Text(planet.name, style: Style.titleTextStyle),
          Container(
            height: 10.0,
          ),
          Text(planet.location, style: Style.commonTextStyle),
          Separator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: planet.distance,
                  image: 'assets/img/ic_distance.png',
                ),
              ),
              Container(
                width: 32.0,
              ),
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: planet.gravity,
                  image: 'assets/img/ic_gravity.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xFF333666),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: horizontal ? () => Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (_, __, ___) => DetailPage(planet),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
      )): null,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
