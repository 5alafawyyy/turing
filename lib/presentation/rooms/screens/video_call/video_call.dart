// import 'package:flutter/material.dart';
//
//
// class VideoCall extends StatefulWidget {
//
//   @override
//   State<VideoCall> createState() => _VideoCallState();
// }
//
// class _VideoCallState extends State<VideoCall> {
//
//   // Instantiate the client
//   final AgoraClient client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: "4ec3f5c965554bc48ffc2112d6fd9af7",
//       channelName: "turing",
//       // username: '${AuthController.instance.auth.currentUser?.displayName}',
//       tempToken: "0064ec3f5c965554bc48ffc2112d6fd9af7IADP59vPyK38cH6SiJYLLoolFkJXse0GDrziE9c2o3g/NKGr274AAAAAEABVqCrXkzHAYgEAAQCFMcBi",
//       uid: 1,
//     ),
//     enabledPermission: [
//       Permission.camera,
//       Permission.microphone,
//     ],
//   );
//
//
//   // Initialize the Agora Engine
//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }
//
//   void initAgora() async {
//     await client.initialize();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             AgoraVideoViewer(
//               client: client,
//               // layoutType: Layout.grid,
//               enableHostControls: true, // Add this to enable host controls
//             ),
//             AgoraVideoButtons(
//               client: client,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
