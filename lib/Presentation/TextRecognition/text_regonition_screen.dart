import 'package:flutter/material.dart';
import 'package:gdsc_tech_nova/Provider/OcrProvider.dart';
import 'package:gdsc_tech_nova/utils/app_colors..dart';
import 'package:provider/provider.dart';

class TextRegonitionScreen extends StatefulWidget {
  const TextRegonitionScreen({Key? key}) : super(key: key);

  @override
  _TextRegonitionScreenState createState() => _TextRegonitionScreenState();
}

class _TextRegonitionScreenState extends State<TextRegonitionScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OCRProvider(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text(
            'Text Recognition',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "OCR using Google ML Kit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<OCRProvider>().captureImageFromCamera();
                        },
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                "Capture an Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<OCRProvider>().pickImageFromFile();
                        },
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.file_copy_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              Text(
                                "Pick a File",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Detection Result",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    margin: const EdgeInsets.only(bottom: 10, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller:
                          context.read<OCRProvider>().textEditingController,
                      maxLines: 100,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    )),
              ),
              InkWell(
                onTap: () {
                  var isCopied = context.read<OCRProvider>().copyToClipboard();
                  isCopied
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Text Copied to Clipboard"),
                          ),
                        )
                      : null;
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Copy Result to Clipboard",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
