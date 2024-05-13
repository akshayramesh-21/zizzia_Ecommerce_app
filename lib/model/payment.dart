import 'dart:convert';

class PaymentModel {
  final String success;
  final Order order;

  PaymentModel({required this.success, required this.order});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      success: json['success'],
      order: Order.fromJson(json),
    );
  }
}

class Order {
  final String id;
  final String entity;
  final int amount;
  final int amountPaid;
  final int amountDue;
  final String currency;
  final String receipt;
  final dynamic offerId;
  final String status;
  final int attempts;
  final List<dynamic> notes;
  final int createdAt;

  Order({
    required this.id,
    required this.entity,
    required this.amount,
    required this.amountPaid,
    required this.amountDue,
    required this.currency,
    required this.receipt,
    required this.offerId,
    required this.status,
    required this.attempts,
    required this.notes,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['order']['id'],
      entity: json['order']['entity'],
      amount: json['order']['amount'],
      amountPaid: json['order']['amount_paid'],
      amountDue: json['order']['amount_due'],
      currency: json['order']['currency'],
      receipt: json['order']['receipt'],
      offerId: json['order']['offer_id'],
      status: json['order']['status'],
      attempts: json['order']['attempts'],
      notes: json['order']['notes'],
      createdAt: json['order']['created_at'],
    );
  }
}

