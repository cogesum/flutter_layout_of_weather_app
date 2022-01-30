// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Weather",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "SupermercadoOne",
                fontSize: 30,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              color: Colors.grey,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                color: Colors.grey[500],
              )
            ],
          ),
          body: _buildBody()),
    );
  }
}

Widget _buildBody() {
  return Container(
    margin: EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Column(
        children: [
          _headerImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _temperatureForecast(),
                  Divider(),
                  _footerRating(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        'https://68.mchs.gov.ru/uploads/resize_cache/news/2021-02-04/5-fevralya-v-tambove-i-oblasti-ozhidaetsya-peremenchivaya-pogoda-s-vetrom-tumanom-i-osadkami_1612441599888233583__2000x2000.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Text(
        "Suturday - January 26",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
          "Align the source within the target box (by default, centering) and discard any portions of the source that lie outside the box.")
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "-5° С Snowy",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Canada is the best country in thr world!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°С',
          style: TextStyle(fontSize: 15),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade200,
      );
    }),
  );
}

Row _footerRating() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('info with openweathermap.org'),
      Row(
        children: List.generate(
          5,
          (int index) {
            return Icon(
              Icons.star,
              color: (index < 3 ? Colors.yellow : Colors.black),
              size: 15,
            );
          },
        ),
      )
    ],
  );
}
