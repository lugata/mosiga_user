import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_models.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
User? currentUser;

UserModels? userModelCurrentInfo;
