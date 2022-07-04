// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:turing/presentation/articles/controllers/articles_controller.dart';
// import 'package:turing/presentation/articles/screens/article_details/article_details_view.dart';
// import 'package:turing/presentation/articles/widgets/article_item.dart';
//
// Widget articleList (){
//
//   ArticlesController controller = Get.put(ArticlesController());
//   return ListView.separated(
//       itemBuilder: (BuildContext context, int index){
//         return articleItem(
//           onTap: (){
//             Get.to(() => const ArticleDetailsView(),
//               arguments:  {
//                 'titleText': controller.articles[index]['title'],
//                 'description': controller.articles[index]['desc'],
//                 'likes': controller.articles[index]['likes'],
//                 'author': controller.articles[index]['author'],
//               },
//
//
//               duration: const Duration(milliseconds: 800),
//               transition: Transition.rightToLeft,
//
//             );
//
//           },
//           title: controller.articles[index]['title'],
//           desc: controller.articles[index]['desc'],
//         );
//       },
//       separatorBuilder: (BuildContext context, int index){
//         return const SizedBox(
//           height:  10.0,
//         );
//       },
//       itemCount: controller.articlesLength,
//     keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//     scrollDirection: Axis.vertical,
//   );
// }