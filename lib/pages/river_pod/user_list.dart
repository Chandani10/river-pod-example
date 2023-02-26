import 'package:river_pod/constants/export.dart';
import 'package:river_pod/main.dart';

final userDataProvider = FutureProvider((ref) {
  return ref.read(apiProvider).getUserData();
});

class UserListScreen extends ConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: text('Future Provider',
            fontWeight: FontWeight.w600,
            fontSize: font_16,
            color: Colors.white),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: userData.when(data: (data) {
          return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${data[index].firstname.toString()}',
                  ),
                  subtitle: Text(
                    '${data[index].email.toString()}',
                  ),
                  leading: CircleAvatar(
                    child: Image.network('${data[index].avatar.toString()}'),
                  ),
                );
              });
        }, error: (error, stackTrace) {
          return Text('$error');
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
