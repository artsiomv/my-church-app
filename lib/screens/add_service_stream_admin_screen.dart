import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_church_app/components/rounded_button.dart';
import 'package:my_church_app/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cool_alert/cool_alert.dart';

final _firestore = FirebaseFirestore.instance;
final storageRef = FirebaseStorage.instance.ref();

class AddServiceStreamScreen extends StatefulWidget {
  static String id = 'add_service_stream_screen';

  const AddServiceStreamScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceStreamScreen> createState() => _AddServiceStreamScreenState();
}

class _AddServiceStreamScreenState extends State<AddServiceStreamScreen> {
  String title = "";
  String url = "";
  XFile? _imageFile;

  bool showSpinner = false;

  void _setImageFileFromFile(XFile? value) {
    _imageFile = value;
  }

  dynamic _pickImageError;

  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );
      setState(() {
        _setImageFileFromFile(pickedFile);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event Stream'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter Title'),
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  url = value;
                });
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter Video URL'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _onImageButtonPressed(ImageSource.gallery,
                        context: context);
                  },
                  heroTag: 'image0',
                  tooltip: 'Pick Image from gallery',
                  child: const Icon(Icons.photo),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _onImageButtonPressed(ImageSource.camera, context: context);
                  },
                  heroTag: 'image2',
                  tooltip: 'Take a Photo',
                  child: const Icon(Icons.camera_alt),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: _previewImages(),
              ),
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Add Service Stream',
              onTap: () async {
                setState(() {
                  showSpinner = true;
                });
                String fileURL = await uploadImageToFirebase(context);
                if (fileURL == "") {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: "Failed to upload image, Try Again..",
                  );
                  setState(() {
                    showSpinner = false;
                  });
                  return;
                }
                _firestore.collection('streams').add({
                  'title': title,
                  'url': url,
                  'image': fileURL,
                  'timestamp': FieldValue.serverTimestamp(),
                }).then((result) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "Service Stream added!",
                  );
                }).catchError((error) {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: "Somethign went wrong! Tru Again..",
                  );
                });
                setState(() {
                  showSpinner = false;
                });
                if (!mounted) return;
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> uploadImageToFirebase(BuildContext context) async {
    File myFile = File(_imageFile!.path);
    String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    try {
      await firebaseStorageRef.putFile(myFile);
    } on FirebaseException catch (e) {
      e.toString();
    }
    return await firebaseStorageRef.getDownloadURL();
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: Semantics(
          label: 'image_picker_example_picked_image',
          child: Image.file(File(_imageFile!.path)),
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        if (response.files == null) {
          _setImageFileFromFile(response.file);
        } else {
          _imageFile = response.file;
        }
      });
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}
