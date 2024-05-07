// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/gen/assets.gen.dart';
import 'package:tagr/component/colors.dart';
import 'package:tagr/component/string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.spaceWidth,
  });

  final Size size;
  final TextTheme textTheme;
  final double spaceWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //User Image
        Image(image: Assets.images.user.provider(),height: size.height/7,),
        const SizedBox(height:12),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(Assets.icons.editPicture.provider(),color: SoidColor.colorSubject,),
            const SizedBox(width: 8,),
            Text(string.editPicture,style: textTheme.headline2,)
          ],
        ),
        SizedBox(height: size.height/25 ,),
        //Profile Information
        Text("Mohamad Mahdi Jebeli",style: textTheme.headline4,),
        Text("mohamdmahdijebeli@gmail.com",style: textTheme.bodyText2,),
        
        SizedBox(height: size.height/10,),
        //Profile Menu
        ProfileDivider(size: size),
        InkWell(
          onTap: () {},
          splashColor: SoidColor.colorSubject,
          child: SizedBox(
            height: size.height / 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.favBlog.provider(),),
                const SizedBox(width: 5,),
                Text(string.favoriteBlogs,style:textTheme.headline5,)
              ]),
          ),
        ),
        ProfileDivider(size: size),
        InkWell(
          onTap: () {},
          splashColor: SoidColor.colorSubject,
          child: SizedBox(
            height: size.height/20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.favPodcast.provider(),),
                const SizedBox(width: 5,),
                Text(string.favoritePodcast,style:textTheme.headline5,)
              ]),
          ),
        ),
        ProfileDivider(size: size),
        InkWell(
          onTap: () {},
          splashColor: SoidColor.colorSubject,
          child: SizedBox(
            height: size.height/20  ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(Assets.icons.logout.provider(),),
                const SizedBox(width: 5,),
                Text(string.logOut,style:textTheme.headline5,)
              ]),
          ),
        ),
        SizedBox(height: size.height/7,)
      ],
    );
  }
}

