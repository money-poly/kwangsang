class NicePayResModel {
  final String authResultCode;
  final String authResultMsg;
  final String authToken;
  final String payMethod;
  final String mid;
  final String moid;
  final String amt;
  final String reqReserved;
  final String txTid;
  final String nextAppUrl;
  final String netCancelUrl;
  final String signature;

  const NicePayResModel({
    required this.authResultCode,
    required this.authResultMsg,
    required this.authToken,
    required this.payMethod,
    required this.mid,
    required this.moid,
    required this.amt,
    required this.reqReserved,
    required this.txTid,
    required this.nextAppUrl,
    required this.netCancelUrl,
    required this.signature,
  });

  factory NicePayResModel.fromJson(Map<String, dynamic> json) =>
      NicePayResModel(
        authResultCode: json['AuthResultCode'],
        authResultMsg: json['AuthResultMsg'],
        authToken: json['AuthToken'],
        payMethod: json['PayMethod'],
        mid: json['MID'],
        moid: json['Moid'],
        amt: json['Amt'],
        reqReserved: json['ReqReserved'],
        txTid: json['TxTid'],
        nextAppUrl: json['NextAppURL'],
        netCancelUrl: json['NetCancelURL'],
        signature: json['Signature'],
      );
}
