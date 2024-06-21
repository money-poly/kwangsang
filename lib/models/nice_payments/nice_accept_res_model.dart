class NiceAcceptResModel {
  final String resultCode;
  final String resultMsg;
  final String amt;
  final String mid;
  final String moid;
  final String signature;
  final String buyerEmail;
  final String buyerTel;
  final String buyerName;
  final String goodsName;
  final String tid;
  final String authCode;
  final String authDate;
  final String payMethod;
  final String mallReserved;

  const NiceAcceptResModel({
    required this.resultCode,
    required this.resultMsg,
    required this.amt,
    required this.mid,
    required this.moid,
    required this.signature,
    required this.buyerEmail,
    required this.buyerTel,
    required this.buyerName,
    required this.goodsName,
    required this.tid,
    required this.authCode,
    required this.authDate,
    required this.payMethod,
    required this.mallReserved,
  });

  factory NiceAcceptResModel.fromJson(Map<String, dynamic> json) =>
      NiceAcceptResModel(
        resultCode: json['ResultCode'],
        resultMsg: json['ResultMsg'],
        amt: json['Amt'],
        mid: json['MID'],
        moid: json['Moid'],
        signature: json['Signature'],
        buyerEmail: json['BuyerEmail'],
        buyerTel: json['BuyerTel'],
        buyerName: json['BuyerName'],
        goodsName: json['GoodsName'],
        tid: json['TID'],
        authCode: json['AuthCode'],
        authDate: json['AuthDate'],
        payMethod: json['PayMethod'],
        mallReserved: json['MallReserved'],
      );
}
