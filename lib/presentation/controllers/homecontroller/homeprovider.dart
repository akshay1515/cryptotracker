import 'package:bitcointracker/data/model/pricemodel.dart';
import 'package:bitcointracker/data/repository/remote/home_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<Price> _bitPrices = [];

  List<Price> get bitPrices => _bitPrices;


  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  Future getBitList() async {
    final response = await HomeRepository().getPrice();
    _bitPrices.addAll(response);
    notifyListeners();
  }

  changeIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
}
