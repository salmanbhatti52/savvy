import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/controllers/screen_six_controller/selected_sds_list.dart';
import 'package:savvy/screens/dialouges/dialog_controller/detail_dialogs.dart';
import 'package:savvy/screens/dialouges/dialog_controller/info_dialogs.dart';
import 'package:savvy/screens/dialouges/info_dialog.dart';
import 'package:savvy/screens/dialouges/reuseabel_info_dialog.dart';
import 'package:savvy/screens/post_page_view_screens/chosed_goals_Screen.dart';
import 'package:savvy/services/api_services.dart';
import 'package:savvy/utils/pgviewscreensixutils/Sc_six_utils.dart';

import '../../common/widgets/custom_button.dart';
import '../../models/sdgs_models/sdgs_list.dart';
import '../../utils/color_constants.dart';
import '../post_page_view_screens/selected_screen.dart';

class PageViewScreenSix extends StatefulWidget {
  const PageViewScreenSix({super.key});

  @override
  State<PageViewScreenSix> createState() => _PageViewScreenSixState();
}

class _PageViewScreenSixState extends State<PageViewScreenSix> {
  // int itemsAdded = 0;
  //bool isNotUndo = true;
  InfoDialog infoDialog = InfoDialog();
  DetailDialogs detailDialogs = DetailDialogs();
  InfoDialogs info = InfoDialogs(detailDialogs: DetailDialogs());
  List<ReuseableDialog> infoDialogs = [];
  int itemCount = 0;
  List<SdgsList> list = [];
  ScSixUtils isDragged = ScSixUtils();
  final ApiServices _apiServices = ApiServices();
  List<SdgsList> selectedList = [];
  final sdgListController = Get.put(SdgsListController());

  @override
  void initState() {
    // print('init state is called');
    super.initState();
    getSdgs();
  }

  getSdgs() async {
    list = await _apiServices.getAllSdgs();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    infoDialogs = info.getInfoDialogList(context, size);
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: headingText(size),
              ),
              SizedBox(
                height: size.height * 0.009,
              ),
              Flexible(
                flex: 15,
                child: Column(
                  children: [
                    Expanded(
                      flex: 14,
                      child: imageColunm(size, context),
                    ),
                    Expanded(flex: 2, child: actionButtons(size, context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButtons(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: SizedBox(
              child: MyButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  radius: size.height * 0.04,
                  color: ColorConstants.introPageTextColor,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'BACK',
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
          Flexible(
            child: SizedBox(
              child: MyButton(
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SelectedScreen();
                      },
                    ));
                  },
                  radius: size.height * 0.04,
                  color: ColorConstants.buttonColor,
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  spreadRadius: 2,
                  child: Text(
                    'NEXT',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: size.height * 0.020),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  headingText(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            'Click on the cards below to read through the Sustainable development goals. Then drop your\ntop 5 goals into the basket below!',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: size.height * 0.017),
          ),
        ),
      ],
    );
  }

  Widget imageColunm(Size size, BuildContext context) {
    var space = size.height * 0.009;
    var elevation = 1.0;

    return Column(
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 1,
                  child: Draggable(
                    onDragCompleted: () {
                      setState(() {
                        isDragged.goal1 = false;
                        itemCount++;
                        sdgListController.addSdgs(list[0]);

                        //  print('onDragged Completed');
                      });
                    },
                    feedback: Card(
                      child: Image.asset(r'assets/images/pgsixcompnent1.png'),
                    ),
                    child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return infoDialogs[0];
                            },
                          );
                        },
                        child: Card(
                            elevation: elevation,
                            child: isDragged.goal1
                                ? Image.asset(
                                    r'assets/images/pgsixcompnent1.png')
                                : InkWell(
                                    onTap: () => setState(() {
                                          isDragged.goal1 = true;
                                          itemCount--;
                                          sdgListController.removeSds(list[0]);
                                        }),
                                    child: const Icon(Icons.undo)))

                        // :
                        ),
                  )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal2 = false;
                    itemCount++;

                    //  print('onDragged Completed');
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgsixcompnent2.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[1];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal2
                            ? Image.asset(r'assets/images/pgsixcompnent2.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal2 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal3 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgsixcompnent3.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[2];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal3
                            ? Image.asset(r'assets/images/pgsixcompnent3.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal3 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal4 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgsixcompnent4.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[3];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal4
                            ? Image.asset(r'assets/images/pgsixcompnent4.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal4 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal5 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgsixcompnent5.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[4];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal5
                            ? Image.asset(r'assets/images/pgsixcompnent5.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal5 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal6 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgsixcompnent6.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[5];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal6
                            ? Image.asset(r'assets/images/pgsixcompnent6.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal6 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal7 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent7.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[6];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal7
                            ? Image.asset(r'assets/images/pgcomponent7.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal7 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal8 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent8.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[7];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal8
                            ? Image.asset(r'assets/images/pgcomponent8.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal8 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal9 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent9.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[8];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal9
                            ? Image.asset(r'assets/images/pgcomponent9.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal9 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal10 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent10.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[9];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal10
                            ? Image.asset(r'assets/images/pgcomponent10.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal10 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal11 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent11.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[10];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal11
                            ? Image.asset(r'assets/images/pgcomponent11.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal11 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal12 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent12.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[11];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal12
                            ? Image.asset(r'assets/images/pgcomponent12.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal12 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal13 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent13.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[12];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal13
                            ? Image.asset(r'assets/images/pgcomponent13.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal13 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal14 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent14.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[13];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal14
                            ? Image.asset(r'assets/images/pgcomponent14.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal14 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal15 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent15.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[14];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal15
                            ? Image.asset(r'assets/images/pgcomponent15.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal15 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal16 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent16.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[15];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal16
                            ? Image.asset(r'assets/images/pgcomponent16.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal16 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(
                  child: Draggable(
                onDragCompleted: () {
                  setState(() {
                    isDragged.goal17 = false;
                    itemCount++;
                  });
                },
                feedback: Card(
                  child: Image.asset(r'assets/images/pgcomponent17.png'),
                ),
                child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return infoDialogs[16];
                        },
                      );
                    },
                    child: Card(
                        elevation: elevation,
                        child: isDragged.goal17
                            ? Image.asset(r'assets/images/pgcomponent17.png')
                            : InkWell(
                                onTap: () => setState(() {
                                      isDragged.goal17 = true;
                                      itemCount--;
                                    }),
                                child: const Icon(Icons.undo)))

                    // :
                    ),
              )),
              Flexible(child: DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                          onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ChoosedGoalsScreen(),
                              ))),
                          child:
                              Image.asset(r'assets/images/pgviewbasket.png')),
                      Positioned(
                          // top: 30,
                          // left: 0,
                          child: Text(
                        itemCount.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                    ],
                  );
                },
              )),
            ],
          ),
        ),
      ],
    );
  }
}
