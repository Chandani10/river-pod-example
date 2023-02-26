import 'package:river_pod/constants/export.dart';



class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String nameProvider = '/nameProvider'; //consumerWidget
  static const String userScreen = '/userScreen'; //future provider
  static const String streamProvider = '/streamProvider'; //stream provider
  static const String notifierProvider = '/notifierProvider'; //notifier

  /*============================================== All App Routes added here ===================================================*/

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login:(BuildContext context) => LoginScreen(),
    home:(BuildContext context) => HomeScreen(),
    nameProvider:(BuildContext context) => NameProvider(),
    userScreen:(BuildContext context) => UserListScreen(),
    streamProvider:(BuildContext context) => StreamProviderScreen(),
    notifierProvider:(BuildContext context) => NotifierProviderScreen(),
  };
}