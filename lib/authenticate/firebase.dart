import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shayo_med/config/config.dart';
import 'package:firebase_core/firebase_core.dart';

//!FETCH FIREBASE CONFIGURATION CONSTRUCTOR.
final configurations = Configurations();

//!CREATE FIREBASE INITIALIZATION
final Future<FirebaseApp> initialization = Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: configurations.apiKey,
        appId: configurations.appId,
        messagingSenderId: configurations.messagingSenderId,
        projectId: configurations.projectId,
        authDomain: configurations.authDomain,
        storageBucket: configurations.storageBucket));

//!CREATE FIREBASE INSTANCES NEEDED FOR THE WEB APP.
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
