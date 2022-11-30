import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/common/widgets/custom_button.dart';
import 'package:savvy/common/widgets/delete_account_row.dart';
import 'package:savvy/utils/color_constants.dart';

import '../../common/widgets/round_icon_button.dart';

class DeleteMyAccount extends StatefulWidget {
  const DeleteMyAccount({super.key});
  static const String screenName = '/DeleteMyAcc';

  @override
  State<DeleteMyAccount> createState() => _DeleteMyAccountState();
}

class _DeleteMyAccountState extends State<DeleteMyAccount> {
  bool? checkBox1Value = false;
  bool? checkBox2Value = false;
  bool? checkBox3Value = false;
  bool? checkBox4Value = false;
  bool? checkBox5Value = false;
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        leading: UnconstrainedBox(
          child: SizedBox(
            height: 40,
            width: 30,
            child: RoundButton(
              onTap: () => Navigator.pop(context),
              icon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 18),
              ),
            ),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text(
          "Delete My Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: viewInsets > 0
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    'Why do you want to delete your Savvy\nAccount',
                    textAlign: TextAlign.center,
                    style: headingTextStyle(),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: RowDeleteMyAccount(
                        leading: Checkbox(
                          value: checkBox1Value,
                          onChanged: (value) => setState(() {
                            checkBox1Value = value;
                          }),
                        ),
                        text: Text(
                          'I Concerned About My Personnel Data',
                          style: textStyle(),
                        ))),
                Flexible(
                    flex: 1,
                    child: RowDeleteMyAccount(
                        leading: Checkbox(
                          value: checkBox2Value,
                          onChanged: (value) => setState(() {
                            checkBox2Value = value;
                          }),
                        ),
                        text: Text(
                          'I have another savvy Account',
                          style: textStyle(),
                        ))),
                Flexible(
                    flex: 1,
                    child: RowDeleteMyAccount(
                        leading: Checkbox(
                          value: checkBox3Value,
                          onChanged: (value) => setState(() {
                            checkBox3Value = value;
                          }),
                        ),
                        text: Text(
                          'I want to remove app from my mobile',
                          style: textStyle(),
                        ))),
                Flexible(
                    flex: 1,
                    child: RowDeleteMyAccount(
                        leading: Checkbox(
                          value: checkBox4Value,
                          onChanged: (value) => setState(() {
                            checkBox4Value = value;
                          }),
                        ),
                        text: Text(
                          'I get too many emails from savvy',
                          style: textStyle(),
                        ))),
                Flexible(
                    flex: 1,
                    child: RowDeleteMyAccount(
                        leading: Checkbox(
                          value: checkBox5Value,
                          onChanged: (value) => setState(() {
                            checkBox5Value = value;
                          }),
                        ),
                        text: Text(
                          'Others',
                          style: textStyle(),
                        ))),
                Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '''Comments(optional)''',
                          style: textStyle(),
                        ),
                        const Expanded(
                          flex: 3,
                          child: TextField(
                            maxLines: 20,
                            decoration: InputDecoration(
                              hintText:
                                  "Please Provide Additional Information Here",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    )),
                Flexible(
                    flex: 2,
                    child: MyButton(
                        ontap: () {
                          Fluttertoast.showToast(
                              msg:
                                  'Request sent To Admin(Account Will Be Deleted In 24 hours)');
                          Navigator.pop(context);
                        },
                        radius: 10,
                        color: ColorConstants.introPageTextColor,
                        height: size.height * 0.08,
                        width: size.width * 0.9,
                        spreadRadius: 0,
                        child: Text(
                          'Delete',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.height * 0.025),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textStyle() {
    return GoogleFonts.lato(
      fontSize: size.height * 0.018,
      color: Colors.black,
    );
  }

  headingTextStyle() {
    return GoogleFonts.lato(
      fontSize: size.height * 0.023,
      color: Colors.black,
    );
  }
}
