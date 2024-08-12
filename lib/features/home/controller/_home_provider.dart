import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkit/features/home/model/_home_model.dart';

final homeProvider = ChangeNotifierProvider((ref)=>HomeModel());