import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readify/Widgets/ContinueBookList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../core/Constants.dart';
import '../Widgets/MainBookList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

Constants consts = new Constants();
class _HomeState extends State<Home> {
  @override
  int activeindex = 0;
  int currentindex = 0;
  String myName = '';
  String myimg = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkFirstLoad();
  }

  Future<void> _checkFirstLoad() async {
    // Ensure Flutter bindings are initialized
    WidgetsFlutterBinding.ensureInitialized();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasLoadedBefore = prefs.getBool('hasLoadedBefore') ?? false;
    if(hasLoadedBefore) {
      myName = 'محمود';
      myimg = 'assets/tomo.png';
    }
    if (!hasLoadedBefore) {
      // Simulate a delay for the loading indicator
      await Future.delayed(Duration(seconds: 3));
      await prefs.setBool('hasLoadedBefore', true);
      myName = 'محمود';
      myimg = 'assets/tomo.png';
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    final ppLink = "i.imgur.com/M3Wa1Rm.jpeg";
    final List<Widget> trending = [
      // sliderWidget(),
      // sliderWidget(),
      // sliderWidget(),
      GestureDetector(child: MainBooksList(favorites: true,bookNum: 0, rating: 4,imgScale: 1.4,),
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails');
        },
      ),
      GestureDetector(child: MainBooksList(favorites: false,bookNum: 3, rating: 5,imgScale: 1.4,),
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails01');
        },
      ),
      GestureDetector(child: MainBooksList(favorites: false,bookNum: 5, rating: 3,imgScale: 1.4,),
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails02');
        },
      ),
      GestureDetector(child: MainBooksList(favorites: false,bookNum: 1, rating: 4,imgScale: 1.4,),
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails01');
        },
      ),
    ];
    return  Scaffold(
        appBar: AppBar(

          flexibleSpace: Align(
            alignment: Alignment.bottomLeft ,
            child: Padding(padding:// EdgeInsets.fromLTRB(40,4,4,4),
                                      EdgeInsets.all(4),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.notifications, size: 35, color: Colors.blue[900],),
                    onPressed: (){
                    Navigator.pushNamed(context, 'notifications');
                    },
                  ),
                  SizedBox(width: 5,),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(myimg),
                    radius: 25,
                  ),

                ],
              ),
            ) ,),

          title: Align(
            alignment: Alignment.centerRight,
            child: Text("مرحباً ${myName}",
              style: TextStyle(
                  color: Colors.blue[900],
                fontFamily: 'Bein',
                letterSpacing: 1
              ),
              textAlign: TextAlign.right,
            ),),
          backgroundColor: Colors.blue[100],
        ),
        body: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            :
        SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,15,15,50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.blue[100],
                    //   borderRadius: BorderRadius.circular(35),
                    //   // boxShadow: [
                    //   //   BoxShadow(
                    //   //     blurRadius: 1.0,
                    //   //     offset: Offset(0, 30),
                    //   //     spreadRadius: 10,
                    //   //     //color: Colors.blue,
                    //   //   )
                    //   // ]
                    // ),
                    // padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        CarouselSlider(items: trending, options: CarouselOptions(
                          onPageChanged: (index , reason) {
                            setState(() {
                              activeindex = index;
                            });
                          },
                          autoPlay: true,
                          //   padEnds: false,
                          viewportFraction: 1,
                        )),
                        AnimatedSmoothIndicator(activeIndex: activeindex, count: trending.length)
                      ],
                    ),
                  ), // slider
                  SizedBox(height: 25,),

                  TitleWithIcon(title: 'أكمل القراءة', icon: Icons.chrome_reader_mode_rounded,route: 'cntReading',),
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContinueBookList(bookNum: 0, completed: 34, imgScale: 1.75, rating: 4,),
                        ContinueBookList(bookNum: 1, completed: 50, imgScale: 1.75, rating: 4,),
                        ContinueBookList(bookNum: 2, completed: 70, imgScale: 1.75, rating: 4,),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                 TitleWithIcon(title: 'الموصي به لك', icon: Icons.recommend_rounded, route: 'Recommended',),
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(child: MainBooksList(favorites: false,bookNum: 3, rating: 3,imgScale: 1.75),
                          onTap: (){
                          Navigator.pushNamed(context, 'bookDetails');
                          },
                        ),
                        GestureDetector(child: MainBooksList(favorites: false,bookNum: 5, rating: 4,imgScale: 1.75,),
                          onTap: (){
                            Navigator.pushNamed(context, 'bookDetails01');
                          },
                        ),
                        GestureDetector(child: MainBooksList(favorites: false,bookNum: 4, rating: 4,imgScale:2.1,),
                          onTap: (){
                            Navigator.pushNamed(context, 'bookDetails02');
                          },
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   selectedFontSize: 17,
        //     iconSize: 40,
        //     type : BottomNavigationBarType.fixed,
        //  // backgroundColor: Colors.purple,0
        //   currentIndex: 0,
        //     onTap:(int newindex){
        //       setState(() {
        //         currentindex = newindex;
        //         if(currentindex == 1) Navigator.pushNamed(context, 'explore');
        //       }
        //       );
        //     } ,
        //     items: const [
        //       BottomNavigationBarItem(
        //        icon: Icon(Icons.home),
        //        label: 'الرئيسية',
        //       ),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.explore),
        //           label: 'استكشف'
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.notifications),
        //         label: 'الإشعارات',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.verified_user),

        //         label: 'المستخدم',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.more),
        //         label: 'المزيد',
        //       ),
        //     ]),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  const TitleWithIcon({
    Key? key,required this.title, required this.icon, required this.route
    //super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 13, 13, 4),
                  child: Text( title,
                    style: TextStyle(
                      height: 1,
                      color: Color(0xff5ec9ef),
                      fontSize: 23,
                      fontFamily: 'Bein',
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Icon(icon,
                  color: Color(0xff5ec9ef),
                ),
              ],
            ),
            RichText(text: TextSpan(
              children: [
                TextSpan(text: 'أظهر المزيد',
                    style: TextStyle(
                        color: Color(0xff5EC9EF),
                        fontSize: 13,
                        fontFamily: 'Bein',
                        letterSpacing: 1,
                        decoration: TextDecoration.underline
                    ),
                ),
                WidgetSpan(child: Icon(Icons.arrow_back_ios_new , size: 13, color: Color(0xff5EC9EF),))
              ]
            ))
          ],
        ),
      ),
    );
  }
}

class sliderWidget extends StatelessWidget {
  const sliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(35),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 1.0,
            //     offset: Offset(0, 30),
            //     spreadRadius: 10,
            //     //color: Colors.blue,
            //   )
            // ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('موعود بملك العلا',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      color: Colors.blue[600],
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),

                  Text('للكاتبة كاريدينيا',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      color: Colors.blue[500],
                      fontSize: 19,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text('التصنيف: رعب',
                      style: TextStyle(
                        fontFamily: 'Bein',
                        color: Colors.blue[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w100,))

                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18,0,8,0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/book1.jpg',
                    scale: 1.75,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

