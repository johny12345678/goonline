import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goonline_app/pages/dashboard_screens/done_screen.dart';
import 'package:goonline_app/pages/dashboard_screens/executing_screen.dart';
import 'package:goonline_app/pages/dashboard_screens/planned_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context, screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style7,
      popAllScreensOnTapAnyTabs: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.fastOutSlowIn
      ),

      );
  }
}


    final _controller = PersistentTabController(initialIndex: 0);




   List<Widget> _buildScreens() {
        return [
           const PlannedScreen(title: "Planned",),
               const ExecutingScreen(title: "Executing"),
    const DoneScreen(title: "Done"),

   
        ];
   }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
             PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.doc_text),
                title: ("Planned"),
                activeColorPrimary: CupertinoColors.systemBlue,
                activeColorSecondary: Colors.white,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.arrow_2_circlepath),
                title: ("Executing"),
                activeColorPrimary: CupertinoColors.systemOrange,
                activeColorSecondary: Colors.white,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.check_mark_circled),
                textStyle: const TextStyle(
                  color: Colors.white
                ),
                title: ("Done"),
                activeColorPrimary: CupertinoColors.systemGreen,
                activeColorSecondary: Colors.white,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
