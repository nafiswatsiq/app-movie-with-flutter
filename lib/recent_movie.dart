import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter/detail_movie.dart';
import 'package:submission_flutter/model/list_movie.dart';

class ListMovie extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left:16.0, right: 16.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Recent Movie',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/5,
              crossAxisSpacing: 14.0,
              mainAxisSpacing: 10.0
            ),
            itemBuilder: (context, index) {
              final DataMovie recentMovie = dataListRecentMovie[index];
              return InkWell(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailMovie(movie: recentMovie);
                    }));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Stack(
                            children: [
                              Image.network(recentMovie.imageThumb),
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
                                        recentMovie.rating,
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
                      
                      Container(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          recentMovie.title,
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
                    ],
                  ),
                ),
              );
            },
            itemCount: dataListRecentMovie.length,
            // children: dataListMovie.map((dataMovie) => RecentMovie(
            //   dataMovie.title,
            //   dataMovie.imageThumb,
            // )).toList(),
          ),
        ],
      ),
    );
  }
}

// class RecentMovie extends StatelessWidget{
//   final String title;
//   final String imageThumb;

//   RecentMovie(this.title, this.imageThumb);

//   @override 
//   Widget build(BuildContext context){
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 5.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Image.network(imageThumb),
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 6),
//             child: Text(
//               title,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               softWrap: false,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }