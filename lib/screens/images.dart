
import 'package:flutter/material.dart';
import 'ImagePageContent.dart';

class ImagePractise extends StatelessWidget {
  const ImagePractise({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Image Page'),
      ),
      body: const ImagePageContent(),
    );
  }

  }

