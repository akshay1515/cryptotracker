class Bitcoin {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  Bitcoin({this.time, this.disclaimer, this.chartName, this.bpi});

  Bitcoin.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    disclaimer = json['disclaimer'];
    chartName = json['chartName'];
    bpi = json['bpi'] != null ? new Bpi.fromJson(json['bpi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    data['disclaimer'] = this.disclaimer;
    data['chartName'] = this.chartName;
    if (this.bpi != null) {
      /* data['bpi'] = this.bpi!.toJson();*/
    }
    return data;
  }
}

class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;

  Time({this.updated, this.updatedISO, this.updateduk});

  Time.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    updatedISO = json['updatedISO'];
    updateduk = json['updateduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['updatedISO'] = this.updatedISO;
    data['updateduk'] = this.updateduk;
    return data;
  }
}

class Bpi {
  Bpi({required Map<String, dynamic> priceList}) {
    _priceList = priceList;
  }

  Bpi.fromJson(Map<String, dynamic> json) {
    final jsonKeys = json.values;
    List<Price> price = [];

    jsonKeys.forEach((element) {
      price.add(Price.fromJson(element));
    });

    _priceList = {'price': price};
  }

  Map<String, dynamic>? _priceList;

  Map<String, dynamic>? get priceList => _priceList;
}

class Price {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Price({this.code, this.symbol, this.rate, this.description, this.rateFloat});

  Price.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    description = json['description'];
    rateFloat = json['rate_float'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['rate_float'] = this.rateFloat;
    return data;
  }
}
