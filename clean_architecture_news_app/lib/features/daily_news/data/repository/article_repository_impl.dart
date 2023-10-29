import 'dart:io';

import 'package:clean_architecture_news_app/core/constants/constants.dart';
import 'package:clean_architecture_news_app/core/resourses/data_state.dart';
import 'package:clean_architecture_news_app/features/daily_news/data/data_sourses/remote/news_api_service.dart';
import 'package:clean_architecture_news_app/features/daily_news/data/models/article.dart';
import 'package:clean_architecture_news_app/features/daily_news/domain/repasitory/article_repository.dart';

import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl(this._newsApiService);
  final NewsApiService _newsApiService;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
