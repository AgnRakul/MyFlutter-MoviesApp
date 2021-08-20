import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'movie.dart';
import 'movie/movie_ui.dart';

void main() {
  runApp(MaterialApp(home: MoviesApp()));
}

class MoviesApp extends StatelessWidget {
  late final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.grey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, int index) {
          return Stack(
            children: [
              Positioned(
                child: movieCard(movieList[index], context),
              ),
              Positioned(
                top: 10,
                child: movieImage(movieList[index].images[0]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: EdgeInsets.only(top: 4, bottom: 8, left: 54, right: 8),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(movie.title,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      Text(
                        "Rating ${movie.imdbRating} / 10",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${movie.runtime}",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        movie.rated,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MovieListView(movieName: movie.title, movie: movie),
          ),
        );
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}

class MovieListView extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListView({Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text(movie.title),
            backgroundColor: Colors.blueGrey.shade900),
        body: ListView(
          children: [
            MovieDetialsThumbnail(
              thumbnail: movie.images[0],
            ),
            MovieDetialsHeaderWithPoster(movie: movie),
            HorizontalLine(),
            MovieDetialsCast(movie: movie),
            HorizontalLine(),
            MovieDetialsExtraPosters(
              posters: movie.images,
            )
          ],
        ),
      ),
    );
  }
}
