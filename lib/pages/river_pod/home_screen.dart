import 'package:river_pod/constants/export.dart';
import 'package:river_pod/pages/river_pod/counter_notifier.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("build called");
    ref.listen(counterStateNotifierProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("This is ref.list method for listen the value "),
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          InkWell(
            onTap: () {
              // ref.invalidate and ref.refresh used for refresh the provider value
              // ref.invalidate(counterStateNotifierProvider);

              ref.refresh(counterStateNotifierProvider);
            },
            child: Container(
              margin: EdgeInsets.only(right: margin_20),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: height_30,
              ),
            ),
          )
        ],
        title: text('Home',
            fontWeight: FontWeight.w600,
            fontSize: font_16,
            color: Colors.white),
      ),
      body: Container(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final increment =
                ref.watch(counterStateNotifierProvider);
            return Center(
              child: Text(
                "${increment}",
                style: TextStyle(color: kPrimaryColor, fontSize: font_25),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
              color: kPrimaryColor,
              onPressed: () {
                pushNamed(context: context, route: Routes.notifierProvider);
              },
              child: text('notifier provider',
                  color: Colors.white, fontSize: font_14)),
          MaterialButton(
              color: kPrimaryColor,
              onPressed: () {
                pushNamed(context: context, route: Routes.streamProvider);
              },
              child: text('stream provider',
                  color: Colors.white, fontSize: font_14)),
          MaterialButton(
              color: kPrimaryColor,
              onPressed: () {
                pushNamed(context: context, route: Routes.userScreen);
              },
              child: text('future provider',
                  color: Colors.white, fontSize: font_14)),
          MaterialButton(
              color: kPrimaryColor,
              onPressed: () {
                pushNamed(context: context, route: Routes.nameProvider);
              },
              child: text('name provider',
                  color: Colors.white, fontSize: font_14)),
          FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: kPrimaryColor,
            onPressed: () {
              ref
                  .read(counterStateNotifierProvider.notifier)
                  .incrementFunction();
            },
          ),
        ],
      ),
    );
  }
}
