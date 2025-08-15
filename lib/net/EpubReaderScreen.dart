import 'package:epub_view/epub_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpubReaderScreen extends StatefulWidget {
  const EpubReaderScreen({super.key});
 
  @override
  State<EpubReaderScreen> createState() => _EpubReaderScreenState();
}
 
class _EpubReaderScreenState extends State<EpubReaderScreen> {
  EpubController? _epubController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
 
  @override
  void dispose() {
    _epubController?.dispose();
    super.dispose();
  }
 
  // 选择 EPUB 文件
  Future<void> _openEpubFile() async {
    final document = await EpubDocument.openAsset('assets/sample.epub');


  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('EPUB Reader'),
        actions: [
          IconButton(
            icon: const Icon(Icons.folder_open),
            onPressed: _openEpubFile,
          ),
        ],
      ),
      body: _epubController == null
          ? const Center(child: Text('点击右上角选择 EPUB 文件'))
          : EpubView(
              controller: _epubController!,
              builders: EpubViewBuilders<DefaultBuilderOptions>(
                options: const DefaultBuilderOptions(),
                chapterDividerBuilder: (_) => const Divider(),
              ),
            ),
    );
  }
}