import '../classes/cryto.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:day/day.dart';

final currentTime = Day().toIso8601String().substring(0,10);
final apiKey = '62318fc11614e681fbfcc5f8d474d56e';
var data;
var sparkLineData;
List timestamps = [];
List prices = [];

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

var showing = onoff.indexOf(0);
var showingID = currencies[showing].idToName();
var showingRank = currencies[showing].showRank();
List onoff = [0,1,1,1,1,1,1,1,1];
List color= [ Colors.redAccent, Colors.grey[400]];
List<DropdownMenuItem> convert = [
  DropdownMenuItem(
  child: Text('USD'),
  value: 'USD',
),
  DropdownMenuItem(
    child: Text('EUR'),
    value: 'EUR',
  ),];
List<String> currencyOptions = ['USD', 'EUR', "GBP"];
String selectedCurrency = 'USD';

final List<Color> colors = <Color>[Color(0xff2A2B3C), Color(0xff16171E) , Color(0xff040405)];

final List<double> stops = <double>[0 , 0.5, 1];



ZoomPanBehavior zoomingBehavior = ZoomPanBehavior(
enablePinching: true, zoomMode: ZoomMode.x, enablePanning: true);
String labelFormat = labelMap[ids[0]] ;

Map labelMap = {'BTC' : '\${value}K' , 'ETH': '\${value}','XMR': '\${value}','USDT': '\${value}','EOS': '\${value}','LTC': '\${value}','DASH' : '\${value}'};


