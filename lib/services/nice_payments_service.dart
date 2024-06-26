import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:immersion_kwangsang/models/nice_payments/nice_accept_req_model.dart';
import 'package:immersion_kwangsang/models/nice_payments/nice_accept_res_model.dart';

// TODO: 클라이언트가 아닌, 서버에서 처리되야 할 내용임.
class NicePaymentsService {
  Future<NiceAcceptResModel> postAcceptPayments({
    required String nextAppUrl,
    required NiceAcceptReqModel reqModel,
  }) async {
    var res = await http.post(
      Uri.parse(nextAppUrl),
      body: reqModel.toJson(),
    );

    print(res.body);

    var resModel = NiceAcceptResModel.fromJson(
      json.decode(res.body),
    );

    return resModel;
  }
}
