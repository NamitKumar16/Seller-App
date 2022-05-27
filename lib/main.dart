import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/config/routes.dart';
import 'package:seller_app/core/auth/screens/login.dart';
import 'package:seller_app/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: RouteConstants.LOGIN, // This is the Initial or Base Route
    routes: getRoutes(), // All Routes are loaded Here
  ));
}
