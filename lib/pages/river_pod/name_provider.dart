import 'package:river_pod/constants/export.dart';
final nameProvider=Provider<String>((ref) => 'chandani');
class NameProvider  extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name=ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: text('Consumer Widget',
            fontWeight: FontWeight.w600, fontSize: font_16, color: Colors.white),
        backgroundColor: kPrimaryColor,),
      body: Container(
        alignment: Alignment.center,
        child: text('$name'),
      ),
    );
  }
}
