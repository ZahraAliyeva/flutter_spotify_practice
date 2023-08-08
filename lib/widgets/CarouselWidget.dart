import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
  
  
class  CaroulselW extends StatelessWidget {
  final List imageList;
  final String imageText;

  const CaroulselW({super.key, 
  required this.imageList,
  required this.imageText});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
              items: [
                  
                for(var imageUrl in imageList)
                Stack(
                  children: [
                    Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                                       borderRadius:
                                           BorderRadius.circular(10),
                                       gradient: LinearGradient(colors: [
                                             Colors.black12.withOpacity(0),
                                             Colors.black
                                      ],
                                           begin: Alignment.topCenter,
                                           end: Alignment.bottomCenter)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child:Container(margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(imageText, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),),
                    ),
                  ),
                 
                  ),
                  ],
                )                
          ],
              
            //Slider Container properties
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
    );
  }
}