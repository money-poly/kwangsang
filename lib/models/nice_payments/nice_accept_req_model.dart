class NiceAcceptReqModel {
  final String tid;
  final String authToken;
  final String mid;
  final String amt;
  final String ediDate;
  final String signData;
  final String? charSet;
  final String? ediType;
  final String? mallReserved;

  NiceAcceptReqModel({
    required this.tid,
    required this.authToken,
    required this.mid,
    required this.amt,
    required this.ediDate,
    required this.signData,
    this.charSet,
    this.ediType,
    this.mallReserved,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> res = {};
    res['TID'] = tid;
    res['AuthToken'] = authToken;
    res['MID'] = mid;
    res['Amt'] = amt;
    res['EdiDate'] = ediDate;
    res['SignData'] = signData;
    if (charSet != null) res['CharSet'] = charSet!;
    if (ediType != null) res['EdiType'] = ediType!;
    if (mallReserved != null) res['MallReserved'] = mallReserved!;
    return res;
  }
}
