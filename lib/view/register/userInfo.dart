import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagr/constant/colors.dart';
import 'package:tagr/constant/string.dart';
import 'package:tagr/constant/stroge_constant.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/view/homeScreen/home.dart';

class UserInfo extends StatefulWidget {
   const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserName(); 
  }

  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserName = prefs.getString('userName');
    if (storedUserName != null) {
      setState(() {
        userNameAc = storedUserName;
        _nameController.text = userNameAc;
      });
    }
  }


  void _saveUserName(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userName', name);
  setState(() {
    userNameAc = name;
  });
}



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double spaceWidth = size.width / 10;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: spaceWidth, right: spaceWidth),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height / 10,),
                    //Personal Info
                    SvgPicture.asset(Assets.images.botStickerSvg.path,height: size.height/7,),
                    SizedBox(height: size.height/40,),
                    const Text(string.successfulSignUp,style: TextStyle(fontSize: 17,color: SoidColor.colorSubject),textAlign: TextAlign.center,),
                    SizedBox(height: size.height/30,),
                    TextField(
                      controller: _nameController,
                      style: textTheme.headline5,
                      decoration: InputDecoration(
                        hintText: "Your Name",
                        hintStyle: textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: size.height / 10,),
                    SizedBox(height: size.height / 2,)
                  ]
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: () {
                    userNameAc = _nameController.text;

                    // ذخیره نام کاربر در حافظه محلی
                    _saveUserName(userNameAc);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));

                    Get.snackbar("Welcome $userNameAc !", "Have Fun... :)");
                  },
                  child: const Text("Finish")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}