import 'package:flutter/material.dart';

import '../api/APIService.dart';
import '../model/SentAna.dart';
import 'components/answer.dart';
import 'components/custom_field.dart';
import 'components/custom_in_box.dart';
import 'components/custom_out_box.dart';
import 'components/find_button.dart';
import 'components/header.dart';

class FindYourEmotionView extends StatefulWidget {
  const FindYourEmotionView({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<FindYourEmotionView> {
  final TextEditingController controller = TextEditingController();

  APIService apiService = APIService();
  Future<SentAna>? analysis;

  @override
  Widget build(BuildContext context) {
    // device size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // block the widgets inside the Scaffold to resize
      // themselves when the keyboard opens
      resizeToAvoidBottomInset: false,
      body: CustomOutBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 4.5,
            ),
            Header(),
            SizedBox(
              height: 40.0,
            ),
            CustomInBox(
              child: Column(
                children: [
                  CustomField(
                    controller: controller,
                  ),
                  Container(
                    width: size.width,
                    child: Column(
                      children: [
                        FindButton(
                          onTap: () {
                            setState(() {
                              analysis = apiService.post(
                                query: {'text': controller.text},
                              );
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FutureBuilder<SentAna>(
                          future: analysis,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return Answer(
                                  snapshot.data!.emotions,
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                );
                              } else {
                                return Container();
                              }
                            } else {
                              if (analysis == null) {
                                return Container();
                              } else {
                                return CircularProgressIndicator();
                              }
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
