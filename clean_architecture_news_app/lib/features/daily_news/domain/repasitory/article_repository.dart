import 'package:clean_architecture_news_app/core/resourses/data_state.dart';
import 'package:clean_architecture_news_app/features/daily_news/data/models/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleModel>>> getNewsArticles();
}
