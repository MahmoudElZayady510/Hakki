import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
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
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.blue[100],
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft ,
          child: Padding(padding: EdgeInsets.fromLTRB(40,4,4,4),
            //EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/tomo.png'),
              radius: 25,
            ),
          ) ,),
      ),
      body:_isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          :
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:ColorFiltered(
                  child: Image.asset('assets/liberary.jpg', scale: 1.8,),
                  colorFilter: ColorFilter.mode(Colors.blueAccent, BlendMode.modulate),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
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
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text('موعود بملك العلا',
                              style: TextStyle(
                                fontFamily: 'Bein',
                                color: Colors.blue[600],
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),

                          Text('للكاتبة كاريدينيا',
                            style: TextStyle(
                              fontFamily: 'Bein',
                              color: Colors.blue[500],
                              fontSize: 17,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text('التصنيف: رعب',
                              style: TextStyle(
                                fontFamily: 'Bein',
                                color: Colors.blue[500],
                                fontSize: 11,
                                fontWeight: FontWeight.w100,))

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
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
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text('موعود بملك العلا',
                              style: TextStyle(
                                fontFamily: 'Bein',
                                color: Colors.blue[600],
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),

                          Text('للكاتبة كاريدينيا',
                            style: TextStyle(
                              fontFamily: 'Bein',
                              color: Colors.blue[500],
                              fontSize: 17,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text('التصنيف: رعب',
                              style: TextStyle(
                                fontFamily: 'Bein',
                                color: Colors.blue[500],
                                fontSize: 11,
                                fontWeight: FontWeight.w100,))

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
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
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text('موعود بملك العلا',
                              style: TextStyle(
                                fontFamily: 'Bein',
                                color: Colors.blue[600],
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),

                          Text('للكاتبة كاريدينيا',
                            style: TextStyle(
                              fontFamily: 'Bein',
                              color: Colors.blue[500],
                              fontSize: 17,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text('التصنيف: رعب',
                              style: TextStyle(
                                fontFamily: 'Bein',
                                color: Colors.blue[500],
                                fontSize: 11,
                                fontWeight: FontWeight.w100,))

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
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
            ],
          ),
        ),
      ),
    );
  }
}
