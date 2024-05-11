import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:async';
import 'dart:io';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<ScannerPage> {
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  List<dynamic>? _recognitions1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _initializeTflite();
  }

  Future<void> _initializeTflite() async {
    // Load the model and labels
    await Tflite.loadModel(
      model: "assets/bokchoymodel.tflite",
      labels: "assets/petchay_labels.txt",
    );
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
        _recognitions1 = null; // Clear previous recognitions
        _isLoading = true;
      });
      await _processImage();
    }
  }

  Future<void> _captureImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
        _recognitions1 = null; // Clear previous recognitions
        _isLoading = true;
      });
      await _processImage();
    }
  }

  Future<void> _processImage() async {
    if (_pickedImage != null) {
      final List<dynamic>? recognitions1 = await Tflite.runModelOnImage(
        path: _pickedImage!.path,
        numResults: 5,
        threshold: 0.5,
      );
      // Update the recognitions
      setState(() {
        _recognitions1 = recognitions1;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //backgroundColor: Theme.of(context).colorScheme.background,
      //body: Container(
      //color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Scan/Upload Seeds Here",
            style: TextStyle(fontSize: 20),
          ),
          // GIF image at the top
          if (!_isLoading) ...[
            Image.asset(
              'assets/images/uploading.gif', // Path to your GIF image
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
          ],
          if (!_isLoading && _pickedImage != null)
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Image.file(
                File(_pickedImage!.path),
                fit: BoxFit.cover,
              ),
            )
          else if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _pickImageFromGallery,
            icon: const Icon(Icons.photo),
            label: const Text(
              "Select from Gallery",
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _captureImage,
            icon: const Icon(Icons.camera_alt),
            label: const Text(
              "Take Photo",
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Display combined recognitions if available
          if (_recognitions1 != null)
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Details:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 86, 54, 244),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _recognitions1!
                          .map(
                            (recognition) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Label: ${recognition['label']}",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),),
                                Text(
                                  "Confidence Level: ${(recognition['confidence'] * 100).toStringAsFixed(2)}%",
                                                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  // Display recommendations card if the label is "Alternaria_Leaf_Spot"
                  if (_recognitions1 != null &&
                      _recognitions1![0]['label'] == 'Alternaria_Leaf_Spot')
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommendations for Alternaria Leaf Spot:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1. Remove infected leaves immediately to prevent spreading.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "2. Apply fungicide as per manufacturer's instructions.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "3. Ensure proper ventilation and reduce humidity around plants.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  // Display recommendations card if the label is "Bacterial_Spot"
                  if (_recognitions1 != null &&
                      _recognitions1![0]['label'] == 'Bacterial_Spot')
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommendations for Bacterial Spot:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1. Avoid overhead watering to minimize moisture on leaves.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "2. Apply copper-based fungicide to affected plants.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "3. Ensure proper plant spacing for adequate airflow.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                                      if (_recognitions1 != null &&
                      _recognitions1![0]['label'] == 'Healthy_Petchay')
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommendations for Healthy Petchay:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1. Avoid overhead watering to minimize moisture on leaves.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "2. Apply copper-based fungicide to affected plants.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "3. Ensure proper plant spacing for adequate airflow.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                                      if (_recognitions1 != null &&
                      _recognitions1![0]['label'] == 'Undefined')
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommendations for Undefined:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1. Image is not a leaf/leaves.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "2. Its probably unrecognizable/blurred or unclear.",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "3. Ensure proper view of the image",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          else
            Container(),
        ],
      ),
      //),
    );
  }

  @override
  void dispose() {
    // Dispose TFLite resources
    Tflite.close();
    super.dispose();
  }

  //@override
  void init() {
    _initializeTflite();
  }
}

void main() {
  runApp(const MaterialApp(
    home: ScannerPage(),
  ));
}
