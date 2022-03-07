import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app_binding.dart';
import 'modules/screens/login/login_screen.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: 'Fito',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);

    var assetsImage = const AssetImage('images/homeScreen.jpg');
    var logoImage = const AssetImage(
        "images/Applogo.png"); //<- Creates an object that fetches an image.
    // var image = new Image(image: assetsImage, fit: BoxFit.contain);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(alignment: Alignment.topCenter, children: <Widget>[
              Container(
                  child: Image(
                    image: assetsImage,
                    fit: BoxFit.fill,
                  ),
                  height: heighOfScreen * 50,
                  width: widthOfScreen * 100,
                  color: Colors.white),
              ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Image(image: logoImage),
                ),
              )
            ]),
            Container(
              height: heighOfScreen * 40,
              color: const Color(0xFF324856),
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  children: const [
                    //SizedBox(height: 10,),
                    Text(
                      'Track Your Active Lifestyle',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text('', style: TextStyle(fontSize: 34,color: Colors.white,
                    //fontWeight: FontWeight.bold)),

                    Text('           ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough)),
                    Text('With goal a driven approach',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: const Center(
                          child: Text(
                        'GET STARTED',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                      height: heighOfScreen * 10,
                      width: widthOfScreen * 80,
                      color: const Color(0xFFd97d54)),
                  Container(
                    height: heighOfScreen * 10,
                    width: widthOfScreen * 20,
                    color: const Color(0xFFc4704b),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
