// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nice_accept_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NiceAcceptResModelImpl _$$NiceAcceptResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NiceAcceptResModelImpl(
      resultCode: json['ResultCode'] as String,
      resultMsg: json['ResultMsg'] as String,
      amt: json['Amt'] as String,
      mid: json['MID'] as String,
      moid: json['Moid'] as String,
      signature: json['Signature'] as String,
      buyerEmail: json['BuyerEmail'] as String,
      buyerTel: json['BuyerTel'] as String,
      buyerName: json['BuyerName'] as String,
      goodsName: json['GoodsName'] as String,
      tid: json['TID'] as String,
      authCode: json['AuthCode'] as String,
      authDate: json['AuthDate'] as String,
      payMethod: json['PayMethod'] as String,
      mallReserved: json['MallReserved'] as String,
    );

Map<String, dynamic> _$$NiceAcceptResModelImplToJson(
        _$NiceAcceptResModelImpl instance) =>
    <String, dynamic>{
      'ResultCode': instance.resultCode,
      'ResultMsg': instance.resultMsg,
      'Amt': instance.amt,
      'MID': instance.mid,
      'Moid': instance.moid,
      'Signature': instance.signature,
      'BuyerEmail': instance.buyerEmail,
      'BuyerTel': instance.buyerTel,
      'BuyerName': instance.buyerName,
      'GoodsName': instance.goodsName,
      'TID': instance.tid,
      'AuthCode': instance.authCode,
      'AuthDate': instance.authDate,
      'PayMethod': instance.payMethod,
      'MallReserved': instance.mallReserved,
    };
