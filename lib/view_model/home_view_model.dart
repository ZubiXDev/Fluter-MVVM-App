import 'package:bingo/data/response/api_response.dart';
import 'package:bingo/model/movies_model.dart';
import 'package:bingo/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
