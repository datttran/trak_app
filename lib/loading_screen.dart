import 'dart:convert';


import 'package:trak/price_screen.dart';
import 'constants.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'cryto.dart';



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {












  void getData() async{
    Response response = await get('https://api.nomics.com/v1/currencies/ticker?key=$apiKey&ids=$keyIds&interval=1h,1d,30d');

    data = jsonDecode(response.body);


    //print(data);
    for(String id in ids){
      Crypto currency = new Crypto(id : id);
      int num = ids.indexOf(id);


      currency.getInfo(num);
      currencies.add(currency);


//      var aa = buildContainer(currency.buildCard(num));
//      cards.add(aa);
    }


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PriceScreen(data: data)));

  }


  void getSparkLineData(id) async{
    Response responseSparkLine = await get('https://api.nomics.com/v1/currencies/sparkline?key=$apiKey&ids=$id&start=2019-01-01T00:00:00Z&end=2020-01-27T00:00:00Z');
    sparkLineData = jsonDecode(responseSparkLine.body) ;
    timestamps = jsonDecode(responseSparkLine.body)[0]['timestamps'] as List;
    prices = jsonDecode(responseSparkLine.body)[0]['prices'] as List;


  }








  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSparkLineData('BTC');
    getData();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[

            //Center(child: buildContainer(null)),
            Center(
                child: loadingAnimation
            ),
          ],
        )
    );
  }
}