import 'package:bingo/data/network/base_api_services.dart';
import 'package:bingo/data/network/network_api_services.dart';
import 'package:bingo/model/movies_model.dart';
import 'package:bingo/resources/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  static double averageRatings(List<int> rating) {
    var avgRating = 0;

    for (int i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }

    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }

  Future<MoviesModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrls.moviesApiUrl);
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
