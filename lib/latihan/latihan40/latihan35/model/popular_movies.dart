class PopularMovies {
  late int page;
  late int totalResults;
  late int totalPages;
  late List<Results> results;

  PopularMovies({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  PopularMovies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    results = (json['results'] as List).map((v) => Results.fromJson(v)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'total_results': totalResults,
      'total_pages': totalPages,
      'results': results.map((v) => v.toJson()).toList(),
    };
  }
}

class Results {
  late double popularity;
  late double voteAverage;
  late int voteCount;
  late int id;
  late List<int> genreIds;
  late bool video;
  late bool adult;
  late String posterPath;
  late String backdropPath;
  late String originalLanguage;
  late String originalTitle;
  late String title;
  late String overview;
  late String releaseDate;

  Results({
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.id,
    required this.genreIds,
    required this.video,
    required this.adult,
    required this.posterPath,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });

  Results.fromJson(Map<String, dynamic> json) {
    popularity = (json['popularity'] ?? 0).toDouble();
    voteAverage = (json['vote_average'] ?? 0).toDouble();
    voteCount = json['vote_count'] ?? 0;
    id = json['id'] ?? 0;
    genreIds = (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList();
    video = json['video'] ?? false;
    adult = json['adult'] ?? false;
    posterPath = json['poster_path'] ?? '';
    backdropPath = json['backdrop_path'] ?? '';
    originalLanguage = json['original_language'] ?? '';
    originalTitle = json['original_title'] ?? '';
    title = json['title'] ?? '';
    overview = json['overview'] ?? '';
    releaseDate = json['release_date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'id': id,
      'genre_ids': genreIds,
      'video': video,
      'adult': adult,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
    };
  }
}
