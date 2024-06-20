
import 'dart:io';
import 'package:flutter/material.dart';
int selectIndex=0;
GlobalKey<FormState> formKey=GlobalKey();
List<StudentListModal> studentList=[];
class StudentListModal
{
  TextEditingController? student_name;
  TextEditingController? student_grid;
  TextEditingController? student_standard;
  File? student_image;
  StudentListModal(
      {this.student_grid,
      this.student_image,
      this.student_name,
      this.student_standard});
}