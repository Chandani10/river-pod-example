import 'package:river_pod/constants/export.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }


  //--------------------------- Move to next screen --------------------------- //
  _navigateToNextScreen() => Timer(Duration(seconds: 3), () async {
    pushAndRemoveUntil(context: context,route: Routes.login);
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      child: Center(
          child: Image.asset(
        ic_login,
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      )),
    ));
  }
}
