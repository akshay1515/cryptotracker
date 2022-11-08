import 'package:bitcointracker/data/model/pricemodel.dart';
import 'package:bitcointracker/presentation/controllers/homecontroller/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyListView extends StatelessWidget {
  final List<Price> currencyList;
  const CurrencyListView({Key? key, required this.currencyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
        itemExtent: 30,
        magnification: 1.5,
        diameterRatio: 1.5,
        useMagnifier: true,
        onSelectedItemChanged: (value) {
         Provider.of<HomeProvider>(context,listen: false).changeIndex(value);
        },
        children: currencyList.map((e) {
          return Text(e.code.toString());
        }).toList());
  }
}
