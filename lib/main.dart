import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_app_demo/take_pic.dart';

void main() {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void doBeforeTakePic() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man up'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            // Obtain a list of the available cameras on the device.
            final cameras = await availableCameras();

            print('cameras ========== $cameras');

            // Get a specific camera from the list of available cameras.
            final firstCamera = cameras.first;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakePictureScreen(camera: firstCamera),
              ),
            );
          },
          child: Text('You are not your history'),
        ),
      ),
    );
  }
}
