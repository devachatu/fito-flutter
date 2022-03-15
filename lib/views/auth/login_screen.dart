import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image(
                  image: logoImage,
                )),
            color: const Color(0xFF324856),
            width: widthOfScreen * 100,
            height: heighOfScreen * 30,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Create a New Account',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('           ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough)),
                    Text('For the best experience with tractiv',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                  ]),
            ),
            color: const Color(0xFF324856),
            width: widthOfScreen * 100,
            height: heighOfScreen * 35,
          ),
          Container(
            child: Column(children: [
              TabBar(
                  tabs: [
                    SizedBox(
                      child: const Tab(child: Text('Sign Up')),
                      height: 50,
                      width: widthOfScreen * 36,
                    ),
                    SizedBox(
                      child: const Tab(child: Text('Log in')),
                      height: 50,
                      width: widthOfScreen * 36,
                    )
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: const Color(0xFFd97d54),
                  onTap: (index) {
                    if (index == 0) {
                    } else {}
                  },
                  isScrollable: true,
                  //padding: EdgeInsets.all(10.0),
                  controller: _controller),
              SizedBox(
                child: TabBarView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.GET_HEIGHT);
                          },
                          child: Container(
                            //color: Colors.amber,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFF324856),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'SIGN UP WITH EMAIL',
                                  style: TextStyle(color: Color(0xFF324856)),
                                )
                              ],
                            ),
                            height: 50,
                            width: widthOfScreen * 75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.GET_HEIGHT);
                          },
                          child: Container(
                            //color: Colors.amber,
                            child: const Center(
                                child: Text('SIGN UP WITH PHONE NUMBER',
                                    style: TextStyle(color: Colors.white))),
                            height: 50,
                            width: widthOfScreen * 75,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF324856).withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.GET_HEIGHT);
                            },
                            child: Container(
                              //color: Colors.amber,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.email_outlined,
                                    color: Color(0xFF324856),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'LOG IN WITH EMAIL',
                                    style: TextStyle(color: Color(0xFF324856)),
                                  )
                                ],
                              ),
                              height: 50,
                              width: widthOfScreen * 75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.GET_HEIGHT);
                            },
                            child: Container(
                              //color: Colors.amber,
                              child: const Center(
                                  child: Text('LOG IN WITH PHONE NUMBER',
                                      style: TextStyle(color: Colors.white))),
                              height: 50,
                              width: widthOfScreen * 75,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  controller: _controller,
                ),
                height: heighOfScreen * 25,
              )
            ]),
            color: const Color(0xFF324856),
            width: widthOfScreen * 100,
            height: heighOfScreen * 35,
          )
        ],
      ),
    );
  }
}
