
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter/detail_movie.dart';
import 'package:submission_flutter/model/list_movie.dart';

class HotMovie extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Hot Movie',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )
              ),
              Icon(Icons.local_fire_department_sharp,
                color: Colors.red,
              ),
            ],
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final DataMovie movie = dataListMovie[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailMovie(movie: movie);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Stack(
                              children: [
                                Image.network(movie.imageThumb),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color.fromARGB(131, 255, 153, 0),
                                      border: Border.all(
                                        color: Colors.orange,
                                        width: 2
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          movie.rating,
                                          style: TextStyle(
                                            fontSize: 14, 
                                            color: Colors.white),
                                        ),
                                        Icon(Icons.star,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              width: 160.0,
                              child:  Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ); 
              },
              itemCount: dataListMovie.length,
            ),
          ),
        ],
      ),
    );
  }
}