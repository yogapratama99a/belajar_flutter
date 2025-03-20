import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'data/api_provider.dart';
import 'model/popular_movies.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiProvider apiProvider = ApiProvider();
  late Future<PopularMovies> popularMovies;

  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    popularMovies = apiProvider.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: FutureBuilder<PopularMovies>(
        future: popularMovies,
        builder: (BuildContext context, AsyncSnapshot<PopularMovies> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.results.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.results.length,
              itemBuilder: (BuildContext context, int index) {
                var movie = snapshot.data!.results[index];
                return moviesItem(
                  poster: '$imageBaseUrl${movie.posterPath}',
                  title: movie.title,
                  date: movie.releaseDate,
                  voteAverage: movie.voteAverage.toString(),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(movie: movie),
                        fullscreenDialog:
                            true, // Menjadikan halaman detail sebagai modal
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No Movies Available'));
          }
        },
      ),
    );
  }

  Widget moviesItem({
    required String poster,
    required String title,
    required String date,
    required String voteAverage,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120,
                child: CachedNetworkImage(
                  imageUrl: poster,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, size: 14),
                          SizedBox(width: 5),
                          Text(date),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, size: 14, color: Colors.amber),
                          SizedBox(width: 5),
                          Text(voteAverage),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final Results movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 20),
            Text(
              movie.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Release Date: ${movie.releaseDate}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: ${movie.voteAverage}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            Text(
              'Overview:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(movie.overview),
          ],
        ),
      ),
    );
  }
}
