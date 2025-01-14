import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
PickImage(ImageSource src) async {
  final ImagePicker _imagePicker = new ImagePicker();
  XFile? xfile = await _imagePicker.pickImage(source: src);
  if (xfile != null) {
    return await xfile.readAsBytes();
  } else
    return null;
}

Uint8List? image;

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void SelectImage() async {
    Uint8List? img = await PickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  bool _checked = false;
  bool _hidePass1 = true;
  bool _hidePass2 = true;

  String _first_name = '';
  String _last_name = '';
  String _username = '';
  String _email = '';
  String _password_1 = '';
  String _password_2 = '';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'حاكي',
            style: TextStyle(fontSize: 22,  color: Colors.blue[900]),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logoo.png',
                      scale: 3.5,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Text(
                    //     'Hakki',
                    //     style: TextStyle(
                    //       fontSize: 40,
                    //       color: Colors.blue[600],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                Text(
                  'قم بإنشاء حساب',
                  style: TextStyle(
                      height: 1,
                      fontSize: 25,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w100),
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            image != null
                                ? CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 64,
                              backgroundImage: MemoryImage(image!),
                            )
                                : CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 64,
                              backgroundImage: AssetImage('assets/dummy.png')
                            ),
                            Positioned(
                              child: IconButton(
                                  onPressed: () {
                                    SelectImage();
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.blueAccent,
                                  )),
                              bottom: 5,
                              right: 0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _first_name = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.mail_outline,
                                      size: 18,
                                      color: Colors.blueAccent,
                                    )),
                                TextSpan(
                                  text: ' الإسم',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                )
                              ])),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _last_name = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.mail_outline,
                                      size: 18,
                                      color: Colors.blueAccent,
                                    )),
                                TextSpan(
                                  text: ' الإسم الأخير',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                )
                              ])),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.mail_outline,
                                      size: 18,
                                      color: Colors.blueAccent,
                                    )),
                                TextSpan(
                                  text: ' إسم المستخدم',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                )
                              ])),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _email = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[100],
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          //isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.mail_outline,
                                      size: 18,
                                      color: Colors.blueAccent,
                                    )),
                                TextSpan(
                                  text: ' البريد الإلكتروني',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                )
                              ])),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _password_1 = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey[100],
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            //isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                        Icons.lock_rounded,
                                        size: 18,
                                        color: Colors.blueAccent,
                                      )),
                                  TextSpan(
                                    text: ' الرقم السري',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        height: 1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100),
                                  )
                                ])),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePass1 = !_hidePass1;
                                  });
                                },
                                icon: Icon(_hidePass1
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: _hidePass1,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _password_2 = value; // Update email variable
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey[100],
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            //isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                        Icons.lock_rounded,
                                        size: 18,
                                        color: Colors.blueAccent,
                                      )),
                                  TextSpan(
                                    text: ' أعد كتابة الرقم السري',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        height: 1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ])),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePass2 = !_hidePass2;
                                  });
                                },
                                icon: Icon(_hidePass2
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        obscureText: _hidePass2,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: _checked,
                              onChanged: (value) {
                                setState(() {
                                  _checked = !_checked;
                                });
                              },
                              //checkColor: Colors.blueAccent,
                              //activeColor: Colors.red,
                              fillColor: MaterialStateProperty.all(
                                  _checked ? Colors.blueAccent : Colors.white),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                    width: 2.5, color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          Text(
                            '  أوافق علي الشروط',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'home');
                            },
                            //   if (_checked) {
                            //     registerAccount(
                            //         context,
                            //         _first_name,
                            //         _last_name,
                            //         _username,
                            //         _email,
                            //         _password_1,
                            //         _password_2,
                            //         image);
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //         content: Text(
                            //             'Please agree to the terms and conditions.'),
                            //         backgroundColor: Colors.red,
                            //         duration: Duration(
                            //             milliseconds: Constants.toast_time),
                            //       ),
                            //     );
                            //   }
                            // },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                Border.all(color: Colors.grey, width: 1.2),
                                color: Colors.blueAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 10),
                                child: Text(
                                  'قم بإنشاء حساب',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.values[5],
                  children: [
                    Text(
                      'تملك حساب؟',
                      style: TextStyle(fontSize: 22, color: Colors.blueAccent),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'signIn');
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                              fontSize: 22),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
