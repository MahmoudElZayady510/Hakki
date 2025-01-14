import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readify/Widgets/ContinueBookList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/Constants.dart';

class ContinueBookList extends StatefulWidget {
  int bookNum;
  final double rating;
  final double imgScale;
  double completed;
  @override
  State<ContinueBookList> createState() => _ContinueBookListState();

  ContinueBookList({
    required this.bookNum,
    required this.rating,
    required this.imgScale,
    required this.completed,
  });
}

class _ContinueBookListState extends State<ContinueBookList> with TickerProviderStateMixin {
  Constants consts = new Constants();
  bool _favorites = false;
  String? name;
  String img = 'assets/democracy.png';
  String? author;
  String cat = '';


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    name = consts.names[widget.bookNum];
    img = consts.imgs[widget.bookNum];
    author = consts.authors[widget.bookNum];
    cat = consts.cats[widget.bookNum];
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails');
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffE7F7FD),
              // color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  offset: Offset(0, 5),
                  spreadRadius: 1,
                  color: Colors.black26,
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(name?? '',
                        style: TextStyle(
                          fontFamily: 'Bein',
                          color: Color(0xff5EC9EF),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),

                    Text(author?? '',
                      style: TextStyle(
                        fontFamily: 'Bein',
                        color: Color(0xff5EC9EF),
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text('التصنيف: ${cat}',
                        style: TextStyle(
                          fontFamily: 'Bein',
                          color: Color(0xff5EC9EF),
                          fontSize: 11,
                          fontWeight: FontWeight.w100,)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('% مكتمل ${widget.completed}',
                            style: TextStyle(
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontSize: 11,
                              fontWeight: FontWeight.w100,)
                        ),
                        SizedBox(
                          width: 170,
                          child: LinearProgressIndicator(
                            value: widget.completed/100.round(),
                            //backgroundColor: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(img ?? '',
                    scale:  widget.imgScale,
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
