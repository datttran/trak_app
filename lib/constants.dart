import 'cryto.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:trak/Price.dart';



final apiKey = '62318fc11614e681fbfcc5f8d474d56e';
var data;
var sparkLineData;
List timestamps = [];
List prices = [];
List<Price> dataTable = [];
String keyIds = 'BTC,ETH,XMR,USDT,EOS,LTC,DASH';
List<String> ids = ['BTC', 'ETH','XMR','USDT','EOS','LTC','DASH' ];
List<Crypto> currencies = [];
List cards = [];
final loadingAnimation = SpinKitFadingCube(
  color: Colors.greenAccent,
);
// TEST KEY
Crypto btc = new Crypto(id : 'BTC');
Crypto eth = new Crypto(id : 'ETH');
List<Crypto> test  = [btc, eth];
//String price = data[0]['price'];


List<bool>  isSelected = [true, false, false,false, false,false, false,false]; // this always need to be equal to the number of cards


List onoff = [0,1,1,1,1,1,1,1,1];
List color= [ Colors.redAccent, Colors.grey[400]];




final List<Color> colors = <Color>[Color(0xff2A2B3C).withOpacity(.8), Color(0xff2A2B3C) , Color(0xff040405)];

final List<double> stops = <double>[0 , 0.5, 1];

