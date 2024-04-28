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
          backgroundColor: AppColors.backgroundColor,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text(
            'Text Recognition',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var isCopied =
                        context.read<OCRProvider>().copyToClipboard();
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
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              spreadRadius: 0)
                        ],
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.copy,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Copy Result to Clipboard",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 2,
                          spreadRadius: 0)
                    ],
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detection Result",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () => context.read<OCRProvider>().reset(),
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 2,
                                spreadRadius: 0)
                          ],
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Clear Result",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              spreadRadius: 0)
                        ],
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller:
                          context.read<OCRProvider>().textEditingController,
                      minLines: 10,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
