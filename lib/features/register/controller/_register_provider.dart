import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkit/features/register/model/_register_model.dart';

final registerProvider = ChangeNotifierProvider((ref)=>RegisterModel());