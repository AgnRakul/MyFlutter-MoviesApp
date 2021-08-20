import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../movie.dart';

class MovieDetialsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetialsThumbnail({Key? key, required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Icon(
              Icons.play_circle_sharp,
              size: 80,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetialsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetialsHeaderWithPoster({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Row(
        children: [
          MoviePoster(
            poster: movie.images[0].toString(),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: MovieDetialsHeader(
              movie: movie,
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius;
    borderRadius = BorderRadius.all(Radius.circular(10));
    return Container(
      child: Card(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetialsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetialsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, color: Colors.black),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 32,
          ),
        ),
        Text.rich(
          TextSpan(
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              children: <TextSpan>[
                TextSpan(text: movie.plot),
                TextSpan(
                  text: 'More...',
                  style: TextStyle(color: Colors.indigo),
                ),
              ]),
        ),
      ],
    );
  }
}

class MovieDetialsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetialsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [
        MovieField(field: "Cast", value: movie.actors),
        MovieField(field: "Directors", value: movie.director),
        MovieField(field: "Awards", value: movie.awards),
        MovieField(field: "Duration", value: movie.runtime),
        MovieField(field: "Rating", value: movie.imdbRating),
        MovieField(field: "Votes", value: movie.imdbVotes),
        MovieField(field: "ImdbID", value: movie.imdbID),
        MovieField(field: "MetaScore", value: movie.metascore),
        MovieField(field: "Language", value: movie.language),
        MovieField(field: "Released", value: movie.released),
        MovieField(field: "Response", value: movie.response),
        MovieField(field: "Rated", value: movie.rated),
        MovieField(field: "Writer", value: movie.writer),
      ]),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key? key, required this.field, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$field : ',
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetialsExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieDetialsExtraPosters({Key? key, required this.posters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'More Movie Posters'.toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
        ),
        Container(
          height: 280,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
              height: 4,
            ),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 260,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(posters[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
