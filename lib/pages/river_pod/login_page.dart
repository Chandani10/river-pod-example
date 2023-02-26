import 'package:river_pod/constants/export.dart';

// provider that returns a string value
//final nameProvider = Provider<String>((ref) => 'Jack');
final nameStateProvider = StateProvider<String?>((ref) => null);
final ageStateProvider = StateProvider<String?>((ref) => null);



class LoginScreen extends ConsumerStatefulWidget {

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController ageController=TextEditingController();





  //--------------------------on Change Method------------------------- //

  onChangeMethod(value,WidgetRef ref){
    //notifier allow us to change the value
  ref.read(nameStateProvider.notifier).update((state) => value);
  }

  onAgeChangeMethod(value,WidgetRef ref){
    ref.read(ageStateProvider.notifier).update((state) => value);
  }


  onAgeCheckMethod(value,WidgetRef ref){
    ref.read(ageStateProvider.notifier).update((state) {
      if(value>=18){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("you are eligible"),
          ));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("you are not eligible"),
        ));
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameStateProvider)??"";
    final age = ref.watch(ageStateProvider)??"";
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: text('Login',
            fontWeight: FontWeight.w600, fontSize: font_16, color: Colors.white),
      ),
      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin_20,vertical: margin_30),
          child:
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: margin_30),
              child:
              Image.asset(ic_login,fit: BoxFit.contain,scale: 0.6,),
            ),

            nameTextField(ref),
            vGap(height_40),
            ageTextField(ref),
            vGap(height_40),
            submitButton(),
            vGap(height_20),
            nameController.text.isNotEmpty?  text('Your name is $name',fontWeight: FontWeight.w600,
                fontSize: font_16, color: kPrimaryColor):Container(),
            ageController.text.isNotEmpty?  text('Your age is $age',fontWeight: FontWeight.w600,
                fontSize: font_16, color: kPrimaryColor):Container()


          ],
        ),),
      ),
    );
  }
  //--------------------------name Text Field------------------------ //

  Widget nameTextField(WidgetRef ref){
    return   TextFormField(
      controller: nameController,
      style: TextStyle(fontSize: font_18,color: kPrimaryColor),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onSaved: (email) {},
      decoration: InputDecoration(
          hintText: "Your name",
          filled: true,
          contentPadding: EdgeInsets.all( margin_20),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius_30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius_30)),
          fillColor: kPrimaryLightColor
      ),
      onChanged: (value){
        onChangeMethod(value,ref);
      },
    );
  }

  Widget ageTextField(WidgetRef ref){
    return   TextFormField(
      controller: ageController,
      style: TextStyle(fontSize: font_18,color: kPrimaryColor),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onSaved: (email) {},
      decoration: InputDecoration(
          hintText: "Your age",
          filled: true,
          contentPadding: EdgeInsets.all( margin_20),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius_30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius_30)),
          fillColor: kPrimaryLightColor
      ),
      onChanged: (value){
        onAgeChangeMethod(value,ref);
      },
    );
  }
  //--------------------------submit Button------------------------- //

  Widget submitButton(){return MaterialButton(
    shape: StadiumBorder(),
    minWidth: MediaQuery.of(context).size.width,
    color: kPrimaryColor,
    padding: EdgeInsets.all(margin_20),
    textColor: Colors.white,
    onPressed: () {
      if(ageController.text.isNotEmpty){
        onAgeCheckMethod(int.parse(ageController.text),ref);
        if(int.parse(ageController.text)>=18){
          pushAndRemoveUntil(context: context,route: Routes.home);
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please fill the required details"),
        ));
      }


    },
    child: Text(
      'Submit',
    ),

  );}
}


