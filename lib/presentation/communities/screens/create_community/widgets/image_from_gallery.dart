// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:turing/core/utils/styles.dart';
// import 'package:turing/presentation/communities/screens/create_community/controllers/create_new_community_controller.dart';
//
// class ImageFromGalleryEx extends StatelessWidget {
//   CreateNewCommunityController controller =
//       Get.put(CreateNewCommunityController());
//
//   ImageFromGalleryEx(type, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(controller.type == ImageSourceType.camera
//             ? "Image from Camera"
//             : "Image from Gallery"),
//       ),
//       body: Column(
//         children: <Widget>[
//           const SizedBox(
//             height: 52,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: controller.imageGetter,
//               child: GetBuilder<CreateNewCommunityController>(
//                 builder: (controller) => Container(
//                   width: 200,
//                   height: 200,
//                   decoration: const BoxDecoration(color: kSecondaryColor),
//                   child: controller.image != null
//                       ? Image.file(
//                           controller.image,
//                           width: 200.0,
//                           height: 200.0,
//                           fit: BoxFit.cover,
//                         )
//                       : Container(
//                           decoration: const BoxDecoration(color: kSecondaryColor),
//                           width: 200,
//                           height: 200,
//                           child: const Icon(
//                             Icons.camera_alt,
//                             color: kForegroundColor,
//                           ),
//                         ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
