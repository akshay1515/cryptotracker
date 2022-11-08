import 'package:bitcointracker/utils/constants/asset/assetaddress.dart';
import 'package:bitcointracker/utils/constants/routes/routename.dart';
import 'package:bitcointracker/utils/constants/string/stringconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pushReplacementNamed(RoutesName.homeAddress);
      });
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              AssetAddress.splashLogo,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            StringConstant.appName,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          )
        ],
      ),
    );
  }
}
