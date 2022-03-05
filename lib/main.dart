import 'package:flutter/material.dart';
// import 'package:track_app/BMI%20SCreen/bmi_screen.dart';
// import 'package:track_app/heightScreen/get_height.dart';
import 'package:track_app/screens/login/login_screen.dart';
// import 'package:track_app/AnimationUtils/animation_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    MediaQueryData screen = MediaQuery.of(context);

    var assetsImage = const AssetImage('images/homeScreen.jpg');
    var logoImage = const AssetImage(
        "images/Applogo.png"); //<- Creates an object that fetches an image.
    // var image = new Image(image: assetsImage, fit: BoxFit.contain);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                // Navigator.push(
                //   context,
                //  PageRouteBuilder(
                //     pageBuilder: (c, a1, a2) => LoginScreen(),
                //     transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                //     transitionDuration: Duration(milliseconds: 500),
                //   ),
                // );
                //Navigator.push(context, MyAnimationRoute(builder: (context) => new LoginScreen(),));
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
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
