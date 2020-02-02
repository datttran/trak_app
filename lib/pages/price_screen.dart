import 'package:flutter/cupertino.dart';
import 'package:trak/buildMethods/3DBlockBuilder.dart';
import 'package:trak/buildMethods/methods.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trak/classes/Price.dart';
import '../buildMethods/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/constants.dart';
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









  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
//      appBar: GradientAppBar(
//
//        elevation: 0,
//        backgroundColorStart: Color(0xff2A2B3C),
//        backgroundColorEnd: Color(0xff040405),
//        //leading: Icon(Icons.donut_small),
//        title: Text(
//          'T R A K ',
//          style: TextStyle(
//              color: Color(0xffbac4d2),
//
//              fontSize: verticalPixel*4,
//              fontWeight: FontWeight.bold,
//              fontFamily: 'Roboto',
//              shadows: <Shadow>[
//                Shadow(
//                  offset: Offset(-verticalPixel*.1, -verticalPixel*.1),
//                  blurRadius: 10.0,
//                  color: Color(0x804d4d4d),
//                ),
//                Shadow(
//                  offset: Offset(verticalPixel*.3, verticalPixel*.3),
//                  blurRadius: 8,
//                  color: Color(0x8027282a),
//                ),
//              ]
//          ),
//        ),
//      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: verticalPixel*1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400].withOpacity(1),
                        blurRadius: 3,
                        spreadRadius: 5,
                        offset: Offset(1,1),
                      ),


                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(-1,-1),


                      )],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [  Color(0xff2A2B3C).withOpacity(.8),Colors.black12.withOpacity(.9),],
                        stops: [.1,.9]),
                    //color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),

                  //height: verticalPixel*12,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: verticalPixel*2, vertical: 5),
                      child: Text(
                        'T R A K ',
                        style: TextStyle(
                            color: Colors.grey[200],//Color(0xffbac4d2),

                            fontSize: verticalPixel*4,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Righteous',
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
                    ),
                  ),
                ),


              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: verticalPixel*3, bottom: verticalPixel*2),
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
                            majorGridLines: MajorGridLines(width: 0),
                              interactiveTooltip: InteractiveTooltip(
                                enable: false,
                              ),

                          ),

                          primaryYAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            interactiveTooltip: InteractiveTooltip(
                              enable: true,
                            ),

                            labelFormat: labelFormat,
                          ),
                          crosshairBehavior: CrosshairBehavior(
                            lineType: CrosshairLineType.horizontal ,
                            enable: true,

                            //hideDelay: 1000,

                            activationMode: ActivationMode.longPress,
                            shouldAlwaysShow: false,
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
          ),// The Graph
          Padding(
            padding: EdgeInsets.symmetric(horizontal: verticalPixel*1),
            child: Row(
              children: <Widget>[
                SizedBox(width: verticalPixel*5,),
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400].withOpacity(1),
                            blurRadius: 3,
                            spreadRadius: 5,
                            offset: Offset(1,1),
                          ),


                          BoxShadow(
                            color: Colors.white70,
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(-1,-1),


                          )],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [  Color(0xff2A2B3C).withOpacity(.8),Colors.black12.withOpacity(.9),],
                          stops: [.1,.9]),
                      //color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),

                    //height: verticalPixel*12,
                    child: Center(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: verticalPixel*1),
                        child: Text('$showingID Graph', style: TextStyle( color: Colors.white, fontFamily: 'Ubuntu', fontWeight: FontWeight.w300),),
                      ),
                    )),
                  ),
                ),
                SizedBox(width: verticalPixel*1,),
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),

                    //height: verticalPixel*12,
                    child: Center(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: verticalPixel*0.2),
                      child: Text('Rank #$showingRank on CoinBase', style: TextStyle( color: Colors.black38, fontFamily: 'Ubuntu', fontWeight: FontWeight.w300),),
                    )),
                  ),
                ),
                SizedBox(width: verticalPixel*2,),
              ],
            ),
          ),

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
                      showing=onoff.indexOf(0);
                      showingID = currencies[showing].idToName();
                      showingRank = currencies[showing].showRank();
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
            //color: Colors.black,
            child: FloatingActionButton(
              backgroundColor: Colors.grey[200],
              elevation: 0,
              child: Icon(Icons.cached, size: 30, color: Colors.black,),
              onPressed: (){
                print(showing);

              },
            ),

          ),// Divider
//          Container(
//            height: 2000,
//            color: Colors.blueAccent,
//             child: null,
//             //Text(sparkLineData[0]['timestamps'][0] + sparkLineData[0]['prices'][0]),
//          ) // Test Area
          // CRYPTO TYPE
        ],
      ),

    );
  }
}