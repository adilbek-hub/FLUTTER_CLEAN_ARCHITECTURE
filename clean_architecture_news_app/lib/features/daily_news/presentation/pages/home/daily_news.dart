import 'package:clean_architecture_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_architecture_news_app/features/daily_news/presentation/widgets/article_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }
}

_buildAppbar() {
  return AppBar(
    title: const Text('Daily News'),
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
    builder: (context, state) {
      if (state is RemouteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemouteArticlesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemouteArticlesDone) {
        return ListView.builder(itemBuilder: (context, index) {
          return ArticleWidget(
            articles: state.articles![index],
          );
        });
      } else {
        throw ('BLABLABLAAAA');
      }
    },
  );
}
