import 'package:freezed_annotation/freezed_annotation.dart';

part 'nice_accept_res_model.freezed.dart';
part 'nice_accept_res_model.g.dart';

@freezed
class NiceAcceptResModel with _$NiceAcceptResModel {
  factory NiceAcceptResModel({
    @JsonKey(name: 'ResultCode') required String resultCode,
    @JsonKey(name: 'ResultMsg') required String resultMsg,
    @JsonKey(name: 'Amt') required String amt,
    @JsonKey(name: 'MID') required String mid,
    @JsonKey(name: 'Moid') required String moid,
    @JsonKey(name: 'Signature') required String signature,
    @JsonKey(name: 'BuyerEmail') required String buyerEmail,
    @JsonKey(name: 'BuyerTel') required String buyerTel,
    @JsonKey(name: 'BuyerName') required String buyerName,
    @JsonKey(name: 'GoodsName') required String goodsName,
    @JsonKey(name: 'TID') required String tid,
    @JsonKey(name: 'AuthCode') required String authCode,
    @JsonKey(name: 'AuthDate') required String authDate,
    @JsonKey(name: 'PayMethod') required String payMethod,
    @JsonKey(name: 'MallReserved') required String mallReserved,
  }) = _NiceAcceptResModel;

  factory NiceAcceptResModel.fromJson(Map<String, dynamic> json) =>
      _$NiceAcceptResModelFromJson(json);
}
