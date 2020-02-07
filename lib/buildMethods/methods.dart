import 'package:flutter/material.dart';
import 'package:trak/buildMethods/3DBlockBuilder.dart';
import 'package:trak/classes/cryto.dart';
import 'size_config.dart';
import 'package:http/http.dart';
import '../data/constants.dart';
import 'dart:convert';
import 'package:day/day.dart';
import '../classes/Price.dart';
import 'package:crypto/crypto.dart';

getDataUpdate(String selectedCurrency) async{
  Response response = await get('https://api.nomics.com/v1/currencies/ticker?key=$apiKey&ids=$keyIds&interval=1h,1d,30d&convert=$selectedCurrency');

  data = jsonDecode(response.body);

  for (int i = 0; i < ids.length; i += 1){


    Crypto holder = new Crypto(id: ids[i]);
    holder.getInfo(i);

    currencies[i]= holder;
    //print(holder.name +  holder.price + holder.convert);


  }




  }






buildPriceChange({String price, String duration}){
  Icon arrow;
  if( price.contains('-') == true){
    arrow = Icon(Icons.arrow_drop_down, color: Colors.redAccent,
      size: verticalPixel * 2.5,);
    price = '-' + '\$' + price.substring(1,price.length);
  }

  else{
    arrow = Icon(Icons.arrow_drop_up, color: Colors.greenAccent,
      size: verticalPixel * 2.5,);
    price = '\$' +  price;
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




      Text( price,
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


getSparkLineData(id, currentTime) async{
  List priceInt = [];
  List<Price> dataTable = [];
  Response responseSparkLine = await get('https://api.nomics.com/v1/currencies/sparkline?key=$apiKey&ids=$id&start=2017-01-01T00:00:00Z&end=$currentTime''T00:00:00Z');
  sparkLineData = jsonDecode(responseSparkLine.body) ;
  timestamps = jsonDecode(responseSparkLine.body)[0]['timestamps'] as List;
  prices = await jsonDecode(responseSparkLine.body)[0]['prices'] as List;
  List<String> pricesString = prices.cast<String>().toList();
  for(int i = 0; i < pricesString.length; i ++ ){
    priceInt.add(null);

    priceInt[i] = double.parse(pricesString[i]);
  }



  if (priceInt.reduce((a,b) => a+b/timestamps.length) > 1000){
    print('The avg price of $id is bigger than 1k');
    for(int i = 0; i < timestamps.length; i ++ ){
      double newPrice = priceInt[i]/1000;
      priceInt[i] = newPrice;

    }
    //print(priceInt);

  }

  //print(newPriceInt);



  for(int i = 0; i < timestamps.length; i ++ ){
    dataTable.add(null);


    dataTable[i] = Price(Day.fromString(sparkLineData[0]['timestamps'][i]).format('MMM DD YYY'),  priceInt[i]);
  }

  return dataTable;
}
List wholeDataTable = [];
buildDataTables() async{
  for (int i = 0; i < ids.length; i ++){
    wholeDataTable.add(null);
    wholeDataTable[i] = await getSparkLineData(ids[i], currentTime);


  }
}



void checkLabelFormat(String id){
  labelFormat = labelMap[id];
}


