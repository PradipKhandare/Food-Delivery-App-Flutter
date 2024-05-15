import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extensions.dart';
import 'package:food_delivery/common_widget/round_button.dart';

import '../main_tableview/main_tabview.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int selectPage = 0;
  PageController pageController = PageController();

  List pageArr = [
    {
      "title": "Find Food You Love",
      "subtitle":
      "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/img/on_boarding_1.png"
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\nwherever you are",
      "image": "assets/img/on_boarding_2.png"
    },
    {
      "title": "Live Tracking",
      "subtitle":
      "Real time tracking of your food on the app\nonce you placed the order",
      "image": "assets/img/on_boarding_3.png"
    }
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        selectPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: pageArr.length, // Specify the item count
              itemBuilder: ((context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: media.width,
                      height: media.width,
                      alignment: Alignment.center,
                      child: Image.asset(
                        pObj["image"].toString(),
                        width: media.width * 0.65,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: media.width * 0.15),
                    Text(
                      pObj["title"].toString(),
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 28,
                          fontWeight: FontWeight.w800
                      ),
                    ),

                    SizedBox(height: media.width * 0.05),
                    Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: media.width * 0.3),
                  ],
                );
              }
              )
          )

          , Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: media.height * 0.6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageArr.map((e) {
              var index = pageArr.indexOf(e);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: index == selectPage ? TColor.primary: TColor.placeholder, borderRadius: BorderRadius.circular(4)),
              );
            }).toList(),),
              SizedBox(height: media.height * 0.22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(title: "Next", onPressed: () {
                if (selectPage >= pageArr.length - 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainTabView()));
                } else {
                  //Next
                  setState(() {
                    selectPage = selectPage + 1;
                    pageController.animateToPage(
                        selectPage, duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut);
                  });
                }
              }),
            ),

          ],)
        ],
      ),
    );
  }
}
