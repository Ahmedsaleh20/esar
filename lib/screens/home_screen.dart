import 'package:esar/screens/editt_items_screen.dart';
import 'package:flutter/material.dart';

import 'add_items_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textFieldDecoration = InputDecoration(
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(9),
    //     borderSide: const BorderSide(color: Colors.grey, width: 2),
    //   ),
    // );
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddItemScreen(),
                          ));
                        },
                        child: const Text(
                          'اضافه',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(
                              14,
                            )),
                        height: 95,
                        width: double.infinity,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  InkWell(
                                    child: Text('حذف'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    child: Text('تعديل'),
                                    
                                  ),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text('عنوان العنصر '),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('تفاصيل قصيره عن العنصر '),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const FlutterLogo(),
                            ]),
                      ),
                    ]))));
  }
}
