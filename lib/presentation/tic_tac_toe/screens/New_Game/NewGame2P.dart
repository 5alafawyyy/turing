import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import '../../widgets/button.dart';
import '../../game_view.dart';

class NewGameTwoPlayers extends StatefulWidget {
  bool OHTurn = true;
  NewGameTwoPlayers({Key? key, required this.OHTurn}) : super(key: key);

  @override
  State<NewGameTwoPlayers> createState() => _NewGameTwoPlayersState();
}

class _NewGameTwoPlayersState extends State<NewGameTwoPlayers> {
  List<String> XOText = ['', '', '', '', '', '', '', '', ''];
  // bool OTurn=true ;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes =
      0; //deh 3ashan a3ed kam box w ana bl3b w awel ma awsl Ll 9 box yb2a Draw

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Player X',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  letterSpacing: 3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                xScore.toString(),
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  letterSpacing: 3,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Player O',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  letterSpacing: 3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                oScore.toString(),
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  letterSpacing: 3,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyButton(
                    text: "Turn : ${widget.OHTurn ? 'O' : 'X'}",
                    onTap: () {},
                    bottomPadding: 30,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        // crossAxisSpacing: 4.0,
                        // mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            _ClickToPlay(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: kPrimaryColor,
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  XOText[index],
                                  style: TextStyle(
                                      fontSize: 50,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: kPrimaryColor,
                        onPressed: _clearScoreBoard,
                        child: const Icon(
                          Icons.restart_alt_outlined,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        backgroundColor: kPrimaryColor,
                        onPressed: () {
                          Get.back();
                          Get.back();

                        },
                        child: const Icon(
                          Icons.home,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.clear_outlined, color: kPrimaryColor),
              onPressed: () => Get.back(),
            ),
          ],
        ),
    );
  }

  void _ClickToPlay(int index) {
    setState(() {
      if (widget.OHTurn && XOText[index] == '') {
        XOText[index] = 'O';
        filledBoxes++;
      } else if (!widget.OHTurn && XOText[index] == '') {
        XOText[index] = 'X';
        filledBoxes++;
      }
      widget.OHTurn = !widget.OHTurn;
      _CheckWinner();
    });
  }

  void _CheckWinner() {
    if (XOText[0] == XOText[1] && XOText[0] == XOText[2] && XOText[0] != '') {
      _showWinDialog(XOText[0]);
    }
    if (XOText[3] == XOText[4] && XOText[3] == XOText[5] && XOText[3] != '') {
      _showWinDialog(XOText[3]);
    }
    if (XOText[6] == XOText[7] && XOText[6] == XOText[8] && XOText[6] != '') {
      _showWinDialog(XOText[6]);
    }

    // Checking Column
    if (XOText[0] == XOText[3] && XOText[0] == XOText[6] && XOText[0] != '') {
      _showWinDialog(XOText[0]);
    }
    if (XOText[1] == XOText[4] && XOText[1] == XOText[7] && XOText[1] != '') {
      _showWinDialog(XOText[1]);
    }
    if (XOText[2] == XOText[5] && XOText[2] == XOText[8] && XOText[2] != '') {
      _showWinDialog(XOText[2]);
    }

    // Checking Diagonal
    if (XOText[0] == XOText[4] && XOText[0] == XOText[8] && XOText[0] != '') {
      _showWinDialog(XOText[0]);
    }
    if (XOText[2] == XOText[4] && XOText[2] == XOText[6] && XOText[2] != '') {
      _showWinDialog(XOText[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                  " ${winner} is Winner 🥳",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
            actions: [
              TextButton(
                child:
                    Text(
                        "Play Again",
                        style: TextStyle(
                            color: Colors.teal,
                        ),
                    ),
                onPressed: () {
                  _clearBoard();
                  Get.back();
                },
              )
            ],
          );
        });
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                  "Draw",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
            actions: [
              TextButton(
                child:
                    Text(
                        "Play Again",
                        style: TextStyle(
                            color: Colors.teal,
                        ),
                    ),
                onPressed: () {
                  _clearBoard();
                  Get.back();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        XOText[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        XOText[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
