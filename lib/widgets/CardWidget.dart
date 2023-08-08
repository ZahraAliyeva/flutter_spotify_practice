import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/details.dart';

class CardWidget extends StatelessWidget{

  final String imgUrl, title, briefDesc, desc;

  const CardWidget({super.key,
     required this.imgUrl,
     required this.briefDesc,
     required this.desc,
     required this.title,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => NewsDetailsPage(newsTitle: title, detailImage: imgUrl, desc: desc,)));
    }, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white)
      
    ),
    child:Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imgUrl,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Icon(Icons.broken_image_outlined),
                    ),
                  );
                },
              ),),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(title,
                    maxLines: 2,
                    style: const TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
                 fontWeight: FontWeight.w500),),
                ),
               Padding(
           padding: const EdgeInsets.all(6),
           child: Text(
             briefDesc,
             maxLines: 2,
             style: const TextStyle(color: Colors.black54, fontSize: 14),
           ),
         )
          ],
        ),
        ),
    );
  }

}