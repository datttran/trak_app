import 'package:flutter/material.dart';
import 'size_config.dart';
Widget buildContainer({child , Color colors}) {



  return Stack(
    overflow: Overflow.visible,
    alignment: AlignmentDirectional.topCenter,

    children: <Widget>[

      Container(
        height: verticalPixel*24,
        width: verticalPixel*19 ,
        margin: EdgeInsets.symmetric(horizontal: verticalPixel*1),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400].withOpacity(1),
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(0,0),
              ),


              BoxShadow(
                color: Colors.white70,
                blurRadius: 5,
                spreadRadius: 4,
                offset: Offset(-1,-1),


              )],

            //border: Border.all(color: Colors.white, width: 1),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[300], Colors.white],
                stops: [0,1]),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: child,




      ),
      Positioned(
        top: -5,
        child: Container(
          height: verticalPixel*2,
          width: verticalPixel*5,

          decoration: BoxDecoration(
              color: colors,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [ colors, colors.withOpacity(.9)],
                  stops: [.5,1]),

              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))
            )
          ),


        ),
      ],);


}
