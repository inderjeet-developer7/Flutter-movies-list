// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies_app/Models/MovieData.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key, required this.movieData}) : super(key: key);
  final Movie movieData;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111820),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.movieData.thumbnail.toString().replaceAll('thumb/', 'medium/'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                widget.movieData.name.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Visibility(
                visible: (widget.movieData.description.toString().isEmpty ||
                    widget.movieData.description.toString() == null)
                    ? false
                    : true,
                child: Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'The Plot',
                style: TextStyle(
                    color: Color(0xff2877A7),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )),
            Visibility(
                visible: (widget.movieData.description.toString().isEmpty ||
                    widget.movieData.description.toString() == null)
                    ? false
                    : true,
                child: Padding(
              padding: EdgeInsets.only(top: 8.0, left: 16.0),
              child: Text(
                widget.movieData.description.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0),
              child: Column(
                children: [
                  Visibility(
                    visible: (widget.movieData.year.toString().isEmpty ||
                        widget.movieData.year.toString() == null)
                        ? false
                        : true,
                    child: Row(
                      children: [
                        Text('Year : ',
                            style: TextStyle(
                              color: Color(0xff2877A7),
                              fontSize: 16,
                            )),
                        Text(widget.movieData.year.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: (widget.movieData.mainStar.toString().isEmpty ||
                        widget.movieData.mainStar.toString() == null)
                        ? false
                        : true,
                    child: Row(
                      children: [
                        Text('Main Star : ',
                            style: TextStyle(
                              color: Color(0xff2877A7),
                              fontSize: 16,
                            )),
                        Text(widget.movieData.mainStar.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: (widget.movieData.director.toString().isEmpty ||
                            widget.movieData.director.toString() == null)
                        ? false
                        : true,
                    child: Row(
                      children: [
                        Text('Director : ',
                            style: TextStyle(
                              color: Color(0xff2877A7),
                              fontSize: 16,
                            )),
                        Text(widget.movieData.director.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: (widget.movieData.genres.toString().isEmpty ||
                        widget.movieData.genres.toString() == null)
                        ? false
                        : true,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Genre : ',
                            style: TextStyle(
                              color: Color(0xff2877A7),
                              fontSize: 16,
                            )),
                        SizedBox(
                          height: 18,
                          child : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.movieData.genres.length,
                                itemBuilder: (context, index) {
                                  return Text('${widget.movieData.genres[index]}, ', style: TextStyle(color: Colors.grey, fontSize: 16),);
                                },
                              ) ,
                        )
                        // SizedBox(
                        //   height: 50,
                        //   child: ListView.builder(
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: widget.movieData.genres.length,
                        //     itemBuilder: (context, index) {
                        //       return Text('${widget.movieData.genres[index]}, ', style: TextStyle(color: Colors.grey, fontSize: 16),);
                        //     },
                        //   ) ,
                        // )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
