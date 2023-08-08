import 'package:flutter/material.dart';

class HashtagWidget extends StatelessWidget{
  final String HashtagText;

  const HashtagWidget({super.key, required this.HashtagText});

  @override
  Widget build(BuildContext context) {
     return ElevatedButton(onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 234, 197, 86)),
                    side: MaterialStateProperty.all(const BorderSide(width: 0.7, color: Colors.black)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)))
                  ),
                  child: Text(HashtagText, style: const TextStyle(color: Colors.black, fontSize: 15),),);
  }

}