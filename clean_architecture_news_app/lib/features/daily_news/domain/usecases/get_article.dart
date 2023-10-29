import 'package:clean_architecture_news_app/core/resourses/data_state.dart';
import 'package:clean_architecture_news_app/core/usecases/use_cases.dart';
import 'package:clean_architecture_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/daily_news/domain/repasitory/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntities>>, void> {
  GetArticleUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<DataState<List<ArticleEntities>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
