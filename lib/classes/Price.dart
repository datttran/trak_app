

class Price{
  final String timestamps;
  final double prices;

  Price(this.timestamps, this.prices);

  factory Price.fromJson(dynamic json){
    return Price(json['timestamps'] as String, json['prices'] as double);
  }



  @override
  String toString(){
    return '{ ${this.timestamps}, ${this.prices} }';
  }
}
