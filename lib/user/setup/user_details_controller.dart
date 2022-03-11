import 'package:flutter/cupertino.dart';

final userFirstNameController = TextEditingController();
final userLastNameController = TextEditingController();
final userEmailController = TextEditingController();
final userPhoneController = TextEditingController();
final userAddressController = TextEditingController();
final userDOBController = TextEditingController();
final userBusinessTypeController = TextEditingController();
final userBusinessNameController = TextEditingController();
final userABNNoController = TextEditingController();
final userGSTAcMethodController = TextEditingController();
final userIDVerificatinTypeController = TextEditingController();

clearTextController() {
  userFirstNameController.clear();
  userLastNameController.clear();
  userEmailController.clear();
  userPhoneController.clear();
  userAddressController.clear();
  userDOBController.clear();
  userBusinessTypeController.clear();
  userBusinessNameController.clear();
  userABNNoController.clear();
  userGSTAcMethodController.clear();
  userIDVerificatinTypeController.clear();
}
