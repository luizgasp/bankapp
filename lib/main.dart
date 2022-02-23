import 'package:bankapp/app/shared/core/exports.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Registery.setUp();

  runApp(const MyApp());
}