import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  const HomeRepoImpl(this.apiService);

  final String getFeaturedBooksEndPoint =
      'volumes?Filtering=free-ebooks&q=subject:science';

  // final String getNewestBooksEndPoint =
  //     'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science';

  final String getNewestBooksEndPoint = 'volumes?Sorting=newest&q=food';

  final String getSimilarBooksEndPoint =
      'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:sport';

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.getData(endPoint: getFeaturedBooksEndPoint);
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(endPoint: getNewestBooksEndPoint);
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilartBooks(
      {required String category}) async {
    try {
      var data = await apiService.getData(endPoint: getSimilarBooksEndPoint);
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
