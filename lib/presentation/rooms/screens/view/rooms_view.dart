import 'package:flutter/material.dart';
import 'package:turing/presentation/rooms/screens/view/rooms_view_body.dart';


class RoomsView extends StatelessWidget {
  const RoomsView({Key? key}) : super(key: key);
  static String id = '/rooms';

  @override
  Widget build(BuildContext context) {
    return RoomsViewBody();
  }
}
