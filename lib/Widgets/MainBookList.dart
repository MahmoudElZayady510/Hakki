import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readify/Screens/BookDetails.dart';
import 'package:readify/core/Constants.dart';

class MainBooksList extends StatefulWidget {
   int bookNum;
  final double rating;
  final double imgScale;
   bool favorites;

  @override
  State<MainBooksList> createState() => _MainBooksListState();

   MainBooksList({
     required this.favorites,
     required this.bookNum,
    required this.rating,
    required this.imgScale
  });
}

class _MainBooksListState extends State<MainBooksList> {
  Constants consts = new Constants();

   String? name;
    String? img;
    String? author;
    String? cat;
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
      child: Container(
        decoration: BoxDecoration(
            // color: Color(0xffE7F7FD),
            color: Colors.white,
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
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(name??'',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      color: Color(0xff5EC9EF),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

                Text(author??'',
                  style: TextStyle(
                    fontFamily: 'Bein',
                    color: Color(0xff5EC9EF),
                    fontSize: 17,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Text( 'التصنيف:${cat}'  ,
                    style: TextStyle(
                      fontFamily: 'Bein',
                        color: Color(0xff5EC9EF),
                      fontSize: 11,
                      fontWeight: FontWeight.w100,)),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: widget.rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          decoration: BoxDecoration(
                            color: Color(0xff5EC9EF),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: RichText(text: TextSpan(
                            children: [
                              WidgetSpan(child: Icon(Icons.menu_book , color: Colors.white, size: 15,)),
                              TextSpan(text: '    التفاصيل',
                                  style: TextStyle(
                                    fontFamily: 'Bein',
                                    fontSize: 15,
                                  )
                              ),
                            ]
                          )),
                        ),
                      ),
                      SizedBox(width: 30,),
                      IconButton(onPressed: (){
                        // setState(() {
                        //   _favorites = !_favorites;
                        // });
                      },
                          icon: Icon(Icons.favorite, color: widget.favorites? Color(0xff5EC9EF) : Colors.grey,
                          size: 30,)),
                      SizedBox(width: 30,)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(img??'',
                  scale: widget.imgScale,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}