import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/constants.dart';
import '../buildMethods/size_config.dart';
import 'package:trak/buildMethods/circleBuilder.dart';
import '../buildMethods/methods.dart';



class Crypto {
  bool switchValue = true;
  String rank;
  String name;
  String id;
  String icon;
  var price;
  var priceChange;
  var priceChange1d;
  var changePercentage;
  String convert;
  Crypto({this.id, this.convert = 'USD'});


  void getInfo(num){
    getPrice(num);
    getPriceChange(num);
    getPriceChange1d(num);
    getName(num);
    getIcon(num);
    getId(num);
    getRank(num);
  }
  void getRank(num){
    rank = data[num]['rank'];
  }

  String showRank(){
    return rank;
  }

  String toString(){
    return id;
  }
  String idToName(){
    return name;
  }

  void getId(num){
    id = data[num]['id'];
  }
  void getPrice(num){
    price = data[num]['price'];
    price = double.parse(price).toStringAsFixed(5);



  }

  void getName(num){
    name = data[num]['name'];
  }

  void getPriceChange(num){
    priceChange = data[num]['1h']['price_change'];
    priceChange = double.parse(priceChange).toStringAsFixed(5);
  }
  void getPriceChange1d(num){
    priceChange1d = data[num]['1d']['price_change'];
    priceChange1d = double.parse(priceChange1d).toStringAsFixed(5);
  }



  void getIcon(num){
    icon = data[num]['logo_url'];
  }

  Widget buildCard() {
    return AspectRatio(

      aspectRatio: .7,
      //padding: EdgeInsets.symmetric(vertical: ),
      //margin: EdgeInsets.symmetric(vertical: ),

      child: Card(
        //color: cardColor[onOff[cardNumber]].to,
        color: Colors.white.withOpacity(0),

        margin: EdgeInsets.symmetric(horizontal: horizontalPixel * 1.5),
        //color: Colors.lightBlueAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPixel * 2, horizontal: horizontalPixel * 2),
          child: Column(
            children: <Widget>[

//              CircleAvatar(
//                radius: verticalPixel * 2.5,
//                child: icon,
//              ),
              CircleImage(avt: icon, radius: verticalPixel*5).buildAvt(),

              SizedBox(height: verticalPixel * 1, width: horizontalPixel * 15,),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: verticalPixel * 2.3,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lobster',
                  letterSpacing: 1,
                  color: Color(0xff2A2B3C)
                  //color: Colors.white,
                ),
              ),
              SizedBox(height: verticalPixel * 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: <Widget>[
                  Text(id,


                    style: TextStyle(
                      fontSize: verticalPixel * 1.5,
                      //color: Colors.white,
                    ),
                  ),

                  Text('\$' + price.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: verticalPixel * 1.5,
                      //color: Colors.white,
                    ),)
                ],
              ),
              SizedBox(height: verticalPixel * 1,),


              buildPriceChange(price: priceChange, duration: '1h'),
              buildPriceChange(price: priceChange1d, duration: '1d'),

            ],
          ),
        ),
      ),
    );
  }




}










