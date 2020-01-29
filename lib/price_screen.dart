
import 'package:flutter/cupertino.dart';
import 'package:trak/3DBlockBuilder.dart';
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



  }


//void createPriceTable(){
//    for(int i = 0; i < timestamps.length; i ++ ){
//      dataTable.add(null);
//      dataTable[i] = Price(Day.fromString(sparkLineData[0]['timestamps'][i]).format('MMMM DD'), double.parse(prices[i]));
//    }
//  } //Create price table for plotting//

  reloadGraph() async{
    int i = onoff.indexOf(0);
    String id = currencies[i].toString();
    await getSparkLineData(id);
    //createPriceTable();
    //print(dataTable);



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

            child: Center(
              child: SfCartesianChart(

                margin: EdgeInsets.only(top: 20),



                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[

                  AreaSeries<Price, String>(

                    gradient: LinearGradient(colors: colors, stops: stops),

                    dataSource: wholeDataTable[onoff.indexOf(0)],//[Price('Mon', 1), Price( 'Sun' , 1)], // <- Data for the graph goes here as a list of Price points.


                    xValueMapper: (Price price, _) => price.timestamps,
                    yValueMapper: (Price price, _) => price.prices,

                  )
                ]
              ),
            ),

          ), // The Graph
          Container(
            height: verticalPixel*5,
            child: SvgPicture.network('https://www.svgrepo.com/show/124304/three-dots.svg'),
          ),// three dots in the middle

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
          ), // Info cards
          Container(
            height: verticalPixel * 10,
            width: double.infinity,
            color: Colors.black,

          ),// Divider
          Container(
            height: 2000,
            color: Colors.blueAccent,
             child: null,
             //Text(sparkLineData[0]['timestamps'][0] + sparkLineData[0]['prices'][0]),
          ) // Test Area
          // CRYPTO TYPE
        ],
      ),

    );
  }
}