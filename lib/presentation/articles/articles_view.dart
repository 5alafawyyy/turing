import 'package:flutter/material.dart';
import 'package:turing/presentation/articles/articles_view_body.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);
  static String id = '/articles';

  @override
  Widget build(BuildContext context) {
    return ArticlesViewBody();
  }
}
