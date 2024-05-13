import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';


import 'package:http/http.dart' as http;
import 'package:zizzia_e_commerce/controller/functions/pushNofification/pushclass.dart';
import 'package:zizzia_e_commerce/controller/hive/storing.dart';
import 'package:zizzia_e_commerce/ip/ip.dart';

part 'invoice_download_event.dart';
part 'invoice_download_state.dart';

class InvoiceDownloadBloc
    extends Bloc<InvoiceDownloadEvent, InvoiceDownloadState> {
  InvoiceDownloadBloc() : super(InvoiceDownloadInitial()) {
    on<InvoiceDownload>((event, emit) async {
      emit(InvoiceDownloadLoading());
      log("InvoiceDownloadBloc ${event.orderid}");
      try {
        final token = await tokenGet();
        log("pagination Api inside");

        final response = await http.get(
            Uri.parse('http://$ip:3000/flutter/pdfController/${event.orderid}'),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/pdf',
              'Content-Disposition':
                  'attachment; filename=${event.orderid}.pdf',
            });

        if (response.statusCode == 200) {
          var path =
              "/storage/emulated/0/Download/Invocie ${event.orderid}.pdf";

          var file = File(path);
          await file.writeAsBytes(response.bodyBytes);

          log('${file.writeAsBytes(response.bodyBytes)}');
          await LocalNotificationService().init();

          LocalNotificationService()
              .showNotificationAndroid('invoice', '${event.orderid}');
        }
      } catch (e) {
        "error $e";
      }
    });
  }
}
