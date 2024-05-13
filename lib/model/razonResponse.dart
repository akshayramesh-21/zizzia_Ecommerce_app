class RazorpayData {
  final String razorpaySignature;
  final String razorpayOrderId;
  final String razorpayPaymentId;

  RazorpayData({
    required this.razorpaySignature,
    required this.razorpayOrderId,
    required this.razorpayPaymentId,
  });

  factory RazorpayData.fromJson(Map<String, dynamic> json) {
    return RazorpayData(
      razorpaySignature: json['razorpay_signature'],
      razorpayOrderId: json['razorpay_order_id'],
      razorpayPaymentId: json['razorpay_payment_id'],
    );
  }
}