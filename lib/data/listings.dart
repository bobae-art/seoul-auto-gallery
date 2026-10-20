/// 서울오토갤러리 매물 1페이지 (시안의 20대)
class CarListing {
  const CarListing({
    required this.id,
    required this.title,
    required this.titleLines,
    required this.spec,
    required this.price,
    required this.time,
    required this.photos,
    required this.seller,
    required this.image,
    this.blurFill = false,
  });

  final int id;
  final String title;
  final int titleLines;
  final String spec;
  /// null 이면 "가격 상담"
  final String? price;
  final String time;
  final int photos;
  final String seller;
  final String image;
  /// 원본처럼 사진 비율이 정사각이 아닐 때 뒤에 블러 채움
  final bool blurFill;

  int? get priceValue =>
      price == null ? null : int.tryParse(price!.replaceAll(',', ''));
  int get year => int.tryParse(spec.substring(0, 4)) ?? 0;
}

const listings = <CarListing>[
  CarListing(id: 1, title: '랜드로버 레인지로버 4세대 5.0 V8 SC LWB SV AB', titleLines: 2, spec: '2019 · 5.2만km · 가솔린', price: null, time: '5분전', photos: 17, seller: '김태규 투제이모터웍스', image: 'car_01.png', blurFill: true),
  CarListing(id: 2, title: 'BMW M3 6세대 M3 xDrive 컴페티션 M', titleLines: 2, spec: '2023 · 2.2만km · 가솔린', price: '9,595', time: '10분전', photos: 20, seller: '박상용 디앤디플러스', image: 'car_02.png', blurFill: true),
  CarListing(id: 3, title: '포르쉐 타이칸 EV', titleLines: 1, spec: '2023 · 3만km · 전기', price: '12,690', time: '17분전', photos: 5, seller: '권재한 서울자동차선물거래소', image: 'car_03.png'),
  CarListing(id: 4, title: '벤츠 GLS클래스 3세대 580 4매틱', titleLines: 1, spec: '2022 · 9.5만km · 가솔린', price: '7,575', time: '24분전', photos: 5, seller: '강홍구 브로엠와이', image: 'car_04.png'),
  CarListing(id: 5, title: '벤츠 GLC클래스 2세대 300 4매틱 쿠페 아방가르드', titleLines: 2, spec: '2024 · 1만km · 가솔린', price: '6,375', time: '31분전', photos: 5, seller: '이기련 점보모빌리티', image: 'car_05.png'),
  CarListing(id: 6, title: '벤츠 E클래스 5세대 E350 4매틱 AMG 라인', titleLines: 2, spec: '2023 · 8.2만km · 가솔린', price: '4,344', time: '38분전', photos: 5, seller: '강홍구 브로엠와이', image: 'car_06.png'),
  CarListing(id: 7, title: '렉서스 RX 4세대 450h', titleLines: 1, spec: '2022 · 3.9만km · 하이브리드', price: '6,200', time: '45분전', photos: 5, seller: '현정훈 브로엠제이', image: 'car_07.png'),
  CarListing(id: 8, title: '벤츠 S클래스 7세대 S350d', titleLines: 1, spec: '2023 · 6.9만km · 디젤', price: '8,145', time: '52분전', photos: 5, seller: '강홍구 브로엠와이', image: 'car_08.png'),
  CarListing(id: 9, title: '벤츠 GLA클래스 45 AMG 4매틱', titleLines: 1, spec: '2018 · 2.3만km · 가솔린', price: '1,724', time: '9분전', photos: 5, seller: '차경민 라프모터스', image: 'car_09.png'),
  CarListing(id: 10, title: '랜드로버 올 뉴 디펜더 90 D250 X다이나믹 SE', titleLines: 2, spec: '2025 · 8천km · 디젤', price: '6,800', time: '16분전', photos: 5, seller: '김현종 디앤디플러스', image: 'car_10.png'),
  CarListing(id: 11, title: 'BMW 7시리즈 6세대 740Li xDrive 디자인 퓨어 엑셀런스', titleLines: 2, spec: '2021 · 7만km · 가솔린', price: '4,985', time: '23분전', photos: 5, seller: '유광정 기억', image: 'car_11.png'),
  CarListing(id: 12, title: '벤츠 E클래스 2세대 E240', titleLines: 1, spec: '2002 · 13.1만km · 가솔린', price: '930', time: '30분전', photos: 5, seller: '김현종 디앤디플러스', image: 'car_12.png'),
  CarListing(id: 13, title: '벤츠 CLS클래스 3세대 450 4매틱', titleLines: 1, spec: '2022 · 4.2만km · 가솔린', price: '5,225', time: '37분전', photos: 5, seller: '강홍구 브로엠와이', image: 'car_13.png'),
  CarListing(id: 14, title: '벤츠 S클래스 7세대 S500L 4매틱', titleLines: 1, spec: '2021 · 7만km · 가솔린', price: '8,050', time: '44분전', photos: 5, seller: '강홍구 브로엠와이', image: 'car_14.png'),
  CarListing(id: 15, title: 'BMW 4시리즈 2세대 쿠페 M440i xDrive', titleLines: 2, spec: '2021 · 5.2만km · 가솔린', price: '4,694', time: '51분전', photos: 5, seller: '박상용 디앤디플러스', image: 'car_15.png'),
  CarListing(id: 16, title: '벤츠 S클래스 7세대 S500L 4매틱', titleLines: 1, spec: '2022 · 2.8만km · 가솔린', price: '9,095', time: '8분전', photos: 5, seller: '강홍구 브로엠와이', image: 'car_16.png'),
  CarListing(id: 17, title: '벤틀리 플라잉스퍼 3세대 4.0 V8', titleLines: 1, spec: '2022 · 5.2만km · 가솔린', price: '19,300', time: '15분전', photos: 5, seller: '공오배 라프모터스', image: 'car_17.png'),
  CarListing(id: 18, title: '재규어 F-타입 쿠페 3.0', titleLines: 1, spec: '2014 · 6.6만km · 가솔린', price: '3,200', time: '22분전', photos: 5, seller: '임재욱 유알모터스', image: 'car_18.png'),
  CarListing(id: 19, title: '랜드로버 올 뉴 디펜더 110 D250 X다이나믹 SE', titleLines: 2, spec: '2026 · 20km · 디젤', price: '8,790', time: '29분전', photos: 5, seller: '조진희 케이씨씨오토모빌', image: 'car_19.png'),
  CarListing(id: 20, title: '포르쉐 마칸 3.0 S 디젤', titleLines: 1, spec: '2016 · 9.2만km · 디젤', price: '2,899', time: '36분전', photos: 5, seller: '손동현 더오토프라임', image: 'car_20.png'),
];

