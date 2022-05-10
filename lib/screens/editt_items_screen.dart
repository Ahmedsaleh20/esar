import 'dart:io';

import 'package:esar/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/firebase_provider.dart';

class EditItemScreen extends StatefulWidget {
  const EditItemScreen({Key? key}) : super(key: key);

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  FireBaseProvider fireBaseProvider = FireBaseProvider();

  XFile? image; //path of images

  @override
  Widget build(BuildContext context) {
//     Future <void> addItems ()async {
//     return fireBaseProvider.items.add(ItemModel(
//     title: widget.title!,
//     subTitle: widget.subTitle!,
//     image: widget.image!
//       ));)
//     }

    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Colors.grey, width: 2),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const Text(
                'تعديل عنصر',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(
                height: 37,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'تعديل العنصر',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  InkWell(
                    onTap: () {
                      //استدعاء المكتبه
                      final ImagePicker _picker = ImagePicker();
                      // Pick an image
                      _picker
                          .pickImage(
                              source: ImageSource
                                  .gallery) //تعمل اكسيس علي الملفات الخاصه بالصور
                          .then((value) => image = value)
                          .whenComplete(() {
                        setState(
                            () {}); // refresh the inkwell widget to the image we picked
                      });
                    },
                    child: Image.asset('assets/images/upload.png',
                        width: 85, height: 87, fit: BoxFit.contain),
                  )
                ],
              ),
              const SizedBox(
                height: 67,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                keyboardType: TextInputType.text,
                decoration:
                    textFieldDecoration.copyWith(hintText: 'تعديل الصوره'),
              ),
              const SizedBox(
                height: 33,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                maxLines: 6,
                keyboardType: TextInputType.text,
                decoration: textFieldDecoration.copyWith(
                  hintText: 'تفاصيل  قصيره عن العنصر',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
                },
                child: const Text(
                  'حفظ',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              //
              image == null ? const SizedBox() : Image.file(File(image!.path)),
            ]),
          ),
        ),
      ),
    );
  }
}
