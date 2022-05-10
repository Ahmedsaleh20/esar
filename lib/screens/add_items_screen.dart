// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:esar/model/item_model.dart';
import 'package:esar/utils/firebase_provider.dart';
import 'package:esar/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItemScreen extends StatefulWidget {
 final String? title;
 final String? subTitle;
 final String? image;
  AddItemScreen({
    Key? key,
    this.title,
    this.subTitle,
    this.image,
  }) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  FireBaseProvider fireBaseProvider = FireBaseProvider();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController subTitleEditingController = TextEditingController();
  XFile? image; //path of images

  @override
  Widget build(BuildContext context) {
    Future<void> addItems() {
      return fireBaseProvider.items.add(ItemModel(
          title: titleEditingController.text,
          subTitle: subTitleEditingController.text,
          image: widget.image!
          ));
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: ListView(children: [
            const Text(
              'اضافه عنصر',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'اختر صوره',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 22,
                ),
                image == null
                    ? InkWell(
                        onTap: () {
                          //استدعاء المكتبه
                          final ImagePicker _picker = ImagePicker();
                          // Pick an image
                          _picker
                              .pickImage(source: ImageSource.gallery)
                              .then((value) => image = value)
                              .whenComplete(() {
                            setState(() {});
                            //تعمل اكسيس علي الملفات الخاصه بالصور

                            // print(image!.path);
                            // refresh the inkwell widget to the image we picked
                          });
                        },
                        child: Image.asset('assets/images/upload.png',
                            width: 85, height: 87, fit: BoxFit.contain),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(40),
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 67,
            ),
            TextFormWidget(
              hint: 'اضافه عنصر',
              textcontroller: titleEditingController,
            ),

            const SizedBox(
              height: 33,
            ),
            TextFormWidget(
              maxLines: 6,
              hint: 'تفاصيل العنصر',
              textcontroller: subTitleEditingController,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                addItems();
                Navigator.of(context).pop;
              },
              child: const Text(
                'اضافه',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.green,
            ),
            //
          ]),
        ),
      ),
    );
  }
}
