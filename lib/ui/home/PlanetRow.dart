import 'package:flutter/material.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/ui/detail/DetailPage.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;
  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = TextStyle(fontFamily: 'Poppins');

    final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );

    final regularTextStyle = baseTextStyle.copyWith(
      color: Color(0xFFB6B2DF),
      fontSize: 9.0,
      fontWeight: FontWeight.w400,
    );

    final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0,
    );

    // final planetThumbnail = Container(
    //   margin: EdgeInsets.symmetric(
    //     vertical: 16.0,
    //   ),
    //   alignment: FractionalOffset.centerLeft,
    //   child: Image(
    //     image: AssetImage(planet.image),
    //     height: 92.0,
    //     width: 92.0,
    //   ),
    // );

    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0,),
      alignment: FractionalOffset.centerLeft,
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
      return Row(
        children: <Widget>[
          Image.asset(
            image,
            height: 12.0,
          ),
          Container(
            width: 8.0,
          ),
          Text(value, style: regularTextStyle),
        ],
      );
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 4.0,
          ),
          Text(planet.name, style: headerTextStyle),
          Container(
            height: 10.0,
          ),
          Text(planet.location, style: subHeaderTextStyle),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: Color(0xff00c6ff),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: _planetValue(
                    value: planet.distance,
                    image: 'assets/img/ic_distance.png'),
              ),
              Expanded(
                child: _planetValue(
                  value: planet.gravity,
                  image: 'assets/img/ic_gravity.png',
                ),
              )
              // Image.asset('assets/img/ic_distance.png', height: 12.0,),
              // Container(width: 8.0,),
              // Text(planet.distance, style: regularTextStyle),

              // Container(width: 24.0),

              // Image.asset('assets/img/ic_gravity.png', height: 12.0,),
              // Container(width: 8.0,),
              // Text(planet.gravity, style: regularTextStyle),
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
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

    // the same
    // margin: EdgeInsets.only(
    //   top: 16.0,
    //   right: 24.0,
    //   bottom: 16.0,
    //   left: 24.0,
    // ),
    // return Container(
    //   height: 120.0,
    //   margin: EdgeInsets.symmetric(
    //     horizontal: 24.0,
    //     vertical: 16.0,
    //   ),
    //   child: Stack(
    //     children: <Widget>[
    //       planetCard,
    //       planetThumbnail,
    //     ],
    //   ),
    // );

    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, '/detail'),
      onTap: () => Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (_, __, ___) => DetailPage(this.planet),
      )),
      child: Container(
        height: 120.0,
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
