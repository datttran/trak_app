import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CircleImage{
  String avt;
  double radius;

  CircleImage({this.avt, this.radius });

  buildAvt(){
    return Stack(
      children: <Widget>[
        Container(
            height: radius,
            width: radius,

            decoration: BoxDecoration(
              //color: Colors.red,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(

                      offset: const Offset(2, 2),
                      color: Colors.grey[400],
                      spreadRadius: 6,
                      blurRadius: 10
                  ),
                  BoxShadow(

                      offset: const Offset(-2, -2),
                      color: Colors.white70,
                      spreadRadius: 2,
                      blurRadius: 5
                  )
                ]

            )
        ),
        
        Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

          ),
          child: SvgPicture.network(avt),

        ),
        Container(
            height: radius,
            width: radius,

            decoration: BoxDecoration(
              //color: Colors.red,
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(.2), Colors.white.withOpacity(.1)],
                  stops: [.1,.9]),

            )
        ),



      ],
    );




  }

}