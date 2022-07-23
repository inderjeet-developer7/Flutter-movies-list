import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_app/Models/MovieData.dart';

import 'Util/api_service.dart';
import 'Screens/MovieDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   MovieData? movieDataFinal;
  MovieData? movieData ;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    movieDataFinal = (await ApiService().getData())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      if (movieDataFinal != null){
            movieData = movieDataFinal;
            setState(() {

            });
          }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111820),
      body: SafeArea(child:
      movieData == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Movie App', style: const TextStyle(color: const Color(0xff2877A7), fontSize: 28, fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 12, crossAxisSpacing: 12,
                mainAxisExtent: 300,
              childAspectRatio: 0.675),
              itemCount: movieData!.data.movies.length,
              itemBuilder: (BuildContext content, index) {
                return
                  GestureDetector(
                    onTap: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => MovieDetail(movieData: movieData!.data.movies[index],),
                    ),
                    )
                    },
                    child: Card(
                      color: const Color(0xff1C242B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                      child:  FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                          placeholder: 'assets/noimage.png',
                          image:movieData!.data.movies[index].thumbnail.toString().replaceAll('thumb/', 'medium/')
                      ),
                      // Image.network(movieData!.data.movies[index].thumbnail.toString().replaceAll('thumb', 'medium'), fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( top: 8.0, left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(movieData!.data.movies[index].name.toString(), style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),),
                          Text(movieData!.data.movies[index].year.toString(), style: const TextStyle(color: Colors.grey, fontSize: 16),)
                        ],
                      ),
                    )

                      ],
                    ),
                ),
                  );
              },
            ),
          ),
            ],
        ),
      ))

    );
  }
}
