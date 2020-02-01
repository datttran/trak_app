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
import 'package:day/day.dart';



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


          ],
        ),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: verticalPixel*2),
            child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.topCenter,

              children: <Widget>[

                Container(

                  //height: verticalPixel*25,
                  //width: verticalPixel*19 ,
                  margin: EdgeInsets.symmetric(horizontal: verticalPixel*1),

                  decoration: BoxDecoration(

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400].withOpacity(1),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(0,0),
                        ),


                        BoxShadow(
                          color: Colors.white70,
                          blurRadius: 5,
                          spreadRadius: 4,
                          offset: Offset(-1,-1),


                        )],

                      //border: Border.all(color: Colors.white, width: 1),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [Colors.grey[300], Colors.white],
                          stops: [.7,1]),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    padding: EdgeInsets.all(verticalPixel*1.5),

                    child: Center(
                      child: SfCartesianChart(
                          zoomPanBehavior: zoomingBehavior,




                          margin: EdgeInsets.only(top: 20),



                          primaryXAxis: CategoryAxis(
                              interactiveTooltip: InteractiveTooltip(
                                enable: true,
                              )
                          ),
                          primaryYAxis: NumericAxis(

                            labelFormat: labelFormat,
                          ),
                          crosshairBehavior: CrosshairBehavior(
                            enable: true,
                            //hideDelay: 1000,

                            activationMode: ActivationMode.singleTap,
                            shouldAlwaysShow: true,
                          ),
                          series: <ChartSeries>[

                            AreaSeries<Price, String>(


                              gradient: LinearGradient(colors: colors, stops: stops),

                              dataSource: wholeDataTable[onoff.indexOf(0)],// <- Data for the graph goes here as a list of Price points. //


                              xValueMapper: (Price price, _) => price.timestamps,
                              yValueMapper: (Price price, _) => price.prices,

                            )
                          ]
                      ),
                    ),
                  ),




                ),

              ],),
          ),

           // The Graph
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
                      }
                      else{
                        onoff[i] = 0;
                      }
                    });
                    checkLabelFormat(ids[i]);
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
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.call_to_action, size: 30,),
              onPressed: (){
                print(1);

              },
            ),

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