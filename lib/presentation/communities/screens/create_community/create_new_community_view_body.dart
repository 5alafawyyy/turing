import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/presentation/communities/screens/create_community/controllers/create_new_community_controller.dart';
import 'package:turing/core/widgets/custom_text_form_field.dart';
import 'package:turing/presentation/communities/screens/create_community/widgets/pick_image.dart';

class CreateCommunityViewBody extends StatelessWidget {
  CreateCommunityViewBody({Key? key}) : super(key: key);


  String text = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewCommunityController>(
      init: CreateNewCommunityController(),
      builder: (controller) =>ModalProgressHUD(
        color: kPrimaryColor,
        progressIndicator: CircularProgressIndicator(
            color: kPrimaryColor,
        ),
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Create New Community',
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
                const PickImage(),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GetBuilder<CreateNewCommunityController>(
                      builder: (controller) => Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Opened',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Switch(
                                  value: controller.isSwitch,
                                  onChanged: controller.changeSwitch,
                                  activeTrackColor: kForegroundColor,
                                  activeColor: kPrimaryColor,
                                ),
                                Text(
                                  'Closed',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            customTextFormField(
                              controller: controller.titleController,
                              keyboardType: TextInputType.text,
                              labelText: 'Community Name',
                              hintText: 'ex. 5allaf Community',
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
                              hintText: 'This community is for fourth year in CS ',
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
                              text: 'Finish',
                              textColor: kForegroundColor,
                              themeColor: kPrimaryColor,
                              onPressed: controller.createCommunity,
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
        ),
      ),
    );
  }
}
//Container(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//
//
//                   const Center(
//                     child: Text(
//                       "TextFormField In Flutter",
//                       style: TextStyle(fontSize: 24),
//                     ),
//                   ),

//                   Container(
//                     margin: const EdgeInsets.all(15),
//                     child: TextFormField(
//                       controller: userInput,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       onChanged: (value) {
//                         // setState(() {
//                           userInput.text = value.toString();
//                         // });
//                       },
//                       decoration: InputDecoration(
//                         focusColor: Colors.white,
//                         //add prefix icon
//                         prefixIcon: const Icon(
//                           Icons.person_outline_rounded,
//                           color: Colors.grey,
//                         ),
//
//                         errorText: "Error",
//
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           const BorderSide(color: Colors.blue, width: 1.0),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         fillColor: Colors.grey,
//
//                         hintText: "Email/Mobile",
//
//                         //make hint text
//                         hintStyle: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontFamily: "verdana_regular",
//                           fontWeight: FontWeight.w400,
//                         ),
//
//                         //create lable
//                         labelText: 'Email/Mobile',
//                         //lable style
//                         labelStyle: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontFamily: "verdana_regular",
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(userInput.toString()),
//                 ],
//               ),
//             ),
