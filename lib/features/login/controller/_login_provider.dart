import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkit/features/login/model/_login_model.dart';

final loginProver = ChangeNotifierProvider((ref)=>LoginModel());