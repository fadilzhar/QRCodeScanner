import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  String? qrRawValue;
  Color qrColor = Colors.white;
  final List<String> qrTypes = [
    'JPG', 'PNG', 'SVG', 'PDF',
  ];
  String? selectedQrType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 96, 100, 234),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 96, 100, 234),
                  Color.fromARGB(245, 58, 46, 196),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Screenshot(
  controller: screenshotController,
  child: qrRawValue == null
      ? const Center(
          child: Text(
            "No QR Code Generated",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(20), // Padding di sekitar QR Code
          child: Container(
            decoration: BoxDecoration(
              color: qrColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20), // Padding internal kontainer QR
            child: Center(
              child: PrettyQr(
                data: qrRawValue!,
                size: 150,
                roundEdges: true,
                elementColor: Colors.black,
              ),
            ),
          ),
        ),
),

                        const SizedBox(height: 20),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Link",
                            hintText: "Insert link here",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.link),
                          ),
                          onChanged: (value) {
                            setState(() {
                              qrRawValue = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "QR Code Type",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.qr_code),
                          ),
                          value: selectedQrType,
                          hint: const Text('Select QR Code Type'),
                          items: qrTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedQrType = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var color in [
                              Colors.grey,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.cyan,
                              Colors.purple,
                            ])
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    qrColor = color;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black12, width: 1),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  // Aksi Cancel
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              color: Colors.grey.shade300,
                              height: 50,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  _shareQrCode();
                                },
                                child: const Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _shareQrCode() async {
    final image = await screenshotController.capture();
    if (image != null) {
      await Share.shareXFiles([
        XFile.fromData(
          image,
          name: "qr_code.png",
          mimeType: "image/png",
        ),
      ]);
    }
  }
}
