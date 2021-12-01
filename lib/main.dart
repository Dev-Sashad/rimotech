import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rimotech/screens/auth/sign_in/signin_view.dart';
import 'package:rimotech/util/locator.dart';
import 'package:rimotech/util/progressBarManager/progressManager.dart';
import 'package:rimotech/util/progressBarManager/progressService.dart';
import 'package:rimotech/util/router.dart';
import 'constants/colors.dart';
import 'core/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rimotech',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) {
            return ProgressManager(child: child);
          },
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.primaryColor,
          accentColor: AppColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Euclid Circular A Regular'),
      home: SignInView(),
      onGenerateRoute: generateRoute,
    );
  }
}
