// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';

// class CatAndDogView extends StatefulWidget {
//   const CatAndDogView({Key? key}) : super(key: key);

//   @override
//   _TfliteModelState createState() => _TfliteModelState();
// }

// class _TfliteModelState extends State<CatAndDogView> {
//   late File _image;
//   late List _output;
//   final picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//   }

//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//         path: image.path,
//         numResults: 1,
//         threshold: 0.5,
//         imageMean: 127.5,
//         imageStd: 127.5);

//     setState(() {
//       _output = output!;
//     });
//   }

//   Future loadModel() async {
//     await Tflite.loadModel(
//         model: 'assets/cat_and_dog/model.tflite',
//         labels: 'assets/cat_and_dog/labels.txt');
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();

//     Tflite.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image Classification"),
//       ),
//       body: ListView(
//         children: [
//           (_image.existsSync())
//               ? Container(
//                   margin: const EdgeInsets.all(10),
//                   child: Image.file(_image),
//                 )
//               : Container(
//                   margin: const EdgeInsets.all(10),
//                   child: const Opacity(
//                     opacity: 0.8,
//                     child: Center(
//                       child: Text("No image selected"),
//                     ),
//                   ),
//                 ),
//           SingleChildScrollView(
//             child: Column(
//               children: (_image.path != null)
//                   ? _output.map((result) {
//                       return Card(
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Text(
//                             "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
//                             style: const TextStyle(
//                                 color: Colors.red, fontSize: 20),
//                           ),
//                         ),
//                       );
//                     }).toList()
//                   : [],
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: pickImage,
//         tooltip: "Pick Image",
//         child: const Icon(Icons.image),
//       ),
//     );
//   }

//   Future pickImage() async {
//     try {
//       final ImagePicker _picker = ImagePicker();
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery,
//       );
//       File image = File(pickedFile!.path);

//       _image = image;
//       classifyImage(image);
//     } catch (e) {}
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class CatAndDogView extends StatefulWidget {
  const CatAndDogView({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<CatAndDogView> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/cat_and_dog/model.tflite",
        labels: "assets/cat_and_dog/labels.txt"))!;

    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat and dog detection"),
      ),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.file(_image),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: const Opacity(
                    opacity: 0.8,
                    child: Center(
                      child: Text("No image selected"),
                    ),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }

  Future pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      File image = File(pickedFile!.path);
      imageClassification(image);
    } catch (e) {}
  }
}
