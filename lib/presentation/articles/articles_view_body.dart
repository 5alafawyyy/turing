import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/articles/screens/new_article/create_new_article_view.dart';
import 'package:turing/presentation/articles/widgets/list_of_articles.dart';

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 0.0, top: 8.0),
              child: articleList(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        tooltip: 'add new article',
        label: const Text('add'),
        icon: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        foregroundColor: kBackgroundColor,
        onPressed: (){
          Get.to(
            const CreateNewArticleView(),
            duration: const Duration(seconds: 1), //duration of transitions, default 1 sec
            transition: Transition.downToUp,
          );
        },
      ),
    );
  }
}
