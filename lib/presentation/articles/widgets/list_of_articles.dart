import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turing/presentation/articles/screens/article_details/article_details_view.dart';
import 'package:turing/presentation/articles/widgets/article_item.dart';

Widget articleList (){

  return ListView.separated(
      itemBuilder: (BuildContext context, int index){
        return articleItem(
          onTap: (){
            Get.to(
                  () => const ArticleDetailsView(),
              arguments:  {
                    'imgUrl': 'assets/images/flutter.jpg',
                'titleText': 'Flutter 3 is live',
                'description': 'This version includes many exciting changes'
                    ' including an overall simplification of the API'
                    ' as well as many of the underlying native improvements'
                    ' and bug fixes.'
                    '\n\n'
                    'Some key changes already in Beta: Better'
                    ' notification control while app is in foreground Part of'
                    ' OneSignal initialization is now done for you automatically.'
                    '\n\n'
                    'Simply set the app id to complete the process.'
                    'Why you should start migrating now Most importantly,'
                    ' we want to give you the opportunity to voice your'
                    ' opinion and provide feedback so that we can make '
                    'changes as needed to better suit your implementation.'
                    '\n\n'
                    'Furthermore, it is always beneficial to get a head'
                    ' start on migrating your implementation to ensure a'
                    ' smooth transition.'
                    '\n\n'
                    'As we continue improving OneSignal,'
                    ' being fully migrated to the latest version of the SDK'
                    ' will help minimize potential issues and ensure you can'
                    ' focus on providing value to your customers, improving '
                    'your business, and creating a delightful messaging experience.',},

                  duration: const Duration(milliseconds: 800), //duration of transitions, default 1 sec
                  transition: Transition.rightToLeft,

            );
          },
          imgUrl: 'assets/images/flutter.jpg',
          titleText: 'Flutter 3 is live',
          description: 'This version includes many exciting changes'
              ' including an overall simplification of the API'
              ' as well as many of the underlying native improvements'
              ' and bug fixes.Some key changes already in Beta: Better'
              ' notification control while app is in foreground Part of'
              ' OneSignal initialization is now done for you automatically.'
              ' Simply set the app id to complete the process.'
              'Why you should start migrating now Most importantly,'
              ' we want to give you the opportunity to voice your'
              ' opinion and provide feedback so that we can make '
              'changes as needed to better suit your implementation.'
              'Furthermore, it is always beneficial to get a head'
              ' start on migrating your implementation to ensure a'
              ' smooth transition. As we continue improving OneSignal,'
              ' being fully migrated to the latest version of the SDK'
              ' will help minimize potential issues and ensure you can'
              ' focus on providing value to your customers, improving '
              'your business, and creating a delightful messaging experience.',
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return const SizedBox(
          height:  10.0,
        );
      },
      itemCount: 30,
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    scrollDirection: Axis.vertical,
  );
}