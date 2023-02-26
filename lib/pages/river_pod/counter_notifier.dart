import 'package:river_pod/constants/export.dart';

class CounterDemo extends StateNotifier<int>{
  CounterDemo():super(0);

  void incrementFunction(){
    state++;
  }

}