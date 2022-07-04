import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/articles/controllers/articles_controller.dart';
import 'package:turing/presentation/articles/screens/article_details/article_details_view.dart';
import 'package:turing/presentation/articles/screens/new_article/create_new_article_view.dart';
import 'package:turing/presentation/articles/widgets/article_item.dart';

class ArticlesViewBody extends StatelessWidget {
  ArticlesController controller = Get.put(ArticlesController());
  CollectionReference articlesRef =
      FirebaseFirestore.instance.collection("articles") ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, bottom: 0.0, top: 8.0),
              child: StreamBuilder(
                stream: articlesRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error happened'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                        child: const CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                    );
                  }
                  if (snapshot.hasData){
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index){
                        return articleItem(
                          onTap: (){
                            Get.to(() => const ArticleDetailsView(),
                              arguments:  {
                                'titleText': snapshot.data.docs[index].data()['title'],
                                'description': snapshot.data.docs[index].data()['desc'],
                                'likes': snapshot.data.docs[index].data()['likes'],
                                'author': snapshot.data.docs[index].data()['author'],
                              },


                              duration: const Duration(milliseconds: 500),
                              transition: Transition.rightToLeft,

                            );
                          },
                          title: snapshot.data.docs[index].data()['title'],
                          desc: snapshot.data.docs[index].data()['desc'],
                        );
                      },
                        separatorBuilder: (BuildContext context, int index){
                          return const SizedBox(
                            height:  10.0,
                          );
                        },
                        itemCount: snapshot.data.docs.length,
                    );
                  }
                  else{
                    return Center(child: Text('Failed to load articles'));
                  }
                },
              ),
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
          onPressed: () {
            Get.to(
              const CreateNewArticleView(),
              duration: const Duration(
                  milliseconds: 300), //duration of transitions, default 1 sec
              transition: Transition.downToUp,
            );
          }),
    );
  }
}

