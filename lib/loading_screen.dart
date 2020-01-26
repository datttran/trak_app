import 'dart:convert';

import 'package:trak/3DBlockBuilder.dart';
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
    print(currencies.length);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PriceScreen(data: data)));

  }








  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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