import 'dart:io';

import 'package:core_flutter_exam_2/home/homepage/homescreen.dart';
import 'package:core_flutter_exam_2/utils/globle_values.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details Add'),
          leading: IconButton(
            onPressed: () {
              setState(() {
                bool boolValue=formKey.currentState!.validate();
                if(studentList[selectIndex].student_image!=null)
                  {

                if(boolValue)
                {
                  Navigator.of(context).pop();
                }
                  }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image Most Be Field')));
                  // const ScaffoldMessenger(child: SnackBar(content: ,));
                }
              });
            },icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
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
                  }, icon: const Icon(Icons.camera_alt_rounded),
                  ),
                  IconButton(onPressed: () async {
                    XFile? xfileimage= await imagePicker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      studentList[selectIndex].student_image=File(xfileimage!.path);
                    });
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              bool boolValue=formKey.currentState!.validate();
              if(studentList[selectIndex].student_image!=null)
                {
                  if(boolValue)
                    {
                      Navigator.of(context).pop();
                    }
                }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image Most Be Field')));
                // const ScaffoldMessenger(child: SnackBar(content: ,));
              }
            });
          },child: const Icon(Icons.navigate_next_outlined),
        ),
      ),
    );
  }
}
Padding buildPaddingText({required Text textNameFind,required TextEditingController controllerFind,required TextInputType textInputTypeFind,required FormFieldValidator formFieldValidatorValue,required int maxLengthFind}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      validator: formFieldValidatorValue,
      maxLength: maxLengthFind,
      keyboardType: textInputTypeFind,
      controller: controllerFind,
      decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        label: textNameFind,
      ),
    ),
  );
}
Padding buildPaddingText2({required Text textNameFind,required TextEditingController controllerFind,required TextInputType textInputTypeFind,required FormFieldValidator formFieldValidatorValue}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      validator: (value) {
        if(value!.isEmpty)
          {
            
          }
        // else if(int.parse(value)<12)
        return null;
      },
      keyboardType: textInputTypeFind,
      controller: controllerFind,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        label: textNameFind,
      ),
    ),
  );
}