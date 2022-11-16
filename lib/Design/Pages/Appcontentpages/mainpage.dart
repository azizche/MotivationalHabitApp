import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/newhabit.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/tabnavigator.dart';
import 'package:monumental_habits/Logic/cubits/addhabit/cubit/addhabit_cubit.dart';

import 'Home/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navindex = 0;
  List<int> pagenumbers = [1, 2, 3, 4];
  Map<int, GlobalKey<NavigatorState>> pagekeys = {
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    buildoffstagenavigatorwidget(int pagenumber) {
      return TabNavigator(
          navigatorKey: pagekeys[pagenumber]!, pagenumber: pagenumber);
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            width: getsize(context).width,
            bottom: 0,
            child: Image.asset(
              imagepath + 'home/Backgroundhomepage.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          PageView(
            controller: controller,
            onPageChanged: ((value) {}),
            children: [
              for (int i = 1; i < 4; i++) buildoffstagenavigatorwidget(i),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: getsize(context).width,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    imagepath + "home/Backgroundhomepage.png",
                  ),
                  fit: BoxFit.none,
                )),
              ))
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD07E32).withOpacity(0.2),
        ),
        child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Color(0xFFFC9D45),
            onPressed: () {
              if (!BlocProvider.of<AddhabitCubit>(context)
                  .state
                  .addOrConfirmHabit)
                BlocProvider.of<AddhabitCubit>(context).addpressed();
            },
            child: BlocBuilder<AddhabitCubit, AddhabitState>(
              builder: (context, AddhabitState state) {
                String path = state.addOrConfirmHabit
                    ? 'home/confirm.png'
                    : 'home/plus.png';
                return Image.asset(imagepath + path);
              },
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          height: 80 * getscale(context),
          backgroundColor: Colors.white,
          elevation: 0,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          tabBuilder: ((index, isActive) {
            String str = navindex == index ? "non" : "";

            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 50,
              ),
              child: Image.asset(
                imagepath + 'home/icon${index + 1}$str.png',
              ),
            );
          }),
          activeIndex: navindex,
          onTap: (a) {
            navindex = a;
            setState(() {});

            controller.animateToPage(navindex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          }),
    );
  }
}
