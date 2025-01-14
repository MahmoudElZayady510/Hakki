import 'package:flutter/material.dart';
import 'package:readify/Widgets/ContinueBookList.dart';


class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}
bool _myList = false;
bool _donwloaded = false;
bool _finished = false;
class _UserState extends State<User> {
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
    //TabController _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/tomo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('محمود', style: TextStyle(color: Colors.blue[900]),),
                    Text('mahmoud.elzayady.7@gmail.com', style: TextStyle(color: Colors.grey, fontSize: 12, height: 1),),
                  ],
                ),
              )
            ],
          ),
          backgroundColor: Colors.blue[100],
        ),
        body:_isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            :
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0,25,8,8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _myList = true;
                        _donwloaded = false;
                        _finished = false;
                        print(_myList);
                        print('list');
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 0),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_myList) ? Color(0xff53c0ef) : Color(0xffe4f6fc) ,
                        boxShadow:[
                          BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 0.1,
                            color: Colors.black26,
                            offset: Offset(0,3)
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.favorite, color: Color(0xff2b4373),),
                          Text('1', style: TextStyle(color: Color(0xff2b4373), fontSize: 18)),
                          Text('قائمتي' , style: TextStyle(color: Color(0xff2b4373), fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _myList = false;
                        _donwloaded = true;
                        _finished = false;
                        print(_myList);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 0),
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _donwloaded ? Color(0xff53c0ef) : Color(0xffe4f6fc),
                          boxShadow:[
                            BoxShadow(
                                spreadRadius: 0.1,
                                blurRadius: 0.1,
                                color: Colors.black26,
                                offset: Offset(0,3)
                            )
                          ]),
                      child: Column(
                        children: [
                          Icon(Icons.download, color: Color(0xff2b4373),),
                          Text('1', style: TextStyle(color: Color(0xff2b4373), fontSize: 18)),
                          Text('التحميلات' , style: TextStyle(color: Color(0xff2b4373), fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _myList = false;
                        _donwloaded = false;
                        _finished = true;
                        print(_myList);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 0),
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _finished ? Color(0xff53c0ef) : Color(0xffe4f6fc),
                          boxShadow:[
                            BoxShadow(
                                spreadRadius: 0.1,
                                blurRadius: 0.1,
                                color: Colors.black26,
                                offset: Offset(0,3)
                            )
                          ]),
                      child: Column(
                        children: [
                          Icon(Icons.book_rounded, color: Color(0xff2b4373),),
                          Text('1', style: TextStyle(color: Color(0xff2b4373) , fontSize: 18)),
                          Text('المنتهي' , style: TextStyle(color: Color(0xff2b4373), fontSize: 18),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Visibility(
                  visible: _myList,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,15,0,0),
                            child: ContinueBookList(bookNum: 0,rating: 4,imgScale: 1.75,completed: 3,),
                          )
                        ],
                      ),
                    )),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Visibility(
                  visible: _donwloaded,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,15,0,0),
                            child: ContinueBookList(bookNum: 1,rating: 4,imgScale: 1.75,completed: 60,),
                          )
                        ],
                      ),
                    )),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Visibility(
                  visible: _finished,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,15,0,0),
                            child: ContinueBookList(bookNum: 3,rating: 4,imgScale: 1.75,completed: 100,),
                          )
                        ],
                      ),
                    )),
              ),
              // TabBar(
              //   padding: EdgeInsets.zero,
              //   labelPadding: EdgeInsets.zero,
              //   labelColor: Colors.blueAccent,
              //   tabs: [
              //     Container(
              //       width: double.infinity,
              //       color: Colors.brown,
              //       child: Column(
              //         children: [
              //           Icon(Icons.favorite),
              //           Text('قائمتي' , style: TextStyle(color: Colors.blue, fontSize: 18),),
              //         ],
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         Icon(Icons.favorite),
              //         Text('قائمتي' , style: TextStyle(color: Colors.blue, fontSize: 18),),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Icon(Icons.favorite),
              //         Text('قائمتي' , style: TextStyle(color: Colors.blue, fontSize: 18),),
              //       ],
              //     ),
              //   ],
              //   controller: _tabController,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
