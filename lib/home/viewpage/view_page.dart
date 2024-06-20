import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;
import '../../utils/globle_values.dart';
class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}


class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Page'),
        backgroundColor: Colors.white,
      ),
      body: RepaintBoundary(
        key: globalKey,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 50,
                  backgroundImage: (studentList[selectIndex].student_image!=null)?FileImage(studentList[selectIndex].student_image!):null,
                ),
              ),
              const SizedBox(height: 30,),
              Text(studentList[selectIndex].student_name!.text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const SizedBox(height: 50,),
              Text('STD : '+studentList[selectIndex].student_standard!.text,style: const TextStyle(fontSize: 20),),
              Text('GR Id : '+studentList[selectIndex].student_grid!.text,style: const TextStyle(fontSize: 20),),
              // Text(' : '+studentList[selectIndex].student_standard!.text,style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() async {
          RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
          ui.Image image=await boundary.toImage();
          ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
          ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
        });
      },child: const Icon(Icons.download),),
    );
  }
}
GlobalKey globalKey=GlobalKey();
