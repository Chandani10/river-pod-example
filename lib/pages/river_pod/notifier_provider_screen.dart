import 'package:river_pod/constants/export.dart';
import 'package:river_pod/pages/river_pod/notifier_provider.dart';

final counterProvider = NotifierProvider<Counter, int>(() {
  return Counter();
});

// Counter.new as a constructor tear-off:
//final counterProvider = NotifierProvider<Counter, int>(Counter.new);

class NotifierProviderScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,),
      body: Container(
        alignment: Alignment.center,
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final notifierProvider= ref.watch(counterProvider);
              return InkWell(
                  onTap: (){
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: Text('$notifierProvider',style: TextStyle(fontSize:
                  font_25,color: kPrimaryColor),)); },
           ),
      ),
    );
  }
}
