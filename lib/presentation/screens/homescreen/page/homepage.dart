import 'package:bitcointracker/data/repository/remote/home_repository.dart';
import 'package:bitcointracker/presentation/controllers/homecontroller/homeprovider.dart';
import 'package:bitcointracker/presentation/screens/homescreen/widgets/currencylistview.dart';
import 'package:bitcointracker/utils/constants/asset/assetaddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getBitList();
  }

  @override
  Widget build(BuildContext context) {
    final bitList = Provider.of<HomeProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetAddress.bitcoinLogo,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Price',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              bitList.bitPrices[bitList.currentIndex].rate.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: CurrencyListView(currencyList: bitList.bitPrices),
            ),
          ],
        ),
      ),
    );
  }
}
