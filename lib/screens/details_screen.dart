import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_flix/colors.dart';
import 'package:movie_flix/constants.dart';
import 'package:movie_flix/models/movie.dart';
import 'package:movie_flix/widgets/back_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBtn(),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 400,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  '${Constants.imagePath}${movie.backdropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    "Overview",
                    style: GoogleFonts.belleza(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    movie.overview,
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child:Column(
                      
                      children: [
                      Container(
                        width: 230,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Release date: ',
                              style: GoogleFonts.roboto(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(movie.releaseDate,style: GoogleFonts.roboto(fontSize: 17,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,
                      width: 10,),
                      Container(
                        width: 230,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text('Rating: ',style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                          ),),
                          const Icon(Icons.star,color: Colors.amber),
                          Text('${movie.voteAverage.toStringAsFixed(1)}/10'),
                        ],
                      ),
                      
                      )
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}


