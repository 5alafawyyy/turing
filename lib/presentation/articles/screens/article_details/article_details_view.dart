import 'package:flutter/material.dart';
import 'package:turing/presentation/articles/screens/article_details/article_details_body.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({Key? key}) : super(key: key);
  static String id = '/ArticleDetailsBody';

  @override
  Widget build(BuildContext context) {
    return ArticleDetailsBody();
  }
}
