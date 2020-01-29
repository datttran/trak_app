

class Price{
  final String timestamps;
  final int prices;

  Price(this.timestamps, this.prices);

  factory Price.fromJson(dynamic json){
    return Price(json['timestamps'] as String, json['prices'] as int);
  }



  @override
  String toString(){
    return '{ ${this.timestamps}, ${this.prices} }';
  }
}


void getPricePoint(){

  //var date = Day.fromString(sparkLineData[0]['timestamps'][i]).format('MMMM');


}