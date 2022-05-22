import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/presentation/articles/screens/new_article/controllers/create_new_article_controller.dart';
import 'package:turing/core/widgets/custom_text_form_field.dart';

class CreateNewArticleBody extends StatelessWidget {
  CreateNewArticleBody({Key? key}) : super(key: key);

  CreateNewArticleController controller =
  Get.put(CreateNewArticleController());

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create New Article',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        shadowColor: kForegroundColor,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GetBuilder<CreateNewArticleController>(
                  builder: (controller) => Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        customTextFormField(
                          controller: controller.titleController,
                          keyboardType: TextInputType.text,
                          labelText: 'Article Title',
                          hintText: 'Ex. Flutter version 3',
                          color: kPrimaryColor,
                          fillColor: kLightColor,
                          errorColor: itemColor,
                          maxLine: 2,
                          validate: controller.validate,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        customTextFormField(
                          controller: controller.descController,
                          keyboardType: TextInputType.multiline,
                          labelText: 'Description',
                          hintText: 'Ex. This Article is about Flutter new release ',
                          color: kPrimaryColor,
                          fillColor: kLightColor,
                          errorColor: itemColor,
                          maxLine: 6,
                          minLine: 1,
                          validate: controller.validate,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          text: 'Publish',
                          textColor: kForegroundColor,
                          themeColor: kPrimaryColor,
                          onPressed: (){
                            controller.createArticle();

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
