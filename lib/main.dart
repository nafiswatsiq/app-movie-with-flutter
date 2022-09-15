import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter/color/palette.dart';
import 'package:submission_flutter/hot_movie.dart';
import 'package:submission_flutter/model/list_movie.dart';
import 'package:submission_flutter/model/list_slider.dart';
import 'package:submission_flutter/recent_movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Palette.kToDark,
      appBar: AppBar(
        title: Text(
          'Cinema 26',
          style: TextStyle(
            fontFamily: 'Parisienne',
            fontSize: 35,
            color: Color.fromARGB(255, 255, 174, 0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
            items: slider.map<Widget>((i) {
              return Builder(
                builder: (BuildContext contex) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    // width: MediaQuery.of(contex).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              // height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 7,
              autoPlayInterval: Duration(seconds: 7),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.85,
            ),
          ),
          HotMovie(),
          ListMovie(),
          ],
        ),
      ),
    );
  }
}
