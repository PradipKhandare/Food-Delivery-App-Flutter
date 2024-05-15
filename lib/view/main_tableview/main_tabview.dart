import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extensions.dart';
import 'package:food_delivery/common_widget/tab_button.dart';

import '../home/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 2;

  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
     // backgroundColor: const Color(0xfff5f5f5),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selectTab != 2) {
              selectTab = 2;
              selectPageView = const HomeView();
            }
            if (mounted) {
              setState(() {});
            }
          },
          shape: const CircleBorder(),
          backgroundColor: selectTab == 2 ? TColor.primary : TColor.placeholder,
          child: Image.asset(
            "assets/img/tab_home.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPageView = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: "Menu",
                isSelect: selectTab == 0,
                icon: 'assets/img/tab_menu.png',
              ),
          
              TabButton(
                onTap: () {
                  if (selectTab != 1) {
                    selectTab = 1;
                    selectPageView = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: "Offer",
                isSelect: selectTab == 1,
                icon: 'assets/img/tab_offer.png',
              ),
          
             const SizedBox(width: 40, height: 40,),
              TabButton(
                onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPageView = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: "Profile",
                isSelect: selectTab == 3,
                icon: 'assets/img/tab_profile.png',
              ),
          
              TabButton(
                onTap: () {
                  if (selectTab != 4) {
                    selectTab = 4;
                    selectPageView = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: "More",
                isSelect: selectTab == 4,
                icon: 'assets/img/tab_more.png',
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
