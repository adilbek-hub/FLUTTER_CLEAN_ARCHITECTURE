// ignore_for_file: depend_on_referenced_packages

import 'package:clean_architecture_news_app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntities>? articles;
  final DioError? error;
  const RemoteArticleState({this.articles, this.error});
  @override
  List<Object> get props => [articles!, error!];
}

class RemouteArticlesLoading extends RemoteArticleState {
  const RemouteArticlesLoading();
}

class RemouteArticlesDone extends RemoteArticleState {
  const RemouteArticlesDone(List<ArticleEntities> article)
      : super(articles: article);
}

class RemouteArticlesError extends RemoteArticleState {
  const RemouteArticlesError(DioError error) : super(error: error);
}
