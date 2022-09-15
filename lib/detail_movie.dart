import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter/color/palette.dart';
import 'package:submission_flutter/model/list_movie.dart';

class DetailMovie extends StatelessWidget{
  final DataMovie movie;
  DetailMovie({required this.movie});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kToDark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            // toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(117, 0, 0, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                FavoriteButton(),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(35), 
              child: Container(
                child: Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Palette.kToDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),

            ),
            pinned: true,
            backgroundColor: Palette.kToDark,
            expandedHeight: 600,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                movie.imageThumb,
                width: double.maxFinite,
                fit: BoxFit.cover,
                ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rating ${movie.rating}',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            movie.release,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.calendar_today,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            movie.duration,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.access_time_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool  isFavorite = false;
  @override 
  Widget build(BuildContext context){
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}