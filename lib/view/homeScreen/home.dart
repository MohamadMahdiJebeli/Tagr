import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/string.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/view/aboutScreen.dart';
import 'package:tagr/view/homeScreen/home_Screen.dart';
import 'package:tagr/view/homeScreen/profileScreen.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class Home extends StatelessWidget{
  RxInt selectedIndex = 0.obs;

  Home({super.key});
  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double spaceWidth = size.width/10;

    List<Widget> mainScreenPages=[
    ];

    return Scaffold(
      key: _key,
      //Drawer
      drawer: Drawer(
        backgroundColor: SoidColor.colorBGScafold,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                },
                //Profile Humberger Menu
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Assets.images.user.path,scale: 5,),
                    SizedBox(height: size.height/65,),
                    // ignore: deprecated_member_use
                    Text("Mohamad Mahdi Jebeli",style: textTheme.headline5,),
                    SizedBox(height: size.height/190,),
                    Text("mohamadmahdijebeli@gmail.com",style: textTheme.headlineLarge,)
                  ],
                ),
              ),
            ),
            //Humberger Menu
            const Divider(
              color: SoidColor.colorDivider,
            ),
            ListTile(
              title: Row(
                children: [
                  ImageIcon(Assets.icons.share.provider()),
                  const SizedBox(width: 7,),
                  const Text("Share")
                ],
              ),
              onTap: () async{
                await Share.share(string.share);
              },
            ),
            const Divider(
              color: SoidColor.colorDivider,
            ),
            ListTile(
              title: Row(
                children: [
                  ImageIcon(Assets.icons.customerSupport.provider()),
                  const SizedBox(width: 7,),
                  const Text("Support")
                ],
              ),
              onTap:() => {launch("https://www.t.me/mohamadmahdi_jebeli")},
            ),
            const Divider(
              color: SoidColor.colorDivider,
            ),
            ListTile(
              title: Row(
                children: [
                  ImageIcon(Assets.icons.about.provider()),
                  const SizedBox(width: 7,),
                  const Text("About"),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutScreen()));
              },
            )
          ],
        ),
      ),
      //AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        InkWell(
          child: const Icon(Icons.menu,),
          onTap: () {
            _key.currentState!.openDrawer();
          },
          ),
        Image(image: Assets.images.tagrLogoNoBG.provider(),color: Colors.black,height: size.height/13.6,),
        const Icon(Icons.search),
        ],
        ),
      ),
      body: 
      Stack(
        children: [
          Positioned.fill(
            child: Obx(() => IndexedStack(
              index: selectedIndex.value,
              children: [
                HomeScreen(size: size, textTheme: textTheme, spaceWidth: spaceWidth),
                ProfileScreen(size: size, textTheme: textTheme, spaceWidth: spaceWidth),
              ],
            ))
            ),
          //Bottom Navigation
          BttmNavigation(
          size: size,
          mainScreenPages: mainScreenPages,
          changePage: (int value){
              selectedIndex.value=value;
          },
          ),
        ],
      ),
    );
    }
}

class BttmNavigation extends StatelessWidget {
  const BttmNavigation({
    super.key,
    required this.size,
    required this.mainScreenPages,
    required this.changePage,
  });

  final Size size;
  final List<Widget> mainScreenPages;
  final Function changePage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
    
      child: Container(
      height: size.height/10,
      
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:GradientColor.bottomNavBGColor,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter
          )
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size.width/13,right: size.width/13 ,bottom: size.height/80,top: size.height/80),
        child: Container(
          height: size.height/8,
      
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
      
            gradient: LinearGradient(colors: GradientColor.bottomNavColor)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () => changePage(0), icon: ImageIcon(Assets.icons.home.provider(),size: 30,),color: SoidColor.colorSubjectOnPage,),
              IconButton(onPressed: (){}, icon: ImageIcon(Assets.icons.add.provider(),size: 30,),color: SoidColor.colorSubjectOnPage,),
              IconButton(onPressed: () => changePage(1), icon: ImageIcon(Assets.icons.user.provider(),size: 30,),color: SoidColor.colorSubjectOnPage,)
            ],
          ),
        ),
      ),
              ),
    );
  }
}