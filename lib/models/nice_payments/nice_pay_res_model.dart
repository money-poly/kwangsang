import 'package:freezed_annotation/freezed_annotation.dart';

part 'nice_pay_res_model.freezed.dart';
part 'nice_pay_res_model.g.dart';

@freezed
class NicePayResModel with _$NicePayResModel {
  factory NicePayResModel({
    @JsonKey(name: 'AuthResultCode') required String authResultCode,
    @JsonKey(name: 'AuthResultMsg') required String authResultMsg,
    @JsonKey(name: 'AuthToken') required String authToken,
    @JsonKey(name: 'PayMethod') required String payMethod,
    @JsonKey(name: 'MID') required String mid,
    @JsonKey(name: 'Moid') required String moid,
    @JsonKey(name: 'Amt') required String amt,
    @JsonKey(name: 'ReqReserved') required String reqReserved,
    @JsonKey(name: 'TxTid') required String txTid,
    @JsonKey(name: 'NextAppURL') required String nextAppUrl,
    @JsonKey(name: 'NetCancelURL') required String netCancelUrl,
    @JsonKey(name: 'Signature') required String signature,
  }) = _NicePayResModel;

  factory NicePayResModel.fromJson(Map<String, dynamic> json) =>
      _$NicePayResModelFromJson(json);
}
