import 'dart:async';
import 'dart:io';

import 'package:core_flutter_exam_2/utils/globle_values.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../details_page/detailscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // for(int i=0;i<studentList.length;i++)
        //   {
        //     if(studentList[i].student_name!.text==' ')
        //       {
        //         studentList.removeAt(i);
        //       }
        //   }
      });
    },);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: ListView.builder(itemCount: studentList.length,itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue.shade100,
              child: ListTile(
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: (studentList[index].student_image!=null)?FileImage(studentList[index].student_image!):null,
                    ),
                    const SizedBox(width: 10,),
                    Text(studentList[index].student_name!.text,style: const TextStyle(fontWeight: FontWeight.bold),),
                    Text(' / ${studentList[index].student_grid!.text}',),
                  ],
                ),
                subtitle: Row(
                  children: [
                    const SizedBox(width: 50,),
                    Text(studentList[index].student_standard!.text,),
                    TextButton(onPressed: () {
                      setState(() {
                        selectIndex=index;
                        Navigator.of(context).pushNamed('/view');
                      });
                    },child: const Text('View'),)
                  ],
                ),
                trailing: IconButton(onPressed: () {
                  setState(() {
                    // studentList.length;
                    studentList.removeAt(index);
                  });
                }, icon: const Icon(Icons.delete)),
                leading: IconButton(onPressed: () {
                  setState(() {
                    selectIndex=index;
                    showDialog( context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Edit'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 50,
                                      backgroundImage: (studentList[selectIndex].student_image!=null)?FileImage(studentList[selectIndex].student_image!):null,
                                    ),
                                    IconButton(onPressed: () async {
                                      XFile? xfileimage= await imagePicker.pickImage(source: ImageSource.camera);
                                      setState(() {
                                        studentList[selectIndex].student_image=File(xfileimage!.path);
                                      });
                                      Navigator.of(context).pop();
                                    }, icon: const Icon(Icons.camera_alt_rounded),
                                    ),
                                    IconButton(onPressed: () async {
                                      XFile? xfileimage= await imagePicker.pickImage(source: ImageSource.gallery);
                                      setState(() {
                                        studentList[selectIndex].student_image=File(xfileimage!.path);
                                      });
                                      Navigator.of(context).pop();
                                    }, icon: const Icon(Icons.image))
                                  ],
                                ),
                                buildPaddingText(textNameFind: const Text('Enter Grid'), controllerFind: studentList[selectIndex].student_grid!, textInputTypeFind: TextInputType.number, formFieldValidatorValue: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return 'Field Most Required';
                                  }
                                  return null;
                                }, maxLengthFind: 4),
                                buildPaddingText(textNameFind: const Text('Enter Name'), controllerFind: studentList[selectIndex].student_name!, textInputTypeFind: TextInputType.text, formFieldValidatorValue: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return 'Field Most Required';
                                  }
                                  return null;
                                }, maxLengthFind: 20),
                                buildPaddingText(textNameFind: const Text('Enter STD'), controllerFind: studentList[selectIndex].student_standard!, textInputTypeFind: TextInputType.number, formFieldValidatorValue: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return 'Field Most Required';
                                  }
                                  else if(int.parse(value)>12)
                                  {
                                    return '1 To 12th Class Only Enter';
                                  }
                                  return null;
                                }, maxLengthFind: 2),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () {
                            Navigator.of(context).pop();
                            }, child: const Text('Update/Back')),
                          ],
                        );
                    },
                    );
                  });
                },icon: const Icon(Icons.edit),),
              ),
            ),
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
        TextEditingController student_name=TextEditingController();
        TextEditingController student_grid=TextEditingController();
        TextEditingController student_standard=TextEditingController();
        File? student_image;
          studentList.add(StudentListModal(student_grid: student_grid,student_image: student_image,student_name: student_name,student_standard: student_standard));
        selectIndex=studentList.length-1;
        print(selectIndex);
        });
        Navigator.of(context).pushNamed('/detail');
      },child: const Icon(Icons.add),),
    );
  }
}
ImagePicker imagePicker=ImagePicker();
TextEditingController student_name=TextEditingController();
TextEditingController student_grid=TextEditingController();
TextEditingController student_standard=TextEditingController();
File? student_image;