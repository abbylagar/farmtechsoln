import 'dart:typed_data';
import 'dart:async';
import 'dart:io';
import'package:image/image.dart' as img;


import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  Interpreter _interpreter;
  Map<String, String> _labelDict;
   /// Padding the image to transform into square
  int padSize;

 bool loading;
  Classifier() {
    _loadModel();
    _loadLabel();
  }

  void _loadModel() async {
    print("herre loadmnodel");
    _interpreter =await Interpreter.fromAsset('resnet/plantAIfinal.tflite');
    print("interpreter allocated");
    print(_interpreter.isAllocated);
    var inputShape = _interpreter.getInputTensor(0).shape;
    var outputShape = _interpreter.getOutputTensor(0).shape;
    print(_interpreter.getInputTensor(0).type.toString());

    print('Load Model - $inputShape / $outputShape');
    
  
  }

  void _loadLabel() async {
    final labelData = await rootBundle
        .loadString('assets/resnet/labels.txt');
    print("label");
    var dict = <String, String>{};

    final labelList = labelData.split('\n');
    for (var i = 0; i < labelList.length; i++) {
      var entry = labelList[i].trim().split('|');
      dict[entry[0]] = entry[1];
    }

    _labelDict = dict;
  print(_labelDict);
    print('Load Label');
  }



  Future<bool> loadLabel() async {
    final labelData = await rootBundle
        .loadString('assets/resnet/labels.txt');
    print("label");
    var dict = <String, String>{};

    final labelList = labelData.split('\n');
    for (var i = 0; i < labelList.length; i++) {
      var entry = labelList[i].trim().split('|');
      dict[entry[0]] = entry[1];
    }

    _labelDict = dict;
  print(_labelDict);
    print('Load Label');
    return false;

  }



  Future<bool> loadModel() async {
    print("herre loadmnodel");
    _interpreter =await Interpreter.fromAsset('resnet/plantAIfinal.tflite');

    var inputShape = _interpreter.getInputTensor(0).shape;
    var outputShape = _interpreter.getOutputTensor(0).shape;
    print(_interpreter.getInputTensor(0).type.toString());

    print('Load Model - $inputShape / $outputShape');

  return false;
  }




  Future<img.Image> loadImage(String imagePath) async {
    var originData = File(imagePath).readAsBytesSync();
    
   var decoder = img.findDecoderForData(originData);
   img.Image image = decoder.decodeImage(originData);
  
  //  var originImage = img.decodeImage(originData);
    return image;
  }

  
/// Pre-process the image
 // TensorImage getProcessedImage(TensorImage inputImage) {
   // padSize = max(inputImage.height, inputImage.width);
   // if (imageProcessor == null) {
     // imageProcessor = ImageProcessorBuilder()
      //    .add(ResizeWithCropOrPadOp(padSize, padSize))
       //   .add(ResizeOp(224, 224, ResizeMethod.BILINEAR))
        //  .build();
   // }
   // inputImage = imageProcessor.process(inputImage);
   // return inputImage;
  //}

  Future<List<dynamic>> runModel(img.Image loadImage) async {

    

 // Create TensorImage from image
   // TensorImage inputImage = TensorImage.fromImage(loadImage);

    // Pre-process TensorImage
    //inputImage = getProcessedImage(inputImage);

  //  List<Object> inputs = [inputImage.buffer];

  
    img.Image modelImage = img.copyResize(loadImage, width: 224, height: 224,interpolation: img.Interpolation.nearest);
    var modelInput = imageToByteFloatListUint8(modelImage, 224,1);
print("load");
print(modelInput);
    //[1, 409776]
    var outputsForPrediction = [List.generate(15, (index) => 0.0)];
  //  print(modelInput.buffer.toString());


   _interpreter.run(modelInput.buffer, outputsForPrediction);

 //  _interpreter.run(inputs, outputsForPrediction);
 // _interpreter.runForMultipleInputs(inputs, outputs);
  //print("outputs");
  //print(outputs.toString());

    Map<int, double> map = outputsForPrediction[0].asMap();
    print(map);
    var sortedKeys = map.keys.toList()
      ..sort((k1, k2) => map[k2].compareTo(map[k1]));

    List<dynamic> result = [];

    for (var i = 0; i < 14; i++) {
      result.add({
        'label': _labelDict[sortedKeys[i].toString()],
        'value': map[sortedKeys[i]],
      });
    }

    return result;
  }

  Uint8List imageToByteFloatListUint8(img.Image image, int inputSize, int std) {
  var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
   var buffer = Float32List.view(convertedBytes.buffer);
 // var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
 // var buffer = Uint8List.view(convertedBytes.buffer);

    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = img.getBlue(pixel).toDouble();
        buffer[pixelIndex++] = img.getGreen(pixel).toDouble();
        buffer[pixelIndex++] = img.getRed(pixel).toDouble();
      }
    }
    print(convertedBytes.buffer.asFloat32List().toString());
    return convertedBytes.buffer.asUint8List();
 //  return convertedBytes.buffer.asFloat32List();
 
  }



Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);

    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = img.getRed(pixel);
        buffer[pixelIndex++] = img.getGreen(pixel);
        buffer[pixelIndex++] = img.getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

}