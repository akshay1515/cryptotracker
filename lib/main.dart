import 'package:bitcointracker/presentation/controllers/homecontroller/homeprovider.dart';
import 'package:bitcointracker/presentation/screens/splashscreen/pages/splashpage.dart';
import 'package:bitcointracker/presentation/screens/homescreen/page/homepage.dart';
import 'package:bitcointracker/utils/constants/routes/routename.dart';
import 'package:bitcointracker/utils/constants/singlecontext.dart';
import 'package:bitcointracker/utils/constants/string/stringconstant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: MaterialApp(
        navigatorKey: SingleContext.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: StringConstant.appName,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
        routes: {
          RoutesName.splashAddress: (context) => const SplashPage(),
          RoutesName.homeAddress: (context) => const HomePage()
        },
      ),
    );
  }
}
