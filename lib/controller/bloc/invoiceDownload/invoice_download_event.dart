part of 'invoice_download_bloc.dart';

 class InvoiceDownloadEvent {}


 class InvoiceDownload extends InvoiceDownloadEvent {

 final String orderid;

  InvoiceDownload({required this.orderid});


 }

