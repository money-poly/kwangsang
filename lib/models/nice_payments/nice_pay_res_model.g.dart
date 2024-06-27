// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nice_pay_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NicePayResModelImpl _$$NicePayResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NicePayResModelImpl(
      authResultCode: json['AuthResultCode'] as String,
      authResultMsg: json['AuthResultMsg'] as String,
      authToken: json['AuthToken'] as String,
      payMethod: json['PayMethod'] as String,
      mid: json['MID'] as String,
      moid: json['Moid'] as String,
      amt: json['Amt'] as String,
      reqReserved: json['ReqReserved'] as String,
      txTid: json['TxTid'] as String,
      nextAppUrl: json['NextAppURL'] as String,
      netCancelUrl: json['NetCancelURL'] as String,
      signature: json['Signature'] as String,
    );

Map<String, dynamic> _$$NicePayResModelImplToJson(
        _$NicePayResModelImpl instance) =>
    <String, dynamic>{
      'AuthResultCode': instance.authResultCode,
      'AuthResultMsg': instance.authResultMsg,
      'AuthToken': instance.authToken,
      'PayMethod': instance.payMethod,
      'MID': instance.mid,
      'Moid': instance.moid,
      'Amt': instance.amt,
      'ReqReserved': instance.reqReserved,
      'TxTid': instance.txTid,
      'NextAppURL': instance.nextAppUrl,
      'NetCancelURL': instance.netCancelUrl,
      'Signature': instance.signature,
    };
