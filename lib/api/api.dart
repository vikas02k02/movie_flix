import 'dart:convert';

import 'package:movie_flix/constants.dart';
import 'package:movie_flix/models/movie.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingUrl ='https://api.themoviedb.org/3/trending/movie/day?language=en-US&&api_key=${Constants.apiKey}';

  static const _topRatedUrl ='https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&&api_key=${Constants.apiKey}';

  static const _upcommingUrl ='https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=16&&api_key=${Constants.apiKey}';


  Future<List<Movie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode ==200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Error ');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode ==200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Error ');
    }
  }

  Future<List<Movie>> getUpcommingMovies() async{
    final response = await http.get(Uri.parse(_upcommingUrl));
    if(response.statusCode ==200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Error ');
    }
  }
}