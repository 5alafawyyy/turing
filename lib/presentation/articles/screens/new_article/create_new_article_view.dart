import 'package:flutter/material.dart';
import 'package:turing/presentation/articles/screens/new_article/create_new_article_body.dart';

class CreateNewArticleView extends StatelessWidget {
  const CreateNewArticleView({Key? key}) : super(key: key);
  static String id = '/CreateNewArticleView';

  @override
  Widget build(BuildContext context) {
    return CreateNewArticleBody();
  }
}
