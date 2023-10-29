import 'package:clean_architecture_news_app/core/resourses/data_state.dart';
import 'package:clean_architecture_news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemouteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemouteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemouteArticlesError(dataState.error!));
    }
    if (state is DataFailed) {
      print(dataState.error!.message);
      return emit(
        RemouteArticlesError(dataState.error!),
      );
    }
  }
}
