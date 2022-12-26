import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CounterBloc {
  final streamController = StreamController();
  StreamSink get counterSink => streamController.sink;
  Stream get counterStream => streamController.stream;

  final eventStreamController = StreamController();
  StreamSink get eventSink => eventStreamController.sink;
  Stream get eventStream => eventStreamController.stream;

  CounterBloc() {
    eventStream.listen((event) {
      if (image1 != null) {
        counterSink.add(image1);
        if (event.toString().length == 10) {
          counterSink.addError("This is Error");
        }
      }
    });
  }
  File? image1;

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      image1 = File(image.path);
      counterSink.add(image1);
    }
  }
}
