import 'package:flutter/material.dart';
import 'package:trak/3DBlockBuilder.dart';
import 'size_config.dart';

buildPriceChange({String price, String duration}){
  Icon arrow;
  if( price.contains('-') == true){
    arrow = Icon(Icons.arrow_drop_down, color: Colors.redAccent,
      size: verticalPixel * 2.5,);
  }

  else{
    arrow = Icon(Icons.arrow_drop_up, color: Colors.greenAccent,
      size: verticalPixel * 2.5,);
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,


    children: <Widget>[
      Row(
        children: <Widget>[
          Text( duration , style: TextStyle( fontSize: verticalPixel*1),),
          arrow,
        ],
      ),




      Text(price,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: verticalPixel * 1.5,
          //color: Colors.white,
        ),)
    ],
  );



}


buildEmptyCard(){
  return buildContainer(child: Icon(Icons.add, size: verticalPixel*4,), colors: Colors.redAccent);



}


