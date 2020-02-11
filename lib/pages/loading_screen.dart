import 'dart:convert';
import '../buildMethods/methods.dart';

import 'package:trak/pages/price_screen.dart';
import '../data/constants.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../classes/cryto.dart';
import 'package:trak/buildMethods/3DBlockBuilder.dart';


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {












  void getData() async{

    Response response = await get('https://api.nomics.com/v1/currencies/ticker?key=$apiKey&ids=$keyIds&interval=1h,1d,30d');
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    }
    else{
      print(response.statusCode);
    }

    //print(data);
    for(String id in fullList){
      Crypto currency = new Crypto(id : id);
      int num = fullList.indexOf(id);


      currency.getInfo(num);
      currencies.add(currency);


    }


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PriceScreen(data: data)));

  }










  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildDataTables();
    getData();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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