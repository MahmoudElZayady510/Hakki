import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:readify/Screens/Home.dart';

import '../Widgets/MainBookList.dart';
class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}
class _ExploreState extends State<Explore> {
  int currentindex = 1;
  bool search = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Start the loading process
    _startLoading();
  }

  void _startLoading() {
    // Simulate a delay for the loading indicator
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('إستكشف',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ],
        ),
        flexibleSpace: Align(
        alignment: Alignment.bottomLeft ,
        child: Padding(padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/tomo.png'),
            backgroundColor: Colors.white,
            radius: 25,
          ),
        ) ,),
        backgroundColor: Colors.blue[100],
    ),
      body:_isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          :
      CustomScrollView(
    slivers: [
        SliverFillRemaining(
        hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,15,15,50),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Text('إكتشف' ,
              style: TextStyle(
                height: 1.5,
              fontSize: 35,
              fontFamily: 'Bein',
              color: Color(0xff2E4374),
              ),
              ),
                Text('مكتبة موقعنا',
                  style: TextStyle(
                    height: 1,
                    fontSize: 25,
                    fontFamily: 'Bein',
                    color: Color(0xff2E4374),
                  ),
                ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Material(
                  // elevation: 4,
                  // shadowColor: Colors.grey,
                  child: TextField(
                    onTapOutside: (value){
                      setState(() {
                        search = false;
                      });
                    },
                    onSubmitted: (value){
                      setState(() {
                        search = true;
                      });
                    },
                    style: TextStyle(fontSize: 20, height: 1),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.5, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      label: RichText(text: TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.search, color: Colors.grey)),
                          TextSpan(text: 'إبحث عن كتاب',
                            style:TextStyle(
                              color: Colors.grey,
                                fontFamily: 'Bein',
                                fontSize: 20,
                                fontWeight: FontWeight.w100
                            ),
                          )
                        ]
                      ))
                    ),
                  ),
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   // TextButton(
                   //     onPressed: (){
                   //       print('object');
                   //     },
                   //     child: Text('<المزيد',
                   //     style: TextStyle(
                   //       fontSize: 25,
                   //       fontFamily: 'Bein',
                   //       color: Colors.blue[900],
                   //       decoration: TextDecoration.underline,
                   //       fontWeight: FontWeight.w100,
                   //     ),
                   //     ),
                   // ),
                    Text('التصنيفات',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2E4374),
                      letterSpacing: 1,
                    ),
                    ),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Text('مغامرات',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('رعب',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('رومانسي',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('غموض',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('فانتازيا',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('ديني',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('كوميدي',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text('تاريخ',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 20,),
               Visibility(
                 visible: !search,
                 child: GestureDetector(child: MainBooksList(favorites: true, bookNum: 0, rating: 4,imgScale: 1.75,),
                   onTap: (){
                     Navigator.pushNamed(context, 'bookDetails');
                   },
                 ),
               ),
                // SizedBox(height: 20,),
                Visibility(
                  visible: !search,
                  child: GestureDetector(child: MainBooksList( favorites: false,bookNum: 2, rating: 3,imgScale: 1.75,),
                    onTap: (){
                      Navigator.pushNamed(context, 'bookDetails02');
                    },
                  ),
                ),
                // SizedBox(height: 20,),
                Visibility(
                  visible: !search,
                  child: GestureDetector(child: MainBooksList(favorites: false,bookNum: 1, rating: 4,imgScale: 1.75,),
                    onTap: (){
                      Navigator.pushNamed(context, 'bookDetails01');
                    },
                  ),
                ),
                // SizedBox(height: 20,),
                Visibility(
                  visible: !search,
                  child: GestureDetector(child: MainBooksList(favorites: false,bookNum: 2, rating: 4,imgScale: 1.75,),
                    onTap: (){
                      Navigator.pushNamed(context, 'bookDetails02');
                    },
                  ),
                ),
                Visibility( //result
                  visible: search,
                  child: GestureDetector(child: MainBooksList(favorites: false,bookNum: 3, rating: 4,imgScale: 1.75,),
                    onTap: (){
                      Navigator.pushNamed(context, 'bookDetails01');
                    },
                  ),
                ),
                // SizedBox(height: 20,),
              ],
              ),
            ),)]),
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedFontSize: 17,
      //     iconSize: 40,
      //     type : BottomNavigationBarType.fixed,
      //     // backgroundColor: Colors.purple,
      //     currentIndex: 1,
      //     onTap:(int newindex){
      //       setState(() {
      //         currentindex = newindex;
      //         if(currentindex == 0) Navigator.pushNamed(context, 'home');
      //       }
      //       );
      //     } ,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'الرئيسية',
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
