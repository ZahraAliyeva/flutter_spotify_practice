import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:flutter_sound/public/tau.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final recorder = FlutterSoundRecorder();
  bool isRecording = false;

  @override
  void initState() {
    initRecorder();
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }
  String _fileName = "audio";
  String _fileExtension = '.mp3';
  String _path = "C:/document";


  void initRecorder() async{
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw 'Exception';
    }
    await recorder.openRecorder();
    isRecording = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  // Future record() async{
  //   await recorder.startRecorder(toFile: '$_fileName/$_path$_fileExtension');
  // }

  // Future stop() async{
  //   // if(!isRecording) return;

  //   final filePath = await recorder.stopRecorder();
  //   final file = File(filePath!);
  //   // await recorder.stopRecorder();
  //   print('Recorded file path: $filePath');
  // }

  FlutterSound flutterSound = new FlutterSound();

  Future stop() async{
    // if(!isRecording) return;

    final filePath = await recorder.stopRecorder();
    final file = File(filePath!);
    // await recorder.stopRecorder();
    print('Recorded file path: $filePath');
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   scaffoldBackgroundColor: Colors.white,
      //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //     backgroundColor: Colors.black,
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white30,
      //     selectedLabelStyle: TextStyle(fontSize: 17.0),
      //     unselectedLabelStyle: TextStyle(fontSize: 14.0,),
      //   ),
      // ),
      home: Scaffold(
        appBar: AppBar(
        title: const Text("AUDIO"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 93, 93, 92),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              StreamBuilder <RecordingDisposition>(
                stream: recorder.onProgress,
                builder: (context, snapshot){    
                  final duration = snapshot.hasData
                      ? snapshot.data!.duration
                      : Duration.zero;

                      String twoDigits(int n) => n.toString().padLeft(2, '0');

                      final minutes = twoDigits(duration.inMinutes.remainder(60));
                      final seconds = twoDigits(duration.inSeconds.remainder(60));

                      return Text('$minutes : $seconds', style: TextStyle(fontSize: 50),);
                }),
                const SizedBox(height: 32,),
           ElevatedButton(onPressed: () async{
            if(recorder.isRecording){
              await stop();
            } else {
              // record();
            }
            setState(() {});
          }, 
          child: Icon( 
            recorder.isRecording ? Icons.stop : Icons.mic,
            size: 80,
          ))
       ], 
       ),
          ), 
      ),

    );
  }

}
