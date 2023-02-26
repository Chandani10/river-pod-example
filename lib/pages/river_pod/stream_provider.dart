import 'package:river_pod/constants/export.dart';
// auto dispose used for dispose the unnecessary state used means when we go back the 1st page stream will be stop.
final userStreamProvider = StreamProvider.autoDispose<int>((ref)
{
  return Stream.periodic(Duration(seconds: 2),((count){
    // ref.keepAlive used for preserve the state.

    //ref.keepAlive();
    return count;} )
  ) ;
});

class StreamProviderScreen extends ConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final streamData = ref.watch(userStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: text('Stream Provider',
            fontWeight: FontWeight.w600,
            fontSize: font_16,
            color: Colors.white),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: streamData.when(data: (data) {
          return Center(child: text(data.toString()));
        }, error: (error, stackTrace) {
          return Text('$error');
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
