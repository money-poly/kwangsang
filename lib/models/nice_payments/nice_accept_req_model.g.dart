// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nice_accept_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NiceAcceptReqModelImpl _$$NiceAcceptReqModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NiceAcceptReqModelImpl(
      tid: json['TID'] as String,
      authToken: json['AuthToken'] as String,
      mid: json['MID'] as String,
      amt: json['Amt'] as String,
      ediDate: json['EdiDate'] as String,
      signData: json['SignData'] as String,
      charSet: json['CharSet'] as String?,
      ediType: json['EdiType'] as String?,
      mallReserved: json['MallReserved'] as String?,
    );

Map<String, dynamic> _$$NiceAcceptReqModelImplToJson(
        _$NiceAcceptReqModelImpl instance) =>
    <String, dynamic>{
      'TID': instance.tid,
      'AuthToken': instance.authToken,
      'MID': instance.mid,
      'Amt': instance.amt,
      'EdiDate': instance.ediDate,
      'SignData': instance.signData,
      'CharSet': instance.charSet,
      'EdiType': instance.ediType,
      'MallReserved': instance.mallReserved,
    };
