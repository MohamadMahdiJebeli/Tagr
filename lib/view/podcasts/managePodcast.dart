import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagr/component/component.dart';
import 'package:tagr/controller/homeScreen_Controller.dart';
import 'package:tagr/controller/podcast/managePodcast_Controller.dart';
import 'package:tagr/controller/podcast/singlePodcast_Controller.dart';
import 'package:tagr/view/podcasts/singleMangePodcast.dart';
import 'package:tagr/view/podcasts/singlePodcastScreen.dart';
import 'package:tagr/widget/podcastWidget.dart';


// ignore: must_be_immutable
class ManagePodcast extends StatelessWidget {
  ManagePodcast({Key? key}) : super(key: key);

  ManagePodcastController managePodcastController =
      Get.put(ManagePodcastController());
  HomeScreen_Controller homeScreen_Controller = Get.put(HomeScreen_Controller());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: appbar(size, textTheme, "Podcast Management"),
        body: Obx(
          () => managePodcastController.loading.value
              ? const loading()
              : managePodcastController.podcastModel.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                          0, 15, 15, 0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: managePodcastController.podcastModel.length,
                        itemBuilder: ((context, index) {
                          // return Text(homeScreenController.topPodcast[index].title!,);
                          return GestureDetector(
                            onTap: () {
                              Get.to(SinglePodcastScrren());
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 56,
                                      width: 56,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          15,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: managePodcastController
                                              .podcastModel[index].poster!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      25),
                                                ),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover)),
                                          ),
                                          placeholder: ((context, url) =>
                                              const loading()),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.image_not_supported_outlined,
                                            size: 36,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 15),
                                      child: Column(
                                        children: [
                                          Text(
                                            managePodcastController
                                                .podcastModel[index].title!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            managePodcastController
                                                .podcastModel[index].author!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  : PodcastEmpty(textTheme: textTheme)
        ),
      ),
    );
  }
}
