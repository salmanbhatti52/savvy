import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/undo_widget.dart';
import 'package:savvy/controllers/screen_six_controller/selected_sds_list.dart';
import 'package:savvy/screens/dialouges/dialog_controller/detail_dialogs.dart';
import 'package:savvy/screens/dialouges/dialog_controller/info_dialogs.dart';
import 'package:savvy/screens/dialouges/info_dialog.dart';
import 'package:savvy/screens/dialouges/not_found_sdg.dart';
import 'package:savvy/screens/dialouges/reuseabel_info_dialog.dart';
import 'package:savvy/screens/post_page_view_screens/chosed_goals_screen.dart';
import 'package:savvy/services/api_services.dart';
import 'package:savvy/utils/pgviewscreensixutils/Sc_six_utils.dart';

import '../../common/widgets/custom_button.dart';
import '../../models/sdgs_models/update_sdgs_list.dart';
import '../../utils/color_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PageViewScreenSix extends StatefulWidget {
  const PageViewScreenSix({super.key});

  @override
  State<PageViewScreenSix> createState() => _PageViewScreenSixState();
}

class _PageViewScreenSixState extends State<PageViewScreenSix> {
  InfoDialog infoDialog = InfoDialog();
  DetailDialogs detailDialogs = DetailDialogs();
  InfoDialogs info = InfoDialogs(detailDialogs: DetailDialogs());
  List<ReuseableDialog> infoDialogs = [];
  int itemCount = 0;
  List<UpdatedSdgsList> list = [];
  ScSixUtils isDragged = ScSixUtils();
  final ApiServices _apiServices = ApiServices();
  List<UpdatedSdgsList> selectedList = [];
  final sdgListController = Get.put(SdgsListController());
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getSdgs();
    Timer(
        const Duration(seconds: 3),
        () => setState(() {
              isLoaded = true;
            }));
  }

  getSdgs() async {
    list = await _apiServices.getAllSdgs();
  }

  @override
  void dispose() {
    super.dispose();
    sdgListController.selectedSds = [];
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
                    print("bucketLength: ${sdgListController.selectedSds.length}");
                    if (sdgListController.selectedSds.length >= 5) {
                      Navigator.pushNamed(context, ChoosedGoalsScreen.screenName);
                    } else {
                      Fluttertoast.showToast(
                          gravity: ToastGravity.CENTER,
                          msg: 'You must select 5 items in bucket.',
                          backgroundColor: ColorConstants.buttonColorLight);
                    }
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

    return isLoaded
        ? Column(
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: size.width * 0.24,
                          child: Draggable(
                            onDragCompleted: () {
                             
                              if (itemCount < 5) {
                                var contain = isContains('1');
                                if (contain.isEmpty) {
                                  setState(() {
                                    isDragged.goal1 = false;
                                    itemCount++;
                                    sdgListController.addSdgs(list[0]);
                                  });
                                } else {
                                  showToast();
                                }
                              } else {
                                maxItemsReachedToast();
                              }
                            },
                            feedback: Card(
                              child: Image.asset(
                                  r'assets/images/pgsixcompnent1.png'),
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
                                              sdgListController
                                                  .removeSds(list[0]);
                                            }),
                                            child: const UndoImage(
                                                imageUrl:
                                                    (r'assets/images/pgsixcompnent1.png')),
                                          ))

                                // :
                                ),
                          ),
                        )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('2');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal2 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[1]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgsixcompnent2.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgsixcompnent2.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal2 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[1]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgsixcompnent2.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('3');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal3 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[2]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgsixcompnent3.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgsixcompnent3.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal3 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[2]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgsixcompnent3.png'))))

                            // :
                            ),
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
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('4');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal4 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[3]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgsixcompnent4.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgsixcompnent4.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal4 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[3]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgsixcompnent4.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('5');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal5 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[4]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgsixcompnent5.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgsixcompnent5.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal5 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[4]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgsixcompnent5.png'))))),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('6');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal6 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[5]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgsixcompnent6.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgsixcompnent6.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal6 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[5]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgsixcompnent6.png'))))

                            // :
                            ),
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
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('7');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal7 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[6]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent7.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal7 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[6]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent7.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SdgDialog();
                            },
                          );

                          // if (itemCount < 5) {
                          //   var contain = isContains('8');
                          //   if (contain.isEmpty) {
                          //     setState(() {
                          //       isDragged.goal8 = false;
                          //       itemCount++;
                          //       sdgListController.addSdgs(list[7]);
                          //     });
                          //   } else {
                          //     showToast();
                          //   }
                          // } else {
                          //   maxItemsReachedToast();
                          // }
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent8.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal8 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[7]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent8.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SdgDialog();
                            },
                          );

                          // if (itemCount < 5) {
                          //   var contain = isContains('9');
                          //   if (contain.isEmpty) {
                          //     setState(() {
                          //       isDragged.goal9 = false;
                          //       itemCount++;
                          //       sdgListController.addSdgs(list[8]);
                          //     });
                          //   } else {
                          //     showToast();
                          //   }
                          // } else {
                          //   maxItemsReachedToast();
                          // }
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent9.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal9 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[8]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent9.png'))))

                            // :
                            ),
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
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SdgDialog();
                            },
                          );
                          // if (itemCount < 5) {
                          //   var contain = isContains('10');
                          //   if (contain.isEmpty) {
                          //     setState(() {
                          //       isDragged.goal10 = false;
                          //       itemCount++;
                          //       sdgListController.addSdgs(list[9]);
                          //     });
                          //   } else {
                          //     showToast();
                          //   }
                          // } else {
                          //   maxItemsReachedToast();
                          // }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent10.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent10.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal10 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[9]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent10.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('11');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal11 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[10]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent11.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent11.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal11 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[10]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent11.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('12');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal12 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[11]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent12.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent12.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal12 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[11]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent12.png'))))

                            // :
                            ),
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
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('13');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal13 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[12]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent13.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent13.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal13 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[12]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent13.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          if (itemCount < 5) {
                            var contain = isContains('14');
                            if (contain.isEmpty) {
                              setState(() {
                                isDragged.goal14 = false;
                                itemCount++;
                                sdgListController.addSdgs(list[13]);
                              });
                            } else {
                              showToast();
                            }
                          } else {
                            maxItemsReachedToast();
                          }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent14.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent14.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal14 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[13]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent14.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SdgDialog();
                            },
                          );
                          // if (itemCount < 5) {
                          //   var contain = isContains('15');
                          //   if (contain.isEmpty) {
                          //     setState(() {
                          //       isDragged.goal15 = false;
                          //       itemCount++;
                          //       sdgListController.addSdgs(list[14]);
                          //     });
                          //   } else {
                          //     showToast();
                          //   }
                          // } else {
                          //   maxItemsReachedToast();
                          // }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent15.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent15.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal15 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[14]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent15.png'))))

                            // :
                            ),
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
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SdgDialog();
                            },
                          );
                          // if (itemCount < 5) {
                          //   var contain = isContains('16');
                          //   if (contain.isEmpty) {
                          //     setState(() {
                          //       isDragged.goal16 = false;
                          //       itemCount++;
                          //       sdgListController.addSdgs(list[15]);
                          //     });
                          //   } else {
                          //     showToast();
                          //   }
                          // } else {
                          //   maxItemsReachedToast();
                          // }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent16.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent16.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal16 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[15]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent16.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(
                        child: SizedBox(
                      width: size.width * 0.24,
                      child: Draggable(
                        onDragCompleted: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const SdgDialog();
                            },
                          );
                          // if (itemCount < 5) {
                          //   var contain = isContains('17');
                          //   if (contain.isEmpty) {
                          //     setState(() {
                          //       isDragged.goal17 = false;
                          //       itemCount++;
                          //       sdgListController.addSdgs(list[16]);
                          //     });
                          //   } else {
                          //     showToast();
                          //   }
                          // } else {
                          //   maxItemsReachedToast();
                          // }
                        },
                        feedback: Card(
                          child:
                              Image.asset(r'assets/images/pgcomponent17.png'),
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
                                    ? Image.asset(
                                        r'assets/images/pgcomponent17.png')
                                    : InkWell(
                                        onTap: () => setState(() {
                                              isDragged.goal17 = true;
                                              itemCount--;
                                              sdgListController
                                                  .removeSds(list[16]);
                                            }),
                                        child: const UndoImage(
                                            imageUrl:
                                                (r'assets/images/pgcomponent17.png'))))

                            // :
                            ),
                      ),
                    )),
                    Flexible(child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(r'assets/images/pgviewbasket.png'),
                            Positioned(
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
          )
        : const Center(
            child: SpinKitThreeInOut(
            color: ColorConstants.buttonColorLight,
          ));
  }

  List<UpdatedSdgsList> isContains(String id) {
    selectedList = sdgListController.getSelectedSdgs();

    List<UpdatedSdgsList> contain = selectedList
        .where(
          (element) => element.systemSdgsId == id,
        )
        .toList();

    return contain;
  }

  showToast() {
    Fluttertoast.showToast(msg: 'Item Already Exists');
  }

  maxItemsReachedToast() {
    Fluttertoast.showToast(msg: 'Bucket Full');
  }
}
