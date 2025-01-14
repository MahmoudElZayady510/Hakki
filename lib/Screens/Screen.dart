import 'package:flutter/material.dart';
import 'package:readify/Screens/Explore.dart';
import 'package:readify/Screens/Home.dart';
import 'package:readify/Screens/More.dart';
import 'package:readify/Screens/Notifications.dart';
import 'package:readify/Screens/User.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}
 final screens = [
   Home(),
   Explore(),
   User(),
   More()
 ];
int currentPage = 0;
class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(
            color: Colors.lightGreen
          ),
            selectedItemColor: Color(0xff5ec9ef),

            selectedIconTheme: IconThemeData(
              size: 35
            ),
            selectedFontSize: 17,
            unselectedIconTheme: IconThemeData(
              size: 30
            ),
            // iconSize: 40,
            type : BottomNavigationBarType.fixed,
            // backgroundColor: Colors.purple,
            currentIndex: currentPage,
            onTap:(int newindex){
              setState(() {
                currentPage = newindex;
              //  if(currentindex == 0) Navigator.pushNamed(context, 'home');
              }
              );
            } ,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home, color: Color(0xff5ec9ef),),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                  activeIcon: Icon(Icons.search_rounded, color: Color(0xff5ec9ef),),
                  label: 'استكشف'
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.circle_notifications),
              //   activeIcon: Icon(Icons.circle_notifications, color: Color(0xff5ec9ef),),
              //   label: 'الإشعارات',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'المستخدم',
                activeIcon: Icon(Icons.account_circle, color: Color(0xff5ec9ef),),
              ),
              BottomNavigationBarItem(
                icon: Icon( Icons.view_list, ),
                activeIcon: Icon(Icons.view_list, color: Color(0xff5ec9ef),),
                label: 'المزيد',

              ),
            ]),
      ),
    );
  }
}
