
# Live Object Recognition Using flutter_tflite

This project demonstrates live object recognition using the `flutter_tflite` package, which integrates TensorFlow Lite models into Flutter apps. The example utilizes the SSD MobileNet model for real-time object detection.
### Package Link - https://pub.dev/packages/tflite_flutter
### Github Example Link - https://github.com/tensorflow/flutter-tflite/tree/main/example/live_object_detection_ssd_mobilenet
## Getting Started

Follow these steps to set up the project:

1. **Install Dependencies**: Add necessary dependencies to your `pubspec.yaml` file by running:
    ```bash
    flutter pub add camera tflite_flutter path_provider image_picker exif
    ```

2. **Update `minSdkVersion`**: Ensure that your `minSdkVersion` in the app-level `build.gradle` file is set to 26 or higher.

3. **Create Assets Folder**: Create an `assets` folder in your project's root directory. Inside it, create a `models` folder. Place your TensorFlow Lite model file (`*.tflite`) along with its label file (`*.txt`) inside the `models` folder. Make sure to expose these assets in your `pubspec.yaml` file.

4. **Copy Example Files**: Copy the files from the [live_object_detection_ssd_mobilenet](https://github.com/tensorflow/flutter-tflite/tree/main/example/live_object_detection_ssd_mobilenet) example in the `flutter_tflite` repository.

5. **Update Detector Configuration**: Navigate to the `detector_service.dart` file and locate the `Detector` class. Update the `_modelPath` and `_labelPath` variables to point to your TensorFlow Lite model and label files, respectively.

    ```dart
    static const String _modelPath = 'assets/models/modelfile.tflite';
    static const String _labelPath = 'assets/models/labelmap.txt';
    ```

6. **Run the App**: Launch the app using the following command:
    ```bash
    flutter run
    ```

## Screenshots

[Add screenshots here]

## Demo Files

Demo files for TensorFlow Lite models and labels can be found [here](https://github.com/shaqian/flutter_tflite/tree/master/example/assets).


