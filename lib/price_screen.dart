
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:trak/3DBlockBuilder.dart';
import 'package:trak/cryto.dart';
import 'package:trak/methods.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trak/Price.dart';
import 'size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import 'dart:async';
import 'package:gradient_app_bar/gradient_app_bar.dart';



class PriceScreen extends StatefulWidget {

  final data;


  PriceScreen({this.data});



  @override
  _PriceScreenState createState() => _PriceScreenState();
}


class _PriceScreenState extends State<PriceScreen> {

  Timer timer;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();



    //TODO: make auto create card for display








  }






  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: GradientAppBar(

        elevation: 0,
        backgroundColorStart: Color(0xff2A2B3C),
        backgroundColorEnd: Color(0xff040405),
        //leading: Icon(Icons.donut_small),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'T R A K ',
              style: TextStyle(
                  color: Color(0xffbac4d2),

                  fontSize: verticalPixel*4,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(-verticalPixel*.1, -verticalPixel*.1),
                      blurRadius: 10.0,
                      color: Color(0x804d4d4d),
                    ),
                    Shadow(
                      offset: Offset(verticalPixel*.3, verticalPixel*.3),
                      blurRadius: 8,
                      color: Color(0x8027282a),
                    ),
                  ]
              ),
            ),

            //Icon(Icons.first_page , color: Colors.white, size: 50, ),
//            Text(
//
//              'The Crypto Tracker ',
//
//              style: TextStyle(
//
//
//                  fontSize: verticalPixel*2,
//                  fontFamily: 'Lobster',
//                  fontWeight: FontWeight.normal),
//              textAlign: TextAlign.end,
//
//            ),
          ],
        ),
      ),

      body: ListView(
        children: <Widget>[
          Container(

              height: verticalPixel * 50,
              width: double.infinity,
              //color: Color(0xff040405),
            child: SfCartesianChart(

              margin: EdgeInsets.all(30),



              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[

                AreaSeries<Price, String>(

                  gradient: LinearGradient(colors: colors, stops: stops),

                  dataSource: [
                    Price('Jan', 20),
                    Price('Feb',11),
                    Price('Mar', 12),
                    Price('Apr',9),
                    Price('May', 10)
                  ],


                  xValueMapper: (Price price, _) => price.time,
                  yValueMapper: (Price price, _) => price.price,

                )
              ]
            ),

          ),
          Container(
            height: verticalPixel*5,
            child: SvgPicture.network('https://www.svgrepo.com/show/124304/three-dots.svg'),
          ),// DATA GRAPH

          Container(
            //padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.symmetric(vertical: verticalPixel*3),
            height: verticalPixel * 25,
            constraints: BoxConstraints(
              minHeight: verticalPixel * 25,


              //minHeight: verticalPixel * 30
            ),

            //width: double.infinity,
            //color: Colors.grey,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                for(int i = 0; i <currencies.length ; i+= 1) GestureDetector(
                  onTap: (){
                    setState(() {
                      if(onoff[i] == 1){
                        int a = onoff[onoff.indexOf(0)];
                        onoff[onoff.indexOf(0)] = 1;
                        onoff[i] = a;
                        print(onoff);
                      }
                      else{
                        onoff[i] = 0;
                        print(onoff);
                      }
                    });
                  },
                    child: buildContainer(child: currencies[i].buildCard(), colors: color[onoff[i]])),
                buildEmptyCard(),

              ],

            ),
          ),
          Container(
            height: verticalPixel * 10,
            width: double.infinity,
            color: Colors.black,

          ),
          // CRYPTO TYPE
        ],
      ),

    );
  }
}