import 'package:GSEB_Schedule/ViewModel/SSC_Provider/ssc_model.dart';
import 'package:flutter/foundation.dart';

class SSC_Result_Provider with ChangeNotifier {
  SSCResultModel? _sscResult;

  SSCResultModel? get sscResult => _sscResult;

  void setSSCResult(SSCResultModel result) {
    print('method call');
    _sscResult = result;
    notifyListeners();
  }
}
