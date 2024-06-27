import 'package:freezed_annotation/freezed_annotation.dart';

part 'nice_accept_req_model.freezed.dart';
part 'nice_accept_req_model.g.dart';

@freezed
class NiceAcceptReqModel with _$NiceAcceptReqModel {
  factory NiceAcceptReqModel({
    @JsonKey(name: 'TID') required String tid,
    @JsonKey(name: 'AuthToken') required String authToken,
    @JsonKey(name: 'MID') required String mid,
    @JsonKey(name: 'Amt') required String amt,
    @JsonKey(name: 'EdiDate') required String ediDate,
    @JsonKey(name: 'SignData') required String signData,
    @JsonKey(name: 'CharSet') String? charSet,
    @JsonKey(name: 'EdiType') String? ediType,
    @JsonKey(name: 'MallReserved') String? mallReserved,
  }) = _NiceAcceptReqModel;

  factory NiceAcceptReqModel.fromJson(Map<String, dynamic> json) =>
      _$NiceAcceptReqModelFromJson(json);
}
