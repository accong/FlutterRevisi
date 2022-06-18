import 'package:tripkuy/core/util/core_function.dart';
import 'package:tripkuy/core/util/debouncer.dart';

import 'response_converter.dart';


class ErrorHandlingResponse {
  late final ResponseConverter responseConverter;
  final bool isPage;
  final bool isPPOB;
  final bool showMessage;

  ErrorHandlingResponse({required this.responseConverter, this.isPage = false, this.isPPOB = false, this.showMessage = true});


  final Debouncer debouncer = Debouncer(delay: const Duration(seconds: 2));

  Future checkErrror() async {
    CoreFunction.logPrint("responseConverter Code", responseConverter.code.toString());
    if ((responseConverter.code ?? -1) >= 400 && (responseConverter.code ?? -1) < 500) {
      // if (responseConverter.code != 406) {
      //   if (!responseConverter.message.toLowerCase().contains("responseConverterpay memiliki akses yang berbeda".toLowerCase()) && responseConverter.code != 428 && !responseConverter.message.toLowerCase().contains("data not available".toLowerCase())) {
      //     responseConverterDialog.showDialogWithoutTitle(navGK.currentContext!, responseConverter.message);
      //   }
      // } else
      if (responseConverter.code == 400) {
      } else if (responseConverter.code == 401) {
        CoreFunction.showToast("Not Authorized");
        debouncer.debounce(() async {
        });
      } else if (responseConverter.code == 402) {
        CoreFunction.showToast(responseConverter.message!, duration: 2);
      } else if (responseConverter.code == 403) {
      } else if (responseConverter.code == 404) {
        CoreFunction.showToast(responseConverter.message ?? "", duration: 2);
      } else if (responseConverter.code == 406) {
      } else if (responseConverter.code == 409) { 
        debouncer.debounce(() {
          // EtekadDialog.forceUpdate();
        });
      } else if (responseConverter.code == 413) { 
      } else if (responseConverter.code == 422) { 
        if(responseConverter.message!.toLowerCase().contains("saldo")){
          // EtekadDialog().dialogTopup();
        }else  if(showMessage){
          CoreFunction.showToast(responseConverter.message ?? "", duration: 2);
        }
      } else if (responseConverter.code == 426) {
      } else if (responseConverter.code == 428) {
      } else {
        CoreFunction.logPrint("Else 400", "Not Handled");
        // return Future.error("${responseConverter.code} Not Handled Properly");
      }
    } else if ((responseConverter.code ?? -1) >= 500) {
      if (responseConverter.code == 503) { 
      } else {
        CoreFunction.showToast("Sedang tidak bisa melakukan transaksi");
      }
    } else {
      // CoreFunction.showToast("Sedang tidak bisa melakukan transaksi");
      if(responseConverter.message != ""){
        CoreFunction.showToast(responseConverter.message!);
      } else {
        CoreFunction.showToast("Sedang tidak bisa melakukan transaksi");
      }
      throw "${responseConverter.code} Not Handled Properly";
    }
  }
}
