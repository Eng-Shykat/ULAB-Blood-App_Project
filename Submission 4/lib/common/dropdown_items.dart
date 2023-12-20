import 'package:flutter_riverpod/flutter_riverpod.dart';

final genders = [
  'Select',
  'Male',
  'Female',
  'Other',
];

final bloodGroups = [
  'Select',
  'A+',
  'A-',
  'B+',
  'B-',
  'O+',
  'O-',
  'AB+',
  'AB-',
];

final decisionBool = [
  'Select',
  'Yes',
  'No',
];

final urgencyType = [
  'Select',
  'Urgent',
  'Usual',
];

final genderProvider = StateProvider.autoDispose((ref) => genders.first);
final bloodGroupProvider =
    StateProvider.autoDispose((ref) => bloodGroups.first);
final donatedBeforeProvider =
    StateProvider.autoDispose((ref) => decisionBool.first);
final bloodDiseaseProvider =
    StateProvider.autoDispose((ref) => decisionBool.last);
final urgencyTypeProvider =
    StateProvider.autoDispose((ref) => urgencyType.first);