/// 브랜드 레일 (원본 로고 광학 크기 그대로)
class Brand {
  const Brand(this.name, this.count, this.image, this.logoW, this.logoH);
  final String name;
  final int count;
  final String image;
  final double logoW;
  final double logoH;
}

const brands = <Brand>[
  Brand('페라리', 0, 'brand_01.png', 52.8, 33.6),
  Brand('람보르기니', 0, 'brand_02.png', 48.708, 30.996),
  Brand('롤스로이스', 0, 'brand_03.png', 41.8, 26.6),
  Brand('벤틀리', 1, 'brand_04.png', 48.004, 30.548),
  Brand('포르쉐', 2, 'brand_05.png', 41.8, 26.6),
  Brand('벤츠', 11, 'brand_06.png', 50.292, 32.004),
  Brand('맥라렌', 0, 'brand_07.png', 32.12, 20.44),
  Brand('애스턴마틴', 0, 'brand_08.png', 48.004, 30.548),
  Brand('BMW', 3, 'brand_09.png', 50.292, 32.004),
  Brand('마세라티', 0, 'brand_10.png', 50.292, 32.004),
  Brand('아우디', 0, 'brand_11.png', 39.996, 25.452),
  Brand('캐딜락', 0, 'brand_12.png', 35.2, 22.4),
  Brand('테슬라', 0, 'brand_13.png', 44, 28),
  Brand('GMC', 0, 'brand_14.png', 48.004, 30.548),
  Brand('부가티', 0, 'brand_15.png', 33, 21),
  Brand('코닉세그', 0, 'brand_16.png', 41.8, 26.6),
];

enum SortKey { updated, priceLow, priceHigh, yearNew }

extension SortKeyLabel on SortKey {
  String get label => switch (this) {
        SortKey.updated => '업데이트순',
        SortKey.priceLow => '낮은 가격순',
        SortKey.priceHigh => '높은 가격순',
        SortKey.yearNew => '최신 연식순',
      };
}

List<CarListing> sortedListings(SortKey key) {
  final list = [...listings];
  switch (key) {
    case SortKey.updated:
      return list;
    case SortKey.priceLow:
      list.sort((a, b) => (a.priceValue ?? 1 << 30).compareTo(b.priceValue ?? 1 << 30));
    case SortKey.priceHigh:
      list.sort((a, b) => (b.priceValue ?? -1).compareTo(a.priceValue ?? -1));
    case SortKey.yearNew:
      list.sort((a, b) => b.year.compareTo(a.year));
  }
  return list;
}
