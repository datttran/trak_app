import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trak/buildMethods/size_config.dart';
import 'package:trak/buildMethods/circleBuilder.dart';
import 'package:trak/classes/cryto.dart';
import 'package:trak/data/constants.dart';
import 'package:flutter/cupertino.dart';
class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();

}

class _AddCardState extends State<AddCard> {



  addCheck(coin){
    if(currencies.contains(coin)){
      return CupertinoSwitch(
        value: coin.switchValue,
        onChanged: (bool value) {
          setState(() {
            coin.switchValue = value;
            if(value == true ){
              showCurrency.add(coin);


            }
            else{
              showCurrency.remove(coin);

            }
          });
        },

      );

    }
    else{
      return Icon(Icons.add, color: Colors.red);
    }
  }
  @override

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.grey[200], Colors.grey[50]],
              stops: [0,1]),
        ),
        height: verticalPixel*63,
        width: horizontalPixel*84,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(left: verticalPixel*2.3, top: verticalPixel),
                  child: Text('+ TRAK LIST', style: TextStyle(fontSize: verticalPixel*2.3, fontFamily: 'Righteous' , color: Colors.black.withOpacity(.7)),),
                )),
            Container(
              height: verticalPixel*47,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: verticalPixel*1.5, vertical: verticalPixel*1.5),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    dragStartBehavior: DragStartBehavior.start,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,

                    children: <Widget>[
                      for (int i = 0; i < currencies.length; i += 1)
                        buildCard(currencies[i], addCheck),



                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, true);


              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(

                    width: horizontalPixel*25,
                    height: verticalPixel * 4,
                    margin: EdgeInsets.only(right: verticalPixel * 2, bottom: verticalPixel*1.5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400].withOpacity(1),
                          blurRadius: 3,
                          spreadRadius: 5,
                          offset: Offset(1, 1),
                        ),
                        BoxShadow(
                          color: Colors.grey[50],
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(-1, -1),
                        )
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.grey[100].withOpacity(.9),
                          ],
                          stops: [
                            .1,
                            .9
                          ]),
                      //color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),

                    //height: verticalPixel*12,
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: verticalPixel*2,
                              color: Colors.grey,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ) ,
      ),
    );
  }
}



 buildCard(Crypto coin, Function function)  {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical : 10, horizontal: 15),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400].withOpacity(1),
            blurRadius: 3,
            spreadRadius: 5,
            offset: Offset(1, 1),
          ),
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(-1, -1),
          )
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[50].withOpacity(.8),
              Colors.grey[200].withOpacity(.9),
            ],
            stops: [
              .1,
              .9
            ]),
        //color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),


      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPixel*0),
        child: Card(
          color: Colors.white30,
          elevation: 0,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child:CircleImage(avt: coin.icon, radius: verticalPixel*4).buildAvt() ,),
                  SizedBox(width: verticalPixel*1.2,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: verticalPixel*3,),
                          Text(coin.name, style: TextStyle( fontSize: verticalPixel*1.7, fontFamily: 'Ubuntu'),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          sign(coin),
                          Text('\$'+coin.price , style: TextStyle(fontFamily: 'Ubuntu'),),
                        ],
                      )

                    ],
                  )

                ],

              ),
              function(coin)






            ],
          ),
        ),
      ),
    ),
  );
}


sign(coin){
  if(double.parse(coin.priceChange1d )< 0) {
    return Icon(Icons.arrow_drop_down, color: Colors.red, size: verticalPixel*3,);
  }
  else{
    return Icon(Icons.arrow_drop_up, color: Colors.green,size: verticalPixel*3);
  }
}

