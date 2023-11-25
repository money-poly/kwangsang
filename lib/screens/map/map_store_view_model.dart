import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immersion_kwangsang/models/menu.dart';
import 'package:immersion_kwangsang/models/store.dart';

class MapStoreViewModel with ChangeNotifier {
  StoreDetail? _store;

  StoreDetail? get store => _store;

  MapStoreViewModel() {
    getStoreDetail();
  }

  Future<void> getStoreDetail() async {
    final tempStore = StoreDetail(
        name: "누구나 홀딱 반한닭",
        category: "치킨",
        dday: "D- 오늘할인",
        address: "서울 강남구 선릉로93길 7",
        latLng: LatLng(37.504317, 127.048913),
        openTime: "11:00",
        closeTime: "22:00",
        minPickUpTime: 14,
        maxPickUpTime: 20,
        phoneNumber: "010-1234-6678",
        menu: [
          Menu(
              name: "양념에 반한닭",
              description: "토마토와 칠리소스로 맛을 낸 양념치킨",
              discountRate: 10,
              price: 20900,
              imgUrl:
                  "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210316_22%2F1615866542833460Bs_JPEG%2FEPYlyuBM9Sd5XP-ChhBTkLev.jpg"),
          Menu(
              name: "쌈닭화히타",
              description: "볶음 야채와 치킨을 또띠아에 싸먹는 멕시칸스타일 쌈닭",
              discountRate: 10,
              price: 24900,
              imgUrl:
                  "https://ldb-phinf.pstatic.net/20211201_276/1638314448912aitj0_JPEG/nKfrwz87arUAxjYhlXPHpU5xo_DIhwSKWohwHmQrhDM%3D.jpg")
        ],
        countryOrigin: "닭가슴살(국내산), 베이컨(호주산), 토마토(국내산), 양상추(중국산), 연어(일본산)",
        notes: [
          "메뉴 사진은 연출된 이미지로 실제 조리된 음식과 다를 수 있습니다.",
          "상단 메뉴 및 가격은 업소에서 제공한 정보를 기준으로 작성되었으며 변동될 수 있습니다.",
          "광생은 상품거래에 대한 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 따라서 광생은 상품 거래정보 및 거래에 대한 책임을 지지 않습니다.",
          "거래 상품에 대한 식품위생상의 모든 책임은 각 매장에 있습니다."
        ],
        imgUrl:
            "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjlfMTgz%2FMDAxNjk4NTEwMjY1NDA0.TXIUE0kN44YEW7157-MRYW98F_7WrBw2h0H2aEX3f24g._2L8gYt0yJnhQcGmxOWiTMtjqps9BZZokPpFVjOKcu0g.JPEG.sandeul20320%2FIMG_4126.jpg");
    _store = tempStore;
    notifyListeners();
  }
}
