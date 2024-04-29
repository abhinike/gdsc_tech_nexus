<div style="display: flex;">
  <img src="/readme/gdsc.png" width="40%" style="margin-right: 20px;">
</div>


# 📸 OCR Text Recognition using ML

## Description
The OCR Text Recognition Module is designed to extract text from images using Flutter. The module utilizes the Google ML Kit for text recognition and the Image Picker package for accessing images from the device's camera or gallery. Users can capture images containing text, and the app will recognize and display the extracted text in real-time. Additionally, users have the option to copy the recognized text to the device's clipboard for further use.

## 💡 Working of Module

### OCRProvider
- This class is responsible for managing the OCR functionality.
- It includes methods for capturing images from the camera, picking images from the gallery, recognizing text from images, copying recognized text to the clipboard, and resetting the recognized text.

### TextRecognitionScreen
- This screen is where the OCR functionality is implemented.
- It displays a user interface with options to capture images from the camera or pick images from the gallery.
- When an image is selected, the app extracts text from the image using Google ML Kit and displays the recognized text.
- Users can copy the recognized text to the clipboard and clear the text from the screen using provided buttons.

## ℹ️ Reference Material

- [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition) package
- [image_picker](https://pub.dev/packages/image_picker) package

## 📸 Screenshots

<img src="/readme/text_recognizition_readme.png" width="100%">

## 🚀 Setup Guide

To set up the OCR Text Recognition Flutter App on your local machine, follow these steps:

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/abhinike/gdsc_tech_nova.git
    ```

2. **Navigate to the Project Directory:**
    ```bash
    cd gdsc_tech_nova
    ```

3. **Install Dependencies:**
    ```bash
    flutter pub get
    ```

4. **Run the App:**
    ```bash
    flutter run
    ```

5. **Connect a Device:**
   Ensure that you have a mobile device connected or an emulator running.

6. **Explore the App:**
   Once the app is running, you can use the provided buttons to capture images from the camera or pick images from the gallery. The app will then extract text from the selected image and display it in the text area.

7. **Copy Text to Clipboard:**
   If needed, you can copy the recognized text to the clipboard by tapping the "Copy Result to Clipboard" button.

8. **Clear Result:**
   To clear the recognized text from the screen, tap the "Clear Result" button.

That's it! You've successfully set up the OCR Text Recognition Flutter App on your local machine. Enjoy extracting text from images effortlessly! 🎉

Follow us on Instagram: [@gdsc.djsce](https://www.instagram.com/gdsc.djsce) and LinkedIn: [GDSC DJ Sanghvi College of Engineering](https://www.linkedin.com/company/gdsc-djsce/) for more updates and tech insights! 💬✨
