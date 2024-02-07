
import 'dart:convert';

import 'package:bukizz_1/constants/constants.dart';
import 'package:bukizz_1/data/models/ecommerce/address/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String orderId;
  String userId;
  String orderDate;
  double totalAmount;
  double saleAmount;
  Address address;
  Map<String , dynamic> cartData;
  String status;
  String reviewId;
  

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.orderDate,
    required this.totalAmount,
    required this.saleAmount,
    required this.cartData,
    required this.address,
    required this.status,
    this.reviewId = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'orderDate': orderDate,
      'totalAmount': totalAmount,
      'saleAmount': saleAmount,
      'cartData': cartData,
      'address': address.toMap(),
      'status': status,
      'reviewId': reviewId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] ?? '',
      userId: map['userId'] ?? '',
      orderDate: map['orderDate'] ?? '',
      totalAmount: map['totalAmount'] ?? 0,
      saleAmount: map['saleAmount'] ?? 0,
      cartData: map['cartData'] ?? {},
      address: Address.fromMap(map['address']),
      status: map['status'] ?? deliveryStatus.Ordered.toString(),
      reviewId: map['reviewId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(Map<String, dynamic> map) => OrderModel.fromMap(map);

  // OrderModel copyWith({
  //   String? orderId,
  //   String? userId,
  //   String? orderDate,
  //   Address? address,
  //   double? totalAmount,
  //   double? saleAmount,
  //   Map<String , Map<String , int>>? cartData,
  //
  // }) {
  //   return OrderModel(
  //     orderId: orderId ?? this.orderId,
  //     userId: userId ?? this.userId,
  //     orderDate: orderDate ?? this.orderDate,
  //     totalAmount: totalAmount ?? this.totalAmount,
  //     saleAmount: saleAmount ?? this.saleAmount,
  //     cartData: cartData ?? this.cartData,
  //     address: address ?? this.address,
  //   );
  // }

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, userId: $userId, orderDate: $orderDate, totalAmount: $totalAmount, cartData: $cartData , address: $address , status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
    other.orderId == orderId &&
    other.userId == userId &&
    other.orderDate == orderDate &&
    other.totalAmount == totalAmount &&
    other.saleAmount == saleAmount &&
    other.cartData == cartData &&
    other.address == address &&
    other.status == status;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
    userId.hashCode ^
    orderDate.hashCode ^
    totalAmount.hashCode ^
    saleAmount.hashCode ^
    address.hashCode ^
    status.hashCode ^
    cartData.hashCode;

  }

  static OrderModel fromSnapshot(DocumentSnapshot snap) {
    return OrderModel(
      orderId: snap['orderId'],
      userId: snap['userId'],
      orderDate: snap['orderDate'],
      totalAmount: snap['totalAmount'],
      saleAmount: snap['saleAmount'],
      cartData: snap['cartData'],
      status: snap['status'],
      address: Address.fromMap(snap['address']),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'orderId': orderId,
      'userId': userId,
      'orderDate': orderDate,
      'totalAmount': totalAmount,
      'saleAmount': saleAmount,
      'cartData': cartData,
      'status': status,
      'address': address,
    };
  }
}

