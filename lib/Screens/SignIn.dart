
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Screen.dart';

class SignIn extends StatefulWidget {
  // const SignIn({super.key});
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _hidePass = true;
  bool _checked = false;

  String _email = '';
  String _password = '';


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'حاكي',
            style: TextStyle(fontSize: 22, color: Colors.blue[900]),
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
                        //     'فصاحة',
                        //     style: TextStyle(
                        //       fontSize: 40,
                        //       color: Colors.blue[600],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Text(
                      'تسجيل الدخول',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                borderSide: BorderSide(
                                    width: 1, color: Colors.blueAccent),
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
                                _password =
                                    value.trim(); // Update password variable
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
                                        _hidePass = !_hidePass;
                                      });
                                    },
                                    icon: Icon(_hidePass
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                            obscureText: _hidePass,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.values[3],
                            children: [
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
                                          _checked
                                              ? Colors.blueAccent
                                              : Colors.white),

                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(2.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                            (states) => BorderSide(
                                            width: 2.5,
                                            color: Colors.blueAccent),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '  تذكرني',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'نسيت الرقم السري',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blueAccent,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w100),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'screen');
                                },
                                // onTap:
                                // _login, // Call _login function when tapped

                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 1.2),
                                    color: Colors.blueAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 10),
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.values[3],
                            children: [
                              Text(
                                'لا تملك حساب؟',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueAccent),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'signUp');
                                  },
                                  child: Text(
                                    'قم بالتسجيل الان',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        decoration: TextDecoration.underline,
                                        fontSize: 20),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}