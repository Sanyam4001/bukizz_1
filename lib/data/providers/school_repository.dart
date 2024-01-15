import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/ecommerce/product_model.dart';
import '../models/ecommerce/review_model.dart';
import '../models/ecommerce/school_model.dart';

class SchoolDataProvider extends ChangeNotifier {
  List<SchoolModel> schoolData = [];

  String schoolName = '';
  int schoolIndex = 0;

  SchoolModel get schoolDetails => schoolData[schoolIndex];

  late SchoolModel selectedSchool;

  bool isSchoolDataLoaded = false;

  bool get getIsSchoolDataLoaded => isSchoolDataLoaded;

  setIsSchoolDataLoaded(bool value){
    isSchoolDataLoaded = value;
    notifyListeners();
  }

  void setSchoolName(String name) {
    schoolName = name;
    schoolIndex = schoolData.indexWhere((element) => element.name == name);
    selectedSchool = schoolData[schoolIndex];
    print(schoolIndex);
    notifyListeners();
  }

  //function to add temporary data to schoolData
  void addSchoolData(SchoolModel schoolModel) {
    schoolData.add(schoolModel);
    notifyListeners();
  }

  void schoolTemporaryData() {

    SchoolModel temporarySchool = SchoolModel(
      schoolId: '123',
      name: 'Dr. VSEC Awadhpuri',
      address: '123 Main Street',
      city: 'Sample City',
      state: 'Sample State',
      board: 'CBSE',
      pincode: '123456',
      contactNumber: '9876543210',
      email: 'sample@email.com',
      website: 'www.sampleschool.com',
      logo: 'sample_logo.png',
      banner: 'assets/school/vsec.jpg',
      aboutUs: 'This is a sample school for testing purposes.',
      productsId: [
        'bookset_1_1',
        'bookset_1_2',
      ],
    );

    SchoolModel temporarySchool1 = SchoolModel(
      schoolId: '123',
      name: 'Dr. VSEC Sharda Nagar',
      address: '123 Main Street',
      city: 'Sample City',
      state: 'Sample State',
      board: 'CBSE',
      pincode: '123456',
      contactNumber: '9876543210',
      email: 'sample@email.com',
      website: 'www.sampleschool.com',
      logo: 'sample_logo.png',
      banner: 'assets/school/vsec.jpg',
      aboutUs: 'This is a sample school for testing purposes.',
      productsId: [
        'bookset_1_1',
        'bookset_1_2',
      ],
    );

    addSchoolData(temporarySchool);
    addSchoolData(temporarySchool1);
    notifyListeners();
  }

  void pushRandomData(){
    SchoolModel temporarySchool = SchoolModel(
      schoolId: '123',
      name: 'Dr. VSEC Awadhpuri',
      address: '123 Main Street',
      city: 'Sample City',
      state: 'Sample State',
      board: 'CBSE',
      pincode: '123456',
      contactNumber: '9876543210',
      email: 'sample@email.com',
      website: 'www.sampleschool.com',
      logo: 'sample_logo.png',
      banner: 'https://firebasestorage.googleapis.com/v0/b/bukizz1.appspot.com/o/school_image%2Fschool_2.jpg?alt=media&token=65174ee6-abdf-4aa1-bc82-6cad020845f4',
      aboutUs: 'This is a sample school for testing purposes.',
      productsId: [
        'bookset_1_1',
        'bookset_1_2',
      ],
    );

    FirebaseFirestore.instance.collection('schools').add(temporarySchool.toMap()).then((value) => {
      print('School added successfully')
    }).catchError((error) => {
      print('Failed to add school: $error')
    });
  }

  void loadData() async {
    setIsSchoolDataLoaded(false);
    await FirebaseFirestore.instance
        .collection('schools')
        .get()
        .then((value) => schoolData = value.docs.map((e) => SchoolModel.fromMap(e.data())).toList());

    setIsSchoolDataLoaded(true);
    notifyListeners();
  }

}