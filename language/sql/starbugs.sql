/*
DROP TABLE ITEM;
DROP TABLE MENU;
DROP TABLE category;
CREATE TABLE menu(
    menu_id number primary key,
    menu_name varchar2(20) NOT NULL
);
CREATE TABLE category(
    category_id number,
    menu_id number,
    k_name varchar2(100),
    e_name varchar2(100),
    primary key(category_id,menu_id),
    foreign key(menu_id) references menu(menu_id)
);

CREATE TABLE item(
    item_id number,
    item_name varchar2(100),
    description varchar2(1000),
    item_price number,
    item_img varchar2(300),
    item_kcal number,
    category_id number, -- 왜래키
    menu_id number,     -- 왜래키
    primary key(item_id),
    foreign key(category_id,menu_id)
    references category(category_id,menu_id)
);
/*

-- menu
insert into menu values(1, '음료');
insert into menu values(2, '푸드');
insert into menu values(3, '상품');
-- category
INSERT INTO category values(1, 1, '콜드 브루', 'cold_brew');
INSERT INTO category values(2, 1, '브루드 커피', 'brewed_coffee');
INSERT INTO category values(3, 1, '에스프레소', 'espresso');
INSERT INTO category values(4, 1, '프라푸치노', 'frappuccino');
INSERT INTO category values(5, 1, '블렌디드', 'blended');
INSERT INTO category values(6, 1, '스타벅스 피지오', 'fizzio');
INSERT INTO category values(7, 1, '티(티바나)', 'teavana');
INSERT INTO category values(8, 1, '기타 제조 음료', 'etc_drink');
INSERT INTO category values(9, 1, '스타벅스 주스(병음료)', 'bottle_drink');

INSERT INTO category values(1, 2, '브레드', 'bakery');
INSERT INTO category values(2, 2, '케이크', 'cake');
INSERT INTO category values(3, 2, '샌드위치/샐러드', 'sandwich_salad');
INSERT INTO category values(4, 2, '따뜻한 푸드', 'hot_food');
INSERT INTO category values(5, 2, '아이스크림', 'ice_cream');
INSERT INTO category values(6, 2, '과일/요거트', 'fruit_yogurt');
INSERT INTO category values(7, 2, '스낵/미니 디저트', 'snack_mini_desert');

INSERT INTO category values(1, 3, '머그', 'mug');
INSERT INTO category values(2, 3, '글라스', 'glass');
INSERT INTO category values(3, 3, '플라스틱 텀블러', 'plastic_tumbler');
INSERT INTO category values(4, 3, '스테인리스 텀블러', 'stainless_tumbler');
INSERT INTO category values(5, 3, '보온병', 'vacuum_bottle');
INSERT INTO category values(6, 3, '액세서리', 'accessory');
INSERT INTO category values(7, 3, '커피 용품', 'coffee_tool');
INSERT INTO category values(8, 3, '패키지 티(티바나)', 'package_teavana');

-- item
-- 스타벅스 주스(병음료);
INSERT INTO item values(378, '딸기주스 190ML', '달콤한 국내산 딸기의 과육이 듬뿍 느껴지는 주스', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008070]_20190627152902132.jpg', 100, 9, 1);
INSERT INTO item values(379, '망고주스 190ML', '노랗게 익은 열대과일 망고가 입안 가득 느껴지는 주스', 3200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008061]_20190627152423110.jpg', 112, 9, 1);
INSERT INTO item values(380, '수박주스 190ML', '수박의 시원함과 달콤함이 풍성하게 느껴지는 주스', 9000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[9300000002115]_20190626101440361.jpg', 90, 9, 1);
INSERT INTO item values(381, '케일/사과주스 190ML', '국내산 케일과 사과의 달콤함이 조화로운 녹색 주스', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008072]_20190627153051152.jpg', 135, 9, 1);
INSERT INTO item values(382, '토마토주스 190ML', '국내산 토마토의 풍성한 과육이 듬뿍 담겨있는 주스', 3600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008074]_20190627153254154.jpg', 70, 9, 1);
INSERT INTO item values(383, '한라봉주스 190ML', '새콤달콤한 황금빛 제주 한라봉을 그대로 담아낸 주스', 6000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008055]_20190627152214722.jpg', 88, 9, 1);
INSERT INTO item values(384, '햇사과 주스 190ML', '햇사과 1개 반을 껍질 그대로 착즙한 사과 주스.  달콤새콤한 사과 주스를 신선하게 즐겨 보세요.', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9300000002565]_20191205134634839.jpg', 113, 9, 1);
INSERT INTO item values(385, '블루베리 요거트 190ML', '블루베리 과육이 입안 가득 느껴지는 마시는 요거트', 6700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008063]_20190627152600362.jpg', 155, 9, 1);
INSERT INTO item values(386, '치아씨드 요거트 190ML', '톡톡 터지는 치아 씨드가 입안 가득 느껴지는 마시는 요거트', 2500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[5210008064]_20190627152728521.jpg', 145, 9, 1);

--콜드브루
INSERT INTO item values(250, '초콜릿 블랙 콜드 브루', '달콤한 초콜릿과 정성스레 내린 콜드 브루와의 진한 만남  부드러운 초콜릿 콜드 폼과 콜드 브루가 만나 진한 초콜릿 풍미와 바디감이 입안을 기분 좋게 감싸는, 초콜릿 블랙 콜드브루', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9200000002742]_20200504090457274.jpg', 235, 1, 1);
INSERT INTO item values(251, '코코넛 화이트 콜드 브루', '고소한 코코넛과 정성스레 내린 콜드 브루와의 풍미좋은 만남  코코넛으로 만든 달콤하고 부드러운 크림 폼과 콜드 브루의 감칠맛이 깔끔하게 올라오는,  코코넛 화이트 콜드브루', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002739]_20200403131524542.jpg', 415, 1, 1);
INSERT INTO item values(252, '나이트로 쇼콜라 클라우드', '초콜릿과 견과류의 풍미, 초콜릿 파우더 토핑, 하프/하프 샷  부드럽고 달콤한 새로운 나이트로 콜드 브루', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9200000001275]_20180409150826087.jpg', 55, 1, 1);
INSERT INTO item values(253, '나이트로 콜드 브루', '나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마!  부드러운 목 넘김과 완벽한 밸런스에 커피 본연의 단맛을 경험할 수 있습니다.  ', 5400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/03/[9200000000479]_20170328134443491.jpg', 5, 1, 1);
INSERT INTO item values(254, '돌체 콜드 브루', '무더운 여름철,   동남아 휴가지에서 즐기는 커피를 떠오르게 하는   스타벅스 음료의 베스트 x 베스트 조합인  돌체 콜드 브루를 만나보세요! ', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9200000002081]_20190409153909754.jpg', 265, 1, 1);
INSERT INTO item values(255, '바닐라 크림 콜드 브루', '콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/04/[9200000000487]_20170405152830656.jpg', 125, 1, 1);
INSERT INTO item values(256, '제주 비자림 콜드 브루', '[제주지역 한정음료] 제주 천년의 숲 비자림을 연상시키는   음료로 제주에서 유기농 말차로 만든   파우더와 Cold Brew를 활용한 음료.  더욱 시원하고 새로운 Cold Brew를 제주에서 즐겨보세요.', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002672]_20200220135658603.jpg', 340, 1, 1);
INSERT INTO item values(257, '콜드 브루', '스타벅스 바리스타의 정성으로 탄생한 콜드 브루!    콜드 브루 전용 원두를 차가운 물로 14시간 동안 추출하여 한정된 양만 제공됩니다.  깊은 풍미의 새로운 커피 경험을 즐겨보세요.', 1800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/04/[9200000000038]_20160408135802583.jpg', 5, 1, 1);
INSERT INTO item values(258, '콜드 브루 몰트', '[리저브 전용음료] 리저브 콜드 브루, 바닐라 아이스크림, 몰트가 블렌딩된 리저브만의 쉐이크  ', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/07/[9200000001636]_20180726125512959.jpg', 510, 1, 1);
INSERT INTO item values(259, '콜드 브루 플로트', '[리저브 전용음료] 리저브 콜드 브루 위에 녹아 내리는 한 스쿱의 바닐라 아이스크림', 4900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/07/[9200000001635]_20180726125607716.jpg', 230, 1, 1);

--브루드 커피
INSERT INTO item values(260, '아이스 커피', '깔끔하고 상큼함이 특징인 시원한 아이스 커피', 5900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[106509]_20150724164325806.jpg', 5, 2, 1);
INSERT INTO item values(261, '오늘의 커피', '신선하게 브루드(Brewed)되어 원두의 다양함이 살아있는 커피', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[2]_20150724164438965.jpg', 5, 2, 1);

--에스프레소
INSERT INTO item values(262, '블론드 바닐라 더블 샷 마키아또', '블론드 에스프레소 2샷에 흑당 시럽과 바닐라 크림이 부드럽고 달콤하게 어우리진 마키아또 타입의 음료를 즐겨 보세요!', 3300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002950]_20200416142151248.jpg', 315, 3, 1);
INSERT INTO item values(263, '아이스 블론드 바닐라 더블 샷 마키아또', '블론드 에스프레소 2샷에 흑당 시럽과 바닐라 크림이 부드럽고 달콤하게 어우리진 마키아또 타입의 음료를 즐겨 보세요!', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002953]_20200416142415416.jpg', 195, 3, 1);
INSERT INTO item values(264, '에스프레소 콘 파나', '에스프레소 샷에 풍부한 휘핑크림을 얹은 강렬하고 달콤한 음료', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[30]_20150813221811035.jpg', 30, 3, 1);
INSERT INTO item values(265, '에스프레소 마키아또', '강렬한 에스프레소 위에 소량의 우유 거품이 얹어진 음료', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[25]_20150813221101511.jpg', 10, 3, 1);
INSERT INTO item values(266, '아이스 카페 아메리카노', '강렬한 에스프레소 샷에 시원한 물의 조화', 8600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg', 10, 3, 1);
INSERT INTO item values(267, '카페 아메리카노', '강렬한 에스프레소 샷에 뜨거운 물의 조화', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg', 10, 3, 1);
INSERT INTO item values(268, '블론드 카라멜 클라우드 마키아또', '블론드 에스프레소 위에 부드러운 클라우드 콜드 폼, 달콤한 카라멜 드리즐로 완성한 블론드 카라멜 클라우드 마키아또를 즐겨보세요!   ', 6200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9200000002585]_20191111140325180.jpg', 250, 3, 1);
INSERT INTO item values(269, '블론드 코코아 클라우드 마키아또', '블론드 에스프레소에 부드러운 클라우드 콜드 폼, 코코아 드리즐로 완성한 블론드 코코아 클라우드를 즐겨보세요!', 8900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9200000002589]_20191111140503004.jpg', 255, 3, 1);
INSERT INTO item values(270, '아이스 블론드 카라멜 클라우드 마키아또', '블론드 에스프레소 위에 부드러운 클라우드 콜드 폼, 달콤한 카라멜 드리즐로 완성한 블론드 카라멜 클라우드 마키아또를 즐겨보세요! ', 4500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9200000002587]_20191111140424935.jpg', 215, 3, 1);
INSERT INTO item values(271, '아이스 블론드 코코아 클라우드 마키아또', '블론드 에스프레소에 부드러운 클라우드 콜드 폼, 코코아 드리즐로 완성한 블론드 코코아 클라우드를 즐겨보세요!', 7600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9200000002591]_20191111140547107.jpg', 220, 3, 1);
INSERT INTO item values(272, '아이스 카라멜 마키아또', '바닐라 시럽, 시원한 우유에 얼음과 에스프레소 샷, 카라멜 드리즐이 어우러진 음료', 2800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110582]_20150803101947329.jpg', 190, 3, 1);
INSERT INTO item values(273, '카라멜 마키아또', '바닐라 시럽과 우유, 그리고 그 위에 얹어진 에스프레소 샷과 달콤한 카라멜 드리즐의 조화', 8700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[126197]_20150813215717145.jpg', 200, 3, 1);
INSERT INTO item values(274, '아이스 카푸치노', '에스프레소 샷과 시원한 우유에 부드러운 우유 거품이 얹어진 시원한 음료.', 1800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110601]_20150803101741931.jpg', 115, 3, 1);
INSERT INTO item values(275, '카푸치노', '벨벳같은 우유 거품과 에스프레소 샷의 절묘한 조화!', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[38]_20150821164230205.jpg', 110, 3, 1);
INSERT INTO item values(276, '라벤더 카페 브레베', '[더종로R,청담스타R,한강진역R,홍대입구역사거리R,이대R 전용음료] 블랙이글로 추출한 리저브 에스프레소 샷과 은은한 라벤더향이 고급스럽게 어우러진 리저브 특화음료입니다.', 3200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/12/[9200000000432]_20161213140957549.jpg', 406, 3, 1);
INSERT INTO item values(277, '럼 샷 코르타도', '[더종로R,청담스타R,한강진역R,홍대입구역사거리R 전용음료] 최고의 리저브 에스프레소 샷, 스팀 밀크 그리고 럼이 짙게 어우러진 스타벅스 리저브 만의 코르타도입니다.', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/12/[9200000001086]_20171218135157757.jpg', 70, 3, 1);
INSERT INTO item values(278, '스타벅스 돌체 라떼', '깊은 에스프레소와 깔끔한 무지방 우유가 어우러진 달콤한 음료.', 4200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[128692]_20150723020548334.jpg', 255, 3, 1);
INSERT INTO item values(279, '아이스 라벤더 카페 브레베', '[더종로R,청담스타R,한강진역R,홍대입구역사거리R,이대R 전용음료] 블랙이글로 추출한 리저브 에스프레소 샷과 은은한 라벤더향이 고급스럽게 어우러진 리저브 특화음료입니다.', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/12/[9200000000433]_20161213162207565.jpg', 335, 3, 1);
INSERT INTO item values(280, '아이스 스타벅스 돌체 라떼', '커피 향과 부드러움의 조화가 아주 멋진 아이스 커피 입니다.', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[128695]_20150803100201827.jpg', 230, 3, 1);
INSERT INTO item values(281, '아이스 카페 라떼', '에스프레소 샷과 시원한 우유와 얼음으로 고소한 음료.', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110569]_20150813221315558.jpg', 110, 3, 1);
INSERT INTO item values(282, '카페 라떼', '에스프레소 샷과 따뜻한 우유와 거품으로 마무리된 음료.', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[41]_20150813221357067.jpg', 180, 3, 1);
INSERT INTO item values(283, '아이스 카페 모카', '모카시럽과 시원한 우유에 휘핑크림이 토핑된 에스프레소 음료.', 9400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110566]_20150813221545188.jpg', 250, 3, 1);
INSERT INTO item values(284, '아이스 화이트 초콜릿 모카', '화이트 초콜릿과 시원한 우유가 첨가된 에스프레소 음료.', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110572]_20150803102719365.jpg', 350, 3, 1);
INSERT INTO item values(285, '카페 모카', '모카시럽과 스팀밀크에 휘핑크림이 토핑된 에스프레소.', 9400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[46]_20150803105114955.jpg', 290, 3, 1);
INSERT INTO item values(286, '화이트 초콜릿 모카', '화이트 초콜릿과 스팀밀크가 첨가된 에스프레소 음료.', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[128192]_20150803101501786.jpg', 390, 3, 1);
INSERT INTO item values(287, '바닐라 플랫 화이트', '스타벅스 리스트레토 샷과 향긋한 바닐라 풍미가 더해진 진하고 달콤한 음료.', 3800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/09/[9200000002406]_20190917152957175.jpg', 220, 3, 1);
INSERT INTO item values(288, '바닐라 스타벅스 더블 샷', '신선하게 제조된 더블 샷 믹스에 바닐라 시럽을 넣고 에스프레소 샷, 얼음이 어우러져 핸드 쉐이킹한 음료입니다.', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/10/[110612]_20181022143635372.jpg', 125, 3, 1);
INSERT INTO item values(289, '블론드 리스트레토 마키아또', '블론드 에스프레소의 달콤하고 시트러스한 풍미의 매력을 블론드 리스트레토 마키아또로 즐겨보세요!', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9200000002191]_20190415144850770.jpg', 265, 3, 1);
INSERT INTO item values(290, '블론드 에스프레소 토닉', '블론드 에스프레소와 시트러스한 풍미의 토닉 워터가 어우러진 블론드 에스프레소 토닉을 상쾌하게 즐겨보세요!', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9200000002188]_20190415144717699.jpg', 80, 3, 1);
INSERT INTO item values(291, '아이스 블론드 리스트레토 마키아또', '블론드 에스프레소의 달콤하고 시트러스한 풍미의 매력을 아이스 블론드 리스트레토 마키아또로 즐겨보세요!', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9200000002194]_20190415144953485.jpg', 215, 3, 1);
INSERT INTO item values(292, '에스프레소', '스타벅스의 핵심인 강렬하고 카라멜향이 달콤한 음료', 2900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[20]_20150813221922860.jpg', 5, 3, 1);
INSERT INTO item values(293, '커피 스타벅스 더블 샷', '신선하게 제조된 더블 샷 믹스에 클래식 시럽을 넣고 에스프레소 샷, 얼음이 어우러져 핸드 쉐이킹한 음료입니다.', 8800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[110611]_20150813220251546.jpg', 125, 3, 1);
INSERT INTO item values(294, '클래식 아포가토', '[리저브R 매장 전용음료] 리저브 에스프레소 투 샷이 바닐라 아이스크림과 진하게 어우러진 정통 아포가토', 2200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/07/[9200000001631]_20180726125701682.jpg', 240, 3, 1);
INSERT INTO item values(295, '헤이즐넛 스타벅스 더블 샷', '신선하게 제조된 더블 샷 믹스에 헤이즐넛 시럽을 넣고 에스프레소 샷, 얼음이 어우러져 핸드 쉐이킹한 음료입니다.', 8100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/10/[110614]_20181022143713148.jpg', 125, 3, 1);

--프라푸치노
INSERT INTO item values(296, '더블 에스프레소 칩 프라푸치노', '리스트레토 에스프레소 2샷과 에스프레소 칩, 하프앤하프가   달고 진하고 어우러진 커피의 기본에 충실한   더블 에스프레소 칩 프라푸치노를 만나보세요.', 3500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/06/[9200000002760]_20200608092704235.jpg', 265, 4, 1);
INSERT INTO item values(297, '블랙 와플칩 크림 프라푸치노', '블랙 와플칩 쿠키를 통째로 갈아서 만든 매력만점 프라푸치노!  시크한 블랙 와플과 부드러운 크림 프라푸치노가 어우러진,   겉은 시크하지만 속은 부드러운 반전매력 블랙 와플칩 크림 프라푸치노', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002745]_20200403132226629.jpg', 455, 4, 1);
INSERT INTO item values(298, '모카 프라푸치노', '초콜릿, 커피와 얼음이 갈린 음료에 휘핑크림이 토핑된 음료.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 7800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168004]_20150813221231839.jpg', 280, 4, 1);
INSERT INTO item values(299, '에스프레소 프라푸치노', '에스프레소의 강렬함과 약간의 단맛을 시원하게 즐기는 프라푸치노.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 4500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168007]_20150813222212580.jpg', 140, 4, 1);
INSERT INTO item values(300, '자바 칩 프라푸치노', '커피 프라푸치노에 초콜릿, 초콜릿 칩이 첨가된 아이스 블렌드로 달콤 아삭한 음료.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168016]_20150813231001795.jpg', 340, 4, 1);
INSERT INTO item values(301, '카라멜 프라푸치노', '카라멜 시럽이 더해진 커피 프라푸치노에 휘핑 크림, 카라멜이 장식된 음료.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168010]_20150813220355957.jpg', 300, 4, 1);
INSERT INTO item values(302, '화이트 초콜릿 모카 프라푸치노', '화이트 초콜릿, 커피와 우유가 조합된 아이스 블렌드로 휘핑크림이 토핑된 음료.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 2100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168013]_20150806153343152.jpg', 320, 4, 1);
INSERT INTO item values(303, '바닐라 크림 프라푸치노', '우유에 바닐라향이 조합된 아이스 블렌드로 휘핑크림이 토핑된 음료.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 9400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168054]_20150813220927225.jpg', 310, 4, 1);
INSERT INTO item values(304, '제주 까망 크림 프라푸치노', '[제주지역 한정음료] 제주 까망 라떼의 프라푸치노 버전으로   쫄깃한 국내산 흑임자 떡과 블랙 소보로 토핑으로   컵빙수처럼 먹는 음료. 고소한 국내산 흑임자와   쫄깃한 국내산 흑임자 떡, 달콤한 블랙 소보로 토핑으로   제주의 돌 하르방 길을 느껴보세요.', 3100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9200000002088]_20190221165617615.jpg', 600, 4, 1);
INSERT INTO item values(305, '제주 쑥떡 크림 프라푸치노', '[제주지역 한정음료] 제주 쑥쑥 라떼의 시원한 버전으로   쫄깃쫄깃한 국내산 흑임자 떡으로   씹는 재미를 즐길 수 있는 음료.   제주 쑥과 국내산 흑임자 떡으로 제주 오름길을 느껴보세요.', 8100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9200000002090]_20190221165833026.jpg', 460, 4, 1);
INSERT INTO item values(306, '제주 유기농 말차로 만든 크림 프라푸치노', '깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 제주 유기농 말차로 만든 크림 프라푸치노를 만나보세요.', 6000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9200000002502]_20191227095721734.jpg', 185, 4, 1);
INSERT INTO item values(307, '제주 청보리 크림 프라푸치노', '[제주지역 한정음료] 제주 바람의 숲 가파도를 연상시키는  음료로 청보리의 풋풋하고 고소함이 함께 느껴지는 음료  제주 청보리 크림 프라푸치노로   더욱 시원하게 가파도 길을 느껴보세요.', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002668]_20200220135328813.jpg', 385, 4, 1);
INSERT INTO item values(308, '초콜릿 크림 칩 프라푸치노', '모카시럽과 자바칩이 혼합된 크림 프라푸치노로 휘핑크림, 초콜렛 드리즐된 음료.  라이트 프라푸치노용 시럽 선택 가능-Tall 사이즈 기준, 25% 이상 줄어든 저당(Low Sugar)으로 즐기실 수 있습니다.', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[168066]_20150806163214398.jpg', 370, 4, 1);
INSERT INTO item values(309, '피스타치오 크림 프라푸치노', '스타벅스에 없던 새로운 맛,  젤라또를 먹는 듯한 크리미함과 고소함이 극에 달한   피스타치오 크림 프라푸치노를 만나보세요.', 9700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002763]_20200416143004017.jpg', 355, 4, 1);
INSERT INTO item values(310, '화이트 딸기 크림 프라푸치노', '달콤한 딸기 음료의 새로운 버전.  딸기에 눈이 소복이 쌓인 것 같은 비주얼에 풍부한 딸기 맛을  가볍게 즐길 수 있는 누구나 좋아하는 딸기 음료.  바닐라 크림 베이스로 더욱 깊은 딸기의 맛과 풍미를 즐겨보세요', 6300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9200000002161]_20190423145431273.jpg', 360, 4, 1);
INSERT INTO item values(311, '화이트 타이거 프라푸치노', '밀크 쉐이크 같은 부드럽고 달콤한 바닐라 크림 프라푸치노에 깊은 풍미의 단맛을 가진 흑당시럽이 어우러져 용인에버랜드 백호의 줄무늬를 형상화한 부드럽고 달콤한 프라푸치노    * 용인에버랜드R 매장에서만 판매하는 음료입니다', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9200000002403]_20190711125729583.jpg', 410, 4, 1);

-- 블렌디드
INSERT INTO item values(312, '망고 패션 후르츠 블렌디드', '진한 블랙 티에 망고 패션 후르츠 주스가 조합된 아이스 블렌드 음료', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[167004]_20160902191636876.jpg', 120, 5, 1);
INSERT INTO item values(313, '딸기 요거트 블렌디드', '딸기와 요거트의 상큼함이 가득 느껴지는 가벼운 컨셉의 블렌디드 음료입니다.', 8900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/04/[9200000000044]_20160415132044350.jpg', 250, 5, 1);
INSERT INTO item values(314, '망고 바나나 블렌디드', '인기 음료인 망고 패션후르츠 블렌디드에 신선한 바나나 1개가 통째로 들어간 달콤한 프라푸치노', 3600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[169001]_20150723022552783.jpg', 270, 5, 1);
INSERT INTO item values(315, '애플망고 요거트 블렌디드', '말랑한 애플망고 과육과 유산균이 살아있는 부드러운 요거트가  산뜻하게 어우러진 애플망고 요거트 블렌디드를 만나보세요.', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/06/[9200000000032]_20200608092253076.jpg', 315, 5, 1);
INSERT INTO item values(316, '익스트림 티 블렌디드', '시트러스한 베이스의 블렌디드에 매력적인 히비스커스 티(패션탱고티)가 어우러져 상큼함이 입안을 가득 채우는 익스트림 티 블렌디드    * 용인에버랜드R 매장에서만 판매하는 음료입니다', 5400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9200000002404]_20190711125823564.jpg', 200, 5, 1);
INSERT INTO item values(317, '자몽 셔벗 블렌디드', '상큼함으로 끝까지 시원한 자몽 셔벗 블렌디드!  달콤 쌉싸름한 자몽과 상큼한 레모네이드가 얼음과 만나  셔벗처럼 가볍고 시원하게 즐길 수 있는 블렌디드 음료.', 2500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9200000002153]_20190423145048056.jpg', 225, 5, 1);
INSERT INTO item values(318, '제주 레드 빈 블렌디드', '[제주지역 한정음료] 제주 화산송이를 형상화한 음료로  국내산 레드 빈으로 표현한 뉴트로 음료로 고급진 레드 빈의 맛을  제주 스타벅스에서 더욱 시원하게 즐겨보세요.', 2100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002671]_20200220135607970.jpg', 530, 5, 1);
INSERT INTO item values(319, '제주 한라봉 블랙 티 블렌디드', '[제주지역 한정음료] 제주 공원에서 볼 수 있는 튤립을  연상시키는 상큼한 타입의 티 블렌디드 음료.  제주 한라봉 베이스와 블랙 티가 만나 상큼한 티 블렌디드를  제주 스타벅스에서 즐겨보세요.', 1800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002673]_20200220135746232.jpg', 445, 5, 1);
INSERT INTO item values(320, '피치/레몬 블렌디드', '달콤한 복숭아와 새콤한 레몬, 말랑한 복숭아 젤리가 만난   맑고 청량한 피치/레몬 블렌디드로 올 여름을 맞이해보세요.', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002766]_20200416143123638.jpg', 190, 5, 1);

-- 스타벅스 피지오
INSERT INTO item values(321, '매직 팝 스플래쉬 피지오', '신비한 보라색의 피지오가 팝시클이 녹으면서 핑크색으로 점차 변하며 마법이 일어난 것 같은 피지오 음료    * 용인에버랜드R 매장에서만 판매하는 음료입니다', 1900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9200000002402]_20190711125640433.jpg', 320, 6, 1);
INSERT INTO item values(322, '블랙 티 레모네이드 피지오', '블랙 티와 상큼한 레모네이드를 스파클링한 시원하고 청량감 있는 음료입니다.', 6000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[107025]_20160905095924499.jpg', 65, 6, 1);
INSERT INTO item values(323, '쿨 라임 피지오', '그린 빈 추출액이 들어간 라임 베이스에 건조된 라임 슬라이스를 넣고 스파클링한 시원하고 청량감 있는 음료입니다. (카페인이 함유된 탄산음료입니다)', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[107051]_20150804111927300.jpg', 100, 6, 1);
INSERT INTO item values(324, '패션 탱고 티 레모네이드 피지오', '패션 티와 상큼한 레모네이드를 스파클링한 시원하고 청량감 있는 음료입니다.', 9400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[107031]_20160905102946365.jpg', 65, 6, 1);
INSERT INTO item values(325, '핑크 자몽 피지오', '신선하게 착즙한 자몽이 스타벅스 만의 수제 탄산음료로 선보입니다.  핑크빛의 생자몽으로 아름다운 비주얼과 신선함을 느껴 보세요. ', 9600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/06/[9200000001321]_20180601160716804.jpg', 185, 6, 1);

-- 티(티바나);
INSERT INTO item values(326, '피치 젤리 핫 티', '은은한 블랙 티에 복숭아의 풍미를 가득 담은 여름 음료의 대명사 아이스 티.  쫀득한 젤리의 질감으로 입 안에서 가득 퍼지는  스타벅스의 달콤하고 깔끔한 아이스 티를 선사합니다.(Hot Tea로도 즐길 수 있습니다.)', 2500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002754]_20200403132406524.jpg', 190, 7, 1);
INSERT INTO item values(327, '피치 젤리 아이스 티', '은은한 블랙 티에 복숭아의 풍미를 가득 담은 여름 음료의 대명사 아이스 티.  쫀득한 젤리의 질감으로 입 안에서 가득 퍼지는  스타벅스의 달콤하고 깔끔한 아이스 티를 선사합니다.(Hot Tea로도 즐길 수 있습니다.)', 3500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002757]_20200403132717643.jpg', 120, 7, 1);
INSERT INTO item values(328, '그랜마 애플 블랙 티', '잉글리쉬 브렉퍼스트 티와 신선한 사과, 시나몬과 레몬의 가벼운 터치가  마치 할머니의 비밀 레시피같은 묘한 매력의 그랜마 애플 블랙 티를 소개합니다.    오직, Teavana Bar 매장에서만 만날 수 있습니다.', 7100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9200000001929]_20181226180215735.jpg', 230, 7, 1);
INSERT INTO item values(329, '라임 패션 티', '새콤달콤한 히비스커스와 라임의   이국적인 조화가 매력적인 라임 패션 티를 만나보세요!', 3800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/01/[9200000001931]_20190114160428938.jpg', 140, 7, 1);
INSERT INTO item values(330, '민트 블렌드 티', '스피어민트, 페퍼민트, 레몬버베나가 블렌딩된 상쾌한 허브 티 입니다.', 3700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000056]_20160905095218258.jpg', 0, 7, 1);
INSERT INTO item values(331, '아이스 그랜마 애플 블랙 티', '잉글리쉬 브렉퍼스트 티와 신선한 사과, 시나몬과 레몬의 가벼운 터치가  마치 할머니의 비밀 레시피같은 묘한 매력의 그랜마 애플 블랙 티를 소개합니다.    오직, Teavana Bar 매장에서만 만날 수 있습니다.', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9200000001930]_20181226180250802.jpg', 230, 7, 1);
INSERT INTO item values(332, '아이스 라임 패션 티', '새콤달콤한 히비스커스와 라임의   이국적인 조화가 매력적인 라임 패션 티를 만나보세요!', 4800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/01/[9200000001933]_20190114160516770.jpg', 90, 7, 1);
INSERT INTO item values(333, '아이스 민트 블렌드 티', '스피어민트, 페퍼민트, 레몬버베나가 블렌딩된 상쾌한 허브 티 입니다.  (약 5분 정도의 티 추출 시간이 소요됩니다.)', 4600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000059]_20160905100053415.jpg', 0, 7, 1);
INSERT INTO item values(334, '아이스 얼 그레이 티', '시원하게 즐기는 뜨거운 물에 우려내 라벤더 향이 특징적인 향긋한 블랙 티   (약 5분 정도의 티 추출 시간이 소요됩니다.)', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000039]_20160905100330507.jpg', 0, 7, 1);
INSERT INTO item values(335, '아이스 유스베리 티', '아사이베리, 히비스커스, 장미 꽃잎의 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 화이트 티 입니다.', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9200000000229]_20160905094710340.jpg', 0, 7, 1);
INSERT INTO item values(405, '매콤 소시지 불고기 베이크', '할라피뇨로 매콤한 맛을 낸 소시지 불고기 베이크입니다.', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002227]_20190711130912353.jpg', 246, 7, 1);
INSERT INTO item values(336, '아이스 유자 민트 티', '달콤한 유자와 알싸하고 은은한 진저,   우릴 수록 상쾌한 민트 티가 조화로운 유자 민트 티.  오직 티바나 바 매장에서만 만날 수 있습니다.', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9200000002574]_20191024172411435.jpg', 130, 7, 1);
INSERT INTO item values(337, '아이스 잉글리쉬 브렉퍼스트 티', '인도 아삼, 스리랑카 실론, 중국의 홍차가 블렌딩 된 깊고 그윽한 블랙 티 입니다.  (약 5분 정도의 티 추출 시간이 소요됩니다.)', 2800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000019]_20160905100755199.jpg', 0, 7, 1);
INSERT INTO item values(338, '아이스 제주 유기 녹차', '우수한 품질의 제주도 산 유기 녹차로만 이루어져 맑은 수색과 신선한 향, 맛이 뛰어난 녹차 입니다.  (약 3분 정도의 티 추출 시간이 소요됩니다.)', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[400400000094]_20160905100927563.jpg', 0, 7, 1);
INSERT INTO item values(339, '아이스 차이 티', '진저, 카르다몸, 이국적인 풍미의 시나몬 등이 블렌딩된 블랙 티 입니다.  (약 5분 정도의 티 추출 시간이 소요됩니다.)', 2900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000049]_20160905101031293.jpg', 0, 7, 1);
INSERT INTO item values(340, '아이스 캐모마일 블렌드 티', '캐모마일과 라벤더의 부드러운 꽃향이 어우러진 허브 티 입니다.  (약 5분 정도의 티 추출 시간이 소요됩니다.)', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000079]_20160905101225299.jpg', 0, 7, 1);
INSERT INTO item values(341, '아이스 히비스커스 블렌드 티', '히비스커스, 사과의 풍부한 산미, 레몬그라스 등이 블렌딩된 허브 티 입니다.  (약 5분 정도의 티 추출 시간이 소요됩니다.)', 8900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000069]_20160905101347323.jpg', 0, 7, 1);
INSERT INTO item values(342, '얼 그레이 티', '부드러운 얼 그레이에 라벤더 향이 특징적인 향긋한 블랙 티', 3800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000036]_20160905101609254.jpg', 0, 7, 1);
INSERT INTO item values(343, '유스베리 티', '아사이베리, 히비스커스, 장미 꽃잎의 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 화이트 티 입니다.', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9200000000226]_20160902191950457.jpg', 0, 7, 1);
INSERT INTO item values(344, '유자 민트 티', '달콤한 유자와 알싸하고 은은한 진저,   우릴 수록 상쾌한 민트 티가 조화로운 유자 민트 티.  오직 티바나 바 매장에서만 만날 수 있습니다.', 3300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9200000002572]_20191024172324356.jpg', 260, 7, 1);
INSERT INTO item values(345, '잉글리쉬 브렉퍼스트 티', '인도 아삼, 스리랑카 실론, 중국의 홍차가 블렌딩 된 깊고 그윽한 블랙 티 입니다.', 8500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000016]_20160905101803555.jpg', 0, 7, 1);
INSERT INTO item values(346, '자몽 허니 블랙 티', '새콤달콤한 자몽과 꿀이 깊고 그윽한 풍미의 스타벅스 티바나의 블랙 티와 만났습니다. 화려한 색감과 톡 쏘는 상큼함이 더해진 스타벅스의 새로운 티 음료입니다.', 3600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/08/[9200000000187]_20160831101015864.jpg', 125, 7, 1);
INSERT INTO item values(347, '제주 유기 녹차', '우수한 품질의 제주도 산 유기 녹차로만 이루어져 맑은 수색과 신선한 향, 맛이 뛰어난 녹차 입니다.', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[400400000091]_20160905101907097.jpg', 0, 7, 1);
INSERT INTO item values(348, '차이 티', '진저, 카르다몸, 이국적인 풍미의 시나몬 등이 블렌딩된 블랙 티 입니다.', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000046]_20160905102520559.jpg', 0, 7, 1);
INSERT INTO item values(349, '캐모마일 블렌드 티', '캐모마일과 라벤더의 부드러운 꽃향이 어우러진 허브 티 입니다.', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000076]_20160905102720278.jpg', 0, 7, 1);
INSERT INTO item values(350, '히비스커스 블렌드 티', '히비스커스, 사과의 풍부한 산미, 레몬그라스 등이 블렌딩된 허브 티 입니다.', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[4004000000066]_20160905103109675.jpg', 0, 7, 1);
INSERT INTO item values(351, '말차 레모네이드 프로즌 티', '제주도에서 유기농으로 재배한 어릿 녹찻잎으로 만든  국내 최고등급의 말차와  상큼한 레몬으로 만든 셔벗 스타일의 프로즌 티.  말차의 감칠맛이 레몬과 만나 환상적인 청량감을 줍니다.', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002948]_20200410105102988.jpg', 335, 7, 1);
INSERT INTO item values(352, '스타벅스 라임 모히토 티', '라임과 사과 과즙이 팡팡 터지는   맑고 청량한 스타벅스 라임 모히토 티와 함께  가장 가까운 여름 휴가를 누리세요.', 7900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9200000002856]_20200515101837183.jpg', 140, 7, 1);
INSERT INTO item values(353, '아이스 자몽 허니 블랙 티', '새콤달콤한 자몽과 꿀이 깊고 그윽한 풍미의 스타벅스 티바나의 블랙 티와 만났습니다. 화려한 색감과 톡 쏘는 상큼함이 더해진 스타벅스의 새로운 티 음료입니다.', 5900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/08/[9200000000190]_20160831101044745.jpg', 125, 7, 1);
INSERT INTO item values(354, '패션 푸르트 칵테일 티', '달콤한 패션 푸르트와 새콤한 레몬, 티바나 패션탱고 티가  완벽하게 조화를 이룬 칵테일 스타일의 티 음료입니다.  패션 푸르트 씨앗으로 씹는 재미까지 즐겨 보세요.', 5100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9200000002949]_20200410105319176.jpg', 225, 7, 1);
INSERT INTO item values(355, '그랜마 애플 블랙 밀크 티', '그랜마 애플 블랙 티의 밀크 티 버전.  시나몬과 사과로 만든 할머니의 비밀 레시피로   블랙 티의 풍미가 더욱 풍부해졌습니다.  콜드 폼 위에 올려진 앙증맞은 사과모양이 포인트인  그랜마 애플 블랙 밀크 티를 티바나 바 / 리저브 바에서 느껴보세요.', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9200000002568]_20191024172150500.jpg', 320, 7, 1);
INSERT INTO item values(356, '돌체 블랙 밀크 티', '진한 홍차에 부드러운 우유와 연유 시럽으로 향긋하고   달콤하게 맛을 낸 스타벅스만의 돌체 블랙 밀크 티를  오직 티바나 바 매장에서만 만날 수 있습니다.', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9200000002564]_20191024172011813.jpg', 370, 7, 1);
INSERT INTO item values(406, '소시지 불고기 베이크', '소시지와 불고기를 빵으로 감싼 소시지 불고기 베이크입니다.', 9000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002226]_20190711130955314.jpg', 250, 7, 1);
INSERT INTO item values(357, '아이스 그랜마 애플 블랙 밀크 티', '그랜마 애플 블랙 티의 밀크 티 버전.  시나몬과 사과로 만든 할머니의 비밀 레시피로   블랙 티의 풍미가 더욱 풍부해졌습니다.  콜드 폼 위에 올려진 앙증맞은 사과모양이 포인트인  그랜마 애플 블랙 밀크 티를 티바나 바 / 리저브 바에서 느껴보세요.', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9200000002570]_20191024172240712.jpg', 275, 7, 1);
INSERT INTO item values(358, '아이스 돌체 블랙 밀크 티', '진한 홍차에 부드러운 우유와 연유 시럽으로 향긋하고   달콤하게 맛을 낸 스타벅스만의 돌체 블랙 밀크 티를  오직 티바나 바 매장에서만 만날 수 있습니다.', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9200000002566]_20191024172100816.jpg', 270, 7, 1);
INSERT INTO item values(359, '아이스 제주 유기농 말차로 만든 라떼', '차광재배한 어린 녹찻잎을 곱게 간 제주 유기농 말차를 사용하였습니다. 깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 제주 유기농 말차로 만든 라떼를 만나보세요.', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9200000002499]_20191227100221307.jpg', 155, 7, 1);
INSERT INTO item values(360, '아이스 차이 티 라떼', '부드러운 우유에 이국적인 스파이시한 풍미가 특징적인 티 라떼 입니다.', 6000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[135612]_20150813231332047.jpg', 190, 7, 1);
INSERT INTO item values(361, '제주 유기농 말차로 만든 라떼', '차광재배한 어린 녹찻잎을 곱게 간 제주 유기농 말차를 사용하였습니다. 깊고 진한 말차 본연의 맛과 향을 부드럽게 즐길 수 있는 제주 유기농 말차로 만든 라떼를 만나보세요.', 2900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9200000002496]_20191227100637680.jpg', 205, 7, 1);
INSERT INTO item values(362, '차이 티 라떼', '부드러운 우유에 이국적인 스파이시한 풍미가 특징적인 티 라떼 입니다.', 7500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[135608]_20160905102333344.jpg', 200, 7, 1);

-- 기타 제조 음료
INSERT INTO item values(363, '시그니처 핫 초콜릿', '유럽 스타일의 진한 핫 초콜릿으로 휘핑크림과 코코아 파우더가 토핑된 음료.', 6400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[72]_20150813231821724.jpg', 435, 8, 1);
INSERT INTO item values(364, '아이스 시그니처 초콜릿', '진한 초콜릿과 시원한 우유에 휘핑과 코코아 파우더가 얹어진 음료.', 8200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[110621]_20150723005650081.jpg', 435, 8, 1);
INSERT INTO item values(365, '플러피 판다 핫 초콜릿', '고소한 헤이즐넛과 진한 핫초콜릿의 만남,  귀여운 판다까지 더해진 플러피 판다 핫 초콜릿!     * 용인에버랜드R 매장에서만 판매하는 음료입니다', 5600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9200000002594]_20191212184806553.jpg', 480, 8, 1);
INSERT INTO item values(366, '매직 윈터 트로피컬 핫 펀치', '새콤달콤한 파인애플과 패션후르츠의 환상적인 만남,   남녀노소 따뜻하게 즐길 수 있는 매직 윈터 트로피컬 핫 펀치!    * 용인에버랜드R 매장에서만 판매하는 음료입니다', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9200000002595]_20191212184851924.jpg', 335, 8, 1);
INSERT INTO item values(367, '스팀 우유', '부드럽고 담백한 따뜻한 우유.', 3200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[17]_20150723005119481.jpg', 215, 8, 1);
INSERT INTO item values(368, '아이스 라임 플로터', '[더종로R,청담스타R,한강진역R,홍대입구역사거리R 전용음료] 라임, 민트 그리고 리저브 콜드 브루 샷으로 스타벅스 리저브만의 색깔로 변주한 모히토 음료입니다.', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/02/[9200000000429]_20170220161700272.jpg', 110, 8, 1);
INSERT INTO item values(369, '아이스 오렌지 플로터', '[더종로R,청담스타R,한강진역R,홍대입구역사거리R 전용음료] 오렌지의 상큼함과 리저브 콜드 브루 샷이 상쾌하게 느껴지는 리프레쉬 음료입니다.', 5700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/02/[9200000000428]_20170220161626329.jpg', 100, 8, 1);
INSERT INTO item values(370, '아이스 제주 까망 라떼', '[제주지역 한정음료] 제주도의 돌담길과 하르방의 풍경을 제주 까망 라떼로 느껴보세요.  고소한 흑임자와 달콤한 소보로 토핑으로 시원하게 누구나 즐길 수 있는 음료입니다.  ', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9200000001302]_20180418152834948.jpg', 225, 8, 1);
INSERT INTO item values(371, '아이스 제주 레드 빈 라떼', '[제주지역 한정음료] 제주 화산송이를 형상화한 음료로  국내산 레드 빈으로 표현한 뉴트로 음료로 고급진 레드 빈의 맛을  제주 스타벅스에서 즐겨보세요.', 1600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002670]_20200220135516783.jpg', 425, 8, 1);
INSERT INTO item values(372, '아이스 제주 청보리 라떼', '[제주지역 한정음료] 제주 바람의 숲 가파도를 연상시키는  음료로 청보리의 풋풋하고 고소함이 함께 느껴지는 음료.  제주 청보리 라떼로 가파도 길을 느껴보세요.', 10000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002667]_20200220135233846.jpg', 395, 8, 1);
INSERT INTO item values(373, '우유', '고소하고 담백한 신선한 우유.', 2100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[18]_20150723002143131.jpg', 240, 8, 1);
INSERT INTO item values(374, '제주 까망 라떼', '[제주지역 한정음료] 제주도의 돌담길과 하르방의 풍경을 제주 까망 라떼로 느껴보세요.  고소한 흑임자와 달콤한 소보로 토핑으로 누구나 즐길 수 있는 음료입니다.', 5200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9200000001301]_20180418152720660.jpg', 225, 8, 1);
INSERT INTO item values(375, '제주 레드 빈 라떼', '[제주지역 한정음료] 제주 화산송이를 형상화한 음료로  국내산 레드 빈으로 표현한 뉴트로 음료로 고급진 레드 빈의 맛을  제주 스타벅스에서 즐겨보세요.', 1900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002669]_20200220135416447.jpg', 410, 8, 1);
INSERT INTO item values(376, '제주 쑥쑥 라떼', '[제주지역 한정음료] 제주의 푸릇푸릇한 쑥 향을 느끼며 건강과   힐링을 즐기는 음료로 제주의 오름길을 상징하는 음료.   제주 쑥으로 향긋하고 푸릇푸릇한 쑥 향을 느끼며   건강과 힐링을 느낄 수 있는 Non Coffee음료.', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9200000002089]_20190221165720118.jpg', 425, 8, 1);
INSERT INTO item values(377, '제주 청보리 라떼', '[제주지역 한정음료] 제주 바람의 숲 가파도를 연상시키는  음료로 청보리의 풋풋하고 고소함이 함께 느껴지는 음료.  제주 청보리 라떼로 가파도 길을 느껴보세요.', 2900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9200000002666]_20200220135145724.jpg', 455, 8, 1);

-- 케이크
INSERT INTO item values(415, '서머 베리 요거트 케이크', '보랏빛 요거트 크림이 마치 파아란 바다를 연상시키는 여름 시즌 한정 케이크입니다.', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002709]_20200406204905234.jpg', 665, 2, 2);
INSERT INTO item values(416, '초콜릿 카라멜팅 케이크', '달콤한 초콜릿 시트 사이에 초콜릿 컬이 들어간 연유 크림과 윗면의 카라멜이 자연스럽게 흘러내리는 듯한 부드러운 케이크입니다.', 6100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002721]_20200508081947822.jpg', 620, 2, 2);
INSERT INTO item values(417, '7 레이어 가나슈 케이크', '초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/10/[9300000001179]_20171019152611027.jpg', 625, 2, 2);
INSERT INTO item values(418, 'DT밀당 케이크_레드 벨벳', '레드벨벳 크림치즈 케이크를 DT 매장 이용시 편리하게 즐기실 수 있도록 밀어먹는 케이스에 담았습니다.', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/03/[9300000001392]_20180315164104017.jpg', 224, 2, 2);
INSERT INTO item values(419, 'DT밀당 케이크_촉촉 초코', '촉촉 초콜릿 생크림 케이크를 DT 매장 이용시 편리하게 즐기실 수 있도록 밀어먹는 케이스에 담았습니다.', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/03/[9300000001393]_20180315164159937.jpg', 129, 2, 2);
INSERT INTO item values(420, '레드벨벳 크림치즈 케이크', '레드벨벳 시트 사이에 크림치즈 무스를 샌드한 케이크입니다.', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/10/[5110007192]_20151002104431160.jpg', 466, 2, 2);
INSERT INTO item values(421, '마스카포네 티라미수 케이크', '고소한 마스카포네 치즈 크림에 촉촉한 커피 시트가 입안을 감싸는 기분 좋은 느낌의 떠먹는 티라미수입니다.', 5600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9300000001907]_20181224160412089.jpg', 520, 2, 2);
INSERT INTO item values(422, '번트 치즈 케이크', '크림치즈가 듬뿍 들어간 케이크를 높은 온도로 짧은 시간 구워 낸 진한 맛의 치즈 케이크입니다.', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000002534]_20200206132830404.jpg', 825, 2, 2);
INSERT INTO item values(423, '부드러운 생크림 카스텔라', '부드러운 생크림이 듬뿍 들어있는 촉촉한 카스텔라입니다. ', 5600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5110007181]_20150723001851513.jpg', 593, 2, 2);
INSERT INTO item values(424, '블루베리 쿠키 치즈 케이크', '고소한 쿠키와 크림치즈를 듬뿍 넣어 만든 케이크위에 달콤, 상큼한 블루베리가 올라간 진한 치즈 풍미의 케이크입니다.', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000001376]_20180412095015947.jpg', 984, 2, 2);
INSERT INTO item values(425, '슈 크림 초콜릿 쿠키 슈', '구운 아몬드 슬라이스와 초콜릿을 입힌 쿠키 슈 안에 부드러운 슈 크림이 듬뿍 들어있는 달콤한 디저트입니다.', 4900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000002429]_20200219093744888.jpg', 550, 2, 2);
INSERT INTO item values(426, '슈크림 가득 바움쿠헨', '바닐라 빈이 들어간 부드러운 슈크림과 바움쿠헨이 조화로운 바닐라 풍미의 케이크입니다.  ', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000002448]_20191112103406500.jpg', 565, 2, 2);
INSERT INTO item values(427, '진한 녹차 생크림 케이크', '입 안 가득 풍부하고 진하게 퍼지는 녹차 맛이 특징인 케이크로 동물성 크림을  더해 더욱 부드럽게 즐길 수 있습니다.', 4200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/07/[9300000001576]_20180720100423612.jpg', 272, 2, 2);
INSERT INTO item values(428, '진한 얼 그레이 생크림 케이크', '직접 우려낸 얼 그레이를 부드러운 크림에 넣어 입 안 가득 퍼지는 얼 그레이의 진하고 풍부한 맛과 향이 특징인 케이크입니다.', 6200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9300000001908]_20181224160525094.jpg', 660, 2, 2);
INSERT INTO item values(429, '진한 초콜릿 크레이프 케이크', '한 장 한 장 정성스럽게 구운 크레이프 사이에  초코 크림과 진한 가나슈를 넣어 만든 케이크입니다.  초코 크런치 볼 토핑으로 바삭한 식감을 더했습니다. ', 9800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/09/[9300000002293]_20190917153147994.jpg', 385, 2, 2);
INSERT INTO item values(430, '초콜릿 페스티벌 케이크', '진한 풍미의 초콜릿 케이크 위에 달콤한 초콜릿을 얇게 썰어 올린 정통 초콜릿 케이크 입니다.', 2900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/10/[9300000001801]_20181022124646666.jpg', 640, 2, 2);
INSERT INTO item values(431, '크레이프 치즈 케이크', '부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든 케이크를 한 장 한 장  얇게 구운 크레이프로 감싸 정성스럽게 만든 케이크입니다. ', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[9300000002162]_20190617140000992.jpg', 565, 2, 2);
INSERT INTO item values(432, '클라우드 초콜릿 케이크', '부드러운 초콜릿 시트에 크림치즈 무스를 올린 달콤한 초콜릿 케이크입니다.', 5700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000002175]_20190827154929632.jpg', 770, 2, 2);
INSERT INTO item values(433, '클라우드 치즈 케이크', '사워크림의 상큼함과 진한 치즈의 맛을 동시에 맛볼 수 있는 케이크입니다. ', 8600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/05/[9300000000132]_20160511104357725.jpg', 586, 2, 2);
INSERT INTO item values(434, '호두 당근 케이크', '고소한 호두와 당근이 조화로운 홈메이드 타입 케이크입니다. ', 6900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[5110007147]_20150804230425962.jpg', 942, 2, 2);
INSERT INTO item values(435, '화이트 돌체 케이크', '화이트 시트 사이에 화이트 가나슈와 생크림, 연유 크림, 마스카포네 크림 순으로 샌드한 부드러운 케이크입니다.', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000002535]_20200206133010804.jpg', 415, 2, 2);
INSERT INTO item values(436, 'Thank you! 베리 케이크', '5월 감사의 달, 소중한 분께 특별한 감사의 마음을 땡큐! 베리 케이크로 표현 하세요. 카네이션을 들고 있는 베어리스타가 감사의 마음을 가득 담아 전달해 드립니다.', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002689]_20200423143627574.jpg', 300, 2, 2);
INSERT INTO item values(437, '당근 현무암 케이크', '[제주지역 한정푸드]현무암을 연상케 하는 오징어 먹물 케이크 시트 사이에 새콤한 당근 크림치즈 무스를 샌드한 컵 케이크', 10000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/07/[9300000001055]_20170710124750942.jpg', 304, 2, 2);
INSERT INTO item values(438, '몽한라 아일랜드', '[제주지역 한정푸드] 상큼한 한라봉 주스를 넣은 시트에 레몬과 크림치즈를 올린 컵 케이크입니다.', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/05/[9300000001537]_20180528125759495.jpg', 809, 2, 2);
INSERT INTO item values(439, '제주 리얼녹차 티라미수 아일랜드', '[제주지역 한정푸드] 제주녹차를 사용한 시트와 마스카포네 크림으로 진한 녹차의 풍미를 느낄 수 있는  제주 전용 티라미수입니다.', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000002491]_20191106171253990.jpg', 421, 2, 2);
INSERT INTO item values(440, '티라미수 아일랜드', '[제주지역 한정푸드] 제주도의 섬 모양을 형상화하고 마스카포네를 넣어 더욱 부드러운 티라미수입니다. ', 2100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001365]_20180208145758781.jpg', 476, 2, 2);
INSERT INTO item values(441, '촉촉 초콜릿 생크림 케이크', '촉촉한 초콜릿 시트에 초콜릿 생크림을 층층이 샌드하여 부드럽고 달콤한 맛이 특징인 케이크입니다.', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/02/[9300000000011]_20160212132908104.jpg', 378, 2, 2);
INSERT INTO item values(442, '블루베리 쿠키 치즈 케이크', '달콤한 블루베리를 듬뿍 올린 진한 풍미의 쿠키 치즈 케이크입니다.   (사이즈 18cm / 중량 1,250g)', 5900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000000913]_20180430162431754.jpg', 385, 2, 2);
INSERT INTO item values(443, '세븐 레이어 가나슈 케이크', '초콜릿, 가나슈, 모카로 만든 시트와 크림으로 만든 7개의 층이 특징이며, 가나슈로 감싸 진한 풍미의 초콜릿 케이크입니다.  (지름 12cm / 중량 510g)', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9300000002065]_20190412135121406.jpg', 425, 2, 2);
INSERT INTO item values(444, '청담스타 얼 그레이 밀크 케이크', '꿀이 함유된 얼 그레이 시트 사이에 부드러운 얼 그레이 생크림을 샌드한 청담스타 1,000호점, 청담스타 대표 케이크입니다.  (사이즈 15cm / 중량 520g)', 3500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000001521]_20180419160443788.jpg', 310, 2, 2);
INSERT INTO item values(445, '청담스타 오 허니 케이크', '흑설탕 시트 사이에 꿀과 요거트 크림을 샌드한 청담스타 대표 케이크를  이제 특별한 날 홀케이크로 만나보실 수 있습니다. (사이즈 15cm / 중량 550g)', 6300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/04/[9300000000882]_20170425213905124.jpg', 348, 2, 2);
INSERT INTO item values(446, '크레이프 에멘탈 치즈 케이크', '부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든 케이크를 한 장 한 장 얇게 구운 크레이프로 감싸 정성스럽게 만든 케이크입니다.  (지름 12cm / 중량 400g)', 2900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9300000002064]_20190412135005999.jpg', 330, 2, 2);
INSERT INTO item values(447, '피칸 브라우니', '초콜릿 청크를 넣고 고소한 피칸을 듬뿍 올린 진한 브라우니로 품격 있는 선물을 준비하세요.  (가로*세로 16cm*16cm / 중량 500g)', 4700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[9300000002173]_20190612150600937.jpg', 465, 2, 2);
INSERT INTO item values(448, '헤븐리 티라미수', '촉촉한 커피 시럽의 레이디핑거 쿠키와 100% 마스카포네 크림치즈로 만든 떠 먹는 타입의 티라미수입니다. (사이즈 18cm / 중량 850g)', 7700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/04/[9300000000878]_20170425213107826.jpg', 236, 2, 2);

-- 샌드위치/샐러드
INSERT INTO item values(449, '쉬림프/아보카도 샌드위치', '아보카도와 브로콜리 샐러드, 로메인의 그린 앙상블에 탱글탱글한 쉬림프 식감이 봄의 상큼함을 깨우는 콜드 샌드위치입니다', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/03/[9300000002687]_20200303143546000.jpg', 385, 3, 2);
INSERT INTO item values(450, '부드러운 크림치즈 샌드위치', '검은 깨가 콕콕 들어있는 건강한 식빵 안에 토마토와 햄, 그리고 부드럽고 산뜻한 크림치즈가 들어있는 샌드위치입니다.', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000002625]_20200219093852640.jpg', 470, 3, 2);
INSERT INTO item values(451, '햄 치즈 먹물 샌드위치', '아메리칸 스위스 치즈, 본레스 햄, 루꼴라가 들어간 먹물 식빵 샌드위치 위에 파마산 치즈, 체더 치즈를 토핑하여 바삭한 식감을 더한 샌드위치입니다.', 7600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9300000002536]_20191220143852765.jpg', 365, 3, 2);
INSERT INTO item values(452, '골든 멜팅 치즈 샌드위치', '쌀가루로 만든 더치 브레드를 활용하여 황금 빛을 낸 샌드위치로 체더, 모짜렐라, 아메리칸 스위스 치즈, 스모크 햄 그리고 치포틀레 소스를 넣어 맛을 낸 샌드위치입니다.', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9300000002537]_20191220143803794.jpg', 455, 3, 2);
INSERT INTO item values(453, '에그에그 샌드위치', '화이트 식빵 사이에 고소한 에그 스프레드를 넣은 부드러운 샌드위치입니다.', 9900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/01/[9300000001927]_20190114111036788.jpg', 370, 3, 2);
INSERT INTO item values(454, '과카몰리 크루아상 밀 박스', '과카몰리, 달걀프라이, 베이컨이 들어간 크루아상 샌드위치와  그릴드 베지터블(새송이 버섯, 미니 당근, 브로콜리등)로 만든 샐러드가   조화를 이룬 든든한 한끼의 밀 박스입니다.  ', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002312]_20200131145810723.jpg', 418, 3, 2);
INSERT INTO item values(455, '미트 파스타 샌드위치 밀 박스 ', '라구 소스 미트 파스타가 들어간 든든한 샌드위치와  칠리소스와 병아리콩, 강낭콩, 그린빈이 어우러진 샐러드가   조화를 이룬 든든한 한끼의 밀 박스입니다.  ', 8000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9300000002451]_20191202134604419.jpg', 465, 3, 2);
INSERT INTO item values(456, '쉬림프 로제 파스타 밀 박스', '통통한 새우가 올려져 있는 로제 파스타와 맛탕 고구마, 브로콜리, 병아리콩등이 잘 어우러진 샐러드가 부담 없는 한끼 식사를 선사 합니다. ', 8200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000002313]_20190820131745979.jpg', 333, 3, 2);
INSERT INTO item values(457, '멕시칸 브리또 밀 박스', '멕시칸 스타일 브리또와 누구나 좋아하는 단호박 샐러드가 설레임 가득한 한끼 식사를 선사합니다. ', 2500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001937]_20190211140815644.jpg', 555, 3, 2);
INSERT INTO item values(458, '잉글리쉬 머핀 밀 박스', '토마토와 계란후라이가 들어간 잉글리쉬 머핀과 감자 샐러드가 균형 잡힌 한끼 식사를 선사합니다.', 10000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001935]_20190211140601699.jpg', 390, 3, 2);
INSERT INTO item values(459, '베이컨 치즈 토스트', '계란과 우유를 적신 빵에 베이컨과 치즈, 에그 스프레드를 넣어 구운  프렌치 토스트 타입 샌드위치입니다.', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000002178]_20190827175921115.jpg', 350, 3, 2);
INSERT INTO item values(460, '햄/루꼴라 올리브 샌드위치', '햄, 토마토, 모짜렐라 치즈와 루꼴라를 올리브가 콕콕 박힌 치아바타 사이에 넣은 샌드위치입니다.', 4200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[9300000001777]_20180829140604582.jpg', 333, 3, 2);
INSERT INTO item values(461, '바비큐 치킨 치즈 치아바타', '바삭한 치아바타에 새콤달콤한 바비큐 소스 치킨, 베이컨, 치즈가 어우러진 샌드위치입니다.', 4200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[5110003062]_20150804225346414.jpg', 277, 3, 2);
INSERT INTO item values(462, '크로크 무슈', '브라운 호밀 식빵을 사용하여 갈색을 띄는 크로크 무슈는 씹을수록 고소함이 진해지는 것이 특징입니다.', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/08/[9300000001118]_20170808091515413.jpg', 402, 3, 2);
INSERT INTO item values(463, '에그, 베이컨 치즈 베이글', '담백한 베이글에 베이컨, 치즈, 두툼한 에그 패티를 넣은 든든한 샌드위치입니다.', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[5110003074]_20150804225939205.jpg', 449, 3, 2);
INSERT INTO item values(464, '포크 커틀릿 샌드위치', '겹겹이 쌓은 돼지 등심으로 만든 풍부한 식감의 커틀릿에 할라피뇨, 당근 잼을 넣은 소스로 매콤 달콤한 맛을 살린 든든한 한 끼 샌드위치입니다.', 3200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9300000001652]_20181224155642926.jpg', 555, 3, 2);
INSERT INTO item values(465, '베이컨 과카몰리 샌드위치', '아보카도와 감자로 맛을 낸 과카몰리 스프레드 위에 베이컨과 두가지 치즈 그리고 달걀 프라이가 들어간 샌드위치입니다.', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[9300000002062]_20190409173316811.jpg', 460, 3, 2);
INSERT INTO item values(466, 'B.E.L.T. 샌드위치', '주 재료인 베이컨(Bacon), 계란(Egg), 로메인 상추(Lettuce-Romane), 토마토(Tomato)의 각각의 머리 글자를 따온 이름의 샌드위치 입니다.', 1600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/02/[9300000000689]_20170213161442535.jpg', 505, 3, 2);
INSERT INTO item values(467, '단호박 에그 샌드위치', '건강 잡곡 식빵 속에 단호박, 달걀, 토마토, 치즈 등을 넣은 콜드 샌드위치입니다.  *단호박/에그 스프레드와 볶음 양송이, 토마토, 스위스 치즈, 로메인이 들어있습니다.', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/03/[9300000000036]_20160316095031573.jpg', 317, 3, 2);
INSERT INTO item values(468, '크랜베리 치킨 치즈 샌드위치', '더 건강하고 고소한 곡물 식빵 안에 크랜베리 치킨 스프레드와 토마토, 치즈를 넣어 맛이 더욱 풍부해진 콜드 샌드위치입니다.  * 본 상품은 브런치 유어 웨이 해당 상품입니다. ', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/08/[9300000001117]_20170808091700134.jpg', 364, 3, 2);
INSERT INTO item values(469, '현무암 크로크무슈', '[제주지역 한정푸드]  현무암을 형상화 한 브레드에 어니언 베샤멜 소스, 햄, 치즈를 넣은  크로크무슈입니다.', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000001516]_20180425172254006.jpg', 323, 3, 2);
INSERT INTO item values(470, '한라봉 모닝샌드위치', '[제주지역 한정푸드]  본가드 치즈, 베이컨, 계란을 넣고 제주 한라봉 청을 더해  상큼하면서도 든든한 샌드위치입니다.', 6200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000001515]_20180425172145250.jpg', 390, 3, 2);
INSERT INTO item values(471, '볼케이노 샌드위치', '[제주지역 한정푸드]  먹물로 만들어 현무암 모양을 형상화 한 브레드에 체다치즈, 할라피뇨, 베이컨을  넣은 멜팅 샌드위치입니다.', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000001514]_20180425172044904.jpg', 347, 3, 2);
INSERT INTO item values(472, '제주 흑돼지 초리조 먹물 샌드위치', '[제주지역 한정푸드] 제주 흑돼지 초리조 소시지와 계란패티에 살사소스와 머스타드를 넣은 샌드위치입니다.', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/03/[9300000001389]_20180328113451660.jpg', 554, 3, 2);

-- 브레드
INSERT INTO item values(473, '에그 베이컨 치즈 백년초 베이글', '[제주지역 한정푸드] 제주도 특산물인 백년초 베이글에 에그패티와 베이컨, 치즈를 넣은 샌드위치입니다.', 7800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/03/[9300000001388]_20180328112810479.jpg', 404, 1, 2);
INSERT INTO item values(474, '제주 녹차 베이컨 치즈 베이글', '[제주지역 한정푸드] 제주 녹차로 만든 베이글에 모짜렐라 치즈와 베이컨을 넣은 베이글 샌드위치입니다.', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/03/[9300000001387]_20180328113327539.jpg', 549, 1, 2);
INSERT INTO item values(475, '블루베리 베이글', '블루베리의 상큼한 풍미가 매력적인 베이글로 크림치즈와 함께 더욱 맛있게 즐기실 수 있습니다.', 4900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[5110001015]_20150805155117670.jpg', 258, 1, 2);
INSERT INTO item values(476, '호두 크림치즈 베이글', '진한 필라델피아 크림치즈와 고소한 호두가 샌드된 담백한 베이글로 간단하지만 든든한 아침 식사를 즐겨보세요.', 8800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/08/[9300000001161]_20170828172012812.jpg', 378, 1, 2);
INSERT INTO item values(477, '고소한 치즈 베이글', '양파 베이글 위에 고다 치즈, 파마산 치즈, 블렌디드 치즈를 얹은 베이글입니다.', 7700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/06/[9300000000130]_20160609141639682.jpg', 343, 1, 2);
INSERT INTO item values(478, '더블루베리 크림치즈 베이글', '상큼한 블루베리 베이글에 블루베리 크림치즈를 듬뿍 넣어 블루베리 본연의 풍미를 높인 식사대용 브레드입니다.', 6300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002516]_20200122113148401.jpg', 435, 1, 2);

-- 따뜻한 푸드
INSERT INTO item values(479, '현미 크림 수프', '고소한 현미와 풍부한 우유 크림으로 만든 건강한 컨셉의 수프입니다.', 6900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9900000000084]_20160920155032027.jpg', 146, 4, 2);
INSERT INTO item values(480, '트러플 머쉬룸 수프', '송로 버섯의 향과 양송이 버섯의 진한  풍미가 조화로운 식사 대용 수프입니다.  ※ 수프 구매 시 크래커가 함께 제공됩니다.', 2500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9900000000680]_20191202134306880.jpg', 145, 4, 2);
INSERT INTO item values(481, '우리나라 옥고감', '우리 땅에서 자란 세 가지 농산물(옥수수, 고구마, 감자)을 오븐에 구워 건강하고 간편하게 한 끼를 즐길 수 있는 상품입니다. ', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5110009042]_20150731190846277.jpg', 260, 4, 2);
INSERT INTO item values(482, '트러플 머쉬룸 수프', '송로 버섯의 향과 양송이 버섯의 진한  풍미가 조화로운 식사 대용 수프입니다.  ※ 수프 구매 시 크래커가 함께 제공됩니다.', 6300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/12/[9900000000680]_20191202134306880.jpg', 145, 4, 2);
INSERT INTO item values(483, '현미 크림 수프', '고소한 현미와 풍부한 우유 크림으로 만든 건강한 컨셉의 수프입니다.', 5400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9900000000084]_20160920155032027.jpg', 146, 4, 2);

--  스낵/디저트
INSERT INTO item values(484, '우리나라 옥고감', '우리 땅에서 자란 세 가지 농산물(옥수수, 고구마, 감자)을 오븐에 구워 건강하고 간편하게 한 끼를 즐길 수 있는 상품입니다. ', 9900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5110009042]_20150731190846277.jpg', 260, 7, 2);
INSERT INTO item values(485, '한 입에 쏙 호두', '고소한 호두와 헤이즐넛, 그리고 달콤한 대추가 들어있는 한 입 크기의 미니 팬 케이크입니다.', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/05/[9300000001368]_20180517171108453.jpg', 292, 7, 2);
INSERT INTO item values(486, '사과 가득 핸디 젤리', '경북 특산물인 사과를 가득 담은 달콤한 맛의 스타벅스 핸디 젤리', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000001911]_20191104110731624.jpg', 80, 7, 2);
INSERT INTO item values(487, '제주 자연 청 세트', '[제주지역 한정푸드] 제주도 청정 자연의 맛과 멋을 담은 건강한 청 선물 세트 입니다.제주도 특산물인 영귤과 댕유자 청이 각각 1병씩 들어있습니다.', 9300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[9300000001672]_20180813105526098.jpg', 1245, 7, 2);
INSERT INTO item values(488, '하루 한 컵 GREEN', '키위와 청포도를 한 컵에 담아 언제 어디서나 편하게 즐길 수 있습니다.', 8800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[9300000001364]_20180412095213123.jpg', 90, 7, 2);
INSERT INTO item values(489, '하루 한 컵 RED', '국내산 사과와 대추 방울 토마토를 한 컵에 담아 언제 어디서나 편하게 즐길 수 있습니다.', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/04/[5110009051]_20160427151949047.jpg', 60, 7, 2);
INSERT INTO item values(490, '한 입에 쏙 열대 과일칩(망고/파인애플)', '대표 열대 과일인 파인애플과 망고를  그대로 동결 건조한 과일 스낵으로  바삭한 식감과 함께 과일 본연의 맛을  즐길 수 있습니다.  첨가물이 전혀 없고 칼로리도 비교적 낮아  부담없이 드실 수 있습니다.', 6300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002409]_20191029164536656.jpg', 45, 7, 2);
INSERT INTO item values(491, '한 입에 쏙 우리 과일칩(딸기/사과)', '국내산 딸기와 사과를 그대로 동결 건조한  과일 스낵으로 바삭한 식감과 함께  과일 본연의 맛을 즐길 수 있습니다.  첨가물이 전혀 없고 칼로리도 비교적 낮아  부담없이 드실 수 있습니다.', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002408]_20191029164230648.jpg', 35, 7, 2);
INSERT INTO item values(492, '한라봉 가득 핸디 젤리', '제주도 특산물인 한라봉과 감귤을 가득 담은 상큼한 맛의 스타벅스 핸디 젤리', 3800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000001912]_20191104110839986.jpg', 75, 7, 2);
INSERT INTO item values(493, 'New 밀크 푸딩', '신선한 우유와 무항생제 달걀을 넣어 만든  부드럽고 달콤한 밀크 푸딩입니다.  냉장보관이 필요한 상품입니다.', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002619]_20200129141145991.jpg', 125, 7, 2);
INSERT INTO item values(494, 'New 초콜릿 푸딩', '벨기에 초콜릿과 무항생제 달걀,  신선한 우유로 만든 진한 초콜릿 푸딩입니다.  냉장보관이 필요한 상품입니다.', 7800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002620]_20200129141255087.jpg', 190, 7, 2);
INSERT INTO item values(495, '스타벅스 오가닉 그릭 요거트', '강원 청정 농장의 유기농 우유로 만든 정통 그릭 방식의 요거트입니다.  * 유기농 설탕 함유', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/04/[9300000000751]_20170405155250571.jpg', 101, 7, 2);
INSERT INTO item values(496, '오가닉 그릭 요거트 플레인 JAR', '사이렌 로고가 그려진 도자기 안에 진한 크림 치즈처럼 깊고 풍부한 맛의 유기농 그릭 요거트가 담겨 있습니다.', 2100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/01/[9300000001855]_20190107180642417.jpg', 95, 7, 2);
INSERT INTO item values(497, '큐브 라이스 카스텔라', '스타벅스 원두 퇴비로 키운 유기농 쌀과 동물복지 유정란으로  만든 미니 사이즈의 쌀 카스텔라입니다.', 7600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002726]_20200529153429616.jpg', 129, 7, 2);
INSERT INTO item values(498, '로고 코인 다크 초콜릿 (골드)', '골드 틴 케이스에 들어있는 사이렌 로고 모양의 다크 초콜릿입니다.   카카오 함량은 73%, 카페인은 0.05g 포함되어 있습니다.', 2200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5650003321]_20150723015542697.jpg', 255, 7, 2);
INSERT INTO item values(499, '로고 코인 밀크 초콜릿 (실버)', '실버 틴 케이스에 들어있는 사이렌 로고 모양의 밀크 초콜릿입니다.   카카오 함량은 30%, 카페인은 0.02g 포함되어 있습니다.', 8500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5650003322]_20150723015450710.jpg', 256, 7, 2);
INSERT INTO item values(500, '로스티드 아몬드 앤 초콜릿', '구운 아몬드의 고소함이 달콤한 카라멜을 만나 초콜릿과 함께 조화를 이룹니다. ', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5650003325]_20150723020327783.jpg', 326, 7, 2);
INSERT INTO item values(501, '리저브 초콜릿 세트', '벨기에와 프랑스산 재료로 만든 프리미엄 초콜릿으로 리저브 커피와 드시면 더욱 맛이 좋습니다.', 8100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[9300000001610]_20180813105145974.jpg', 181, 7, 2);
INSERT INTO item values(502, '블루베리 초콜릿', '블루베리를 초콜릿으로 코팅하여, 겉은 달콤하면서 안에는 상큼한 블루베리를 그대로 즐기실 수 있습니다.', 5600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/06/[9300000000772]_20170605104801377.jpg', 300, 7, 2);
INSERT INTO item values(503, '에스프레소 빈 초콜릿', '에스프레소 빈을 다크 초콜릿으로 코팅하여, 커피 한 잔의 풍미를 더욱 풍부하게 느끼실 수 있습니다.', 3500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/06/[9300000000773]_20170605104945075.jpg', 263, 7, 2);
INSERT INTO item values(504, '제주 오름 초콜릿 세트', '[제주지역 한정푸드] 제주의 유명 자연 경관인 오름 모양을 형상화한 초콜릿 세트 입니다.', 6300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/01/[9300000001257]_20180117105425258.jpg', 570, 7, 2);
INSERT INTO item values(505, '구워서 바삭한 코코넛 칩', '코코넛 과육을 그대로 구워내어 코코넛 본연의 풍미를 더욱 풍부하게 느끼실 수 있습니다.    ', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/07/[9300000000682]_20170720114325160.jpg', 130, 7, 2);
INSERT INTO item values(506, '다크 초콜릿 카우보이 쿠키', '진한 다크 초콜릿과 고소한 피칸이 들어있는 쿠키입니다.', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5650003319]_20150723022427578.jpg', 465, 7, 2);
INSERT INTO item values(507, '단호박/백년초 라이스 볼 틴 세트', '친환경 쌀에 단호박, 백년초 분말를 각각 넣어 구운 라이스 쿠키 세트입니다.  한국의 미를 살릴 수 있는 디자인의 틴 케이스에 담아 소장가치를 더했습니다.  - 인천공항 내 스타벅스 매장에서 구매하실 수 있습니다.  - 판매 수량이 한정되어 있어 조기 소진 될 수 있습니다.  - 입고 및 재고 수량은 유선으로 안내되지 않습니다.', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/09/[9300000002407]_20190927152159186.jpg', 884, 7, 2);
INSERT INTO item values(508, '먹물치즈 라이스 비스코티', '친환경 인증 쌀에 오징어 먹물, 크림치즈와 호두를 넣어 구운 빵을 다시 한번 구워낸 비스코티 스낵입니다.', 2500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/03/[9300000001999]_20190320162347817.jpg', 305, 7, 2);
INSERT INTO item values(509, '버터 가득 라이스 쿠키', '버터 풍미가 가득한 부드러운 식감의 라이스 쿠키입니다.', 9800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/10/[9300000001893]_20181030153714185.jpg', 422, 7, 2);
INSERT INTO item values(510, '오도독 건강한 넛/블루베리', '견과류의 고소함과 블루베리의 달콤함을 즐길 수 있는 한 줌 스낵입니다. ', 8200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5650003312]_20150723023453318.jpg', 169, 7, 2);
INSERT INTO item values(511, '우리 미 감자팝', '국내산 쌀과 감자를 주재료로 하였으며, 퍼핑 공법으로 만들어 기름기가 적고 바삭한 식감이 특징인 스낵입니다.', 3200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/10/[9300000000444]_20161014130607008.jpg', 165, 7, 2);
INSERT INTO item values(512, '청크 초콜릿 쿠키 틴 세트', '다크 초콜릿 / 화이트 초콜릿을 듬뿍 넣어 구운 쿠키가  각각 4개씩 들어 있는 쿠키 세트입니다.  고급스러운 틴 케이스로 소장가치를 높였습니다.', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002618]_20200116161051474.jpg', 212, 7, 2);
INSERT INTO item values(513, '탐라 비스코티', '[제주지역 한정푸드] 한라봉 필의 상큼함과 우도 땅콩의 고소함을 즐길 수 있는 비스코티가 각각 3개씩 들어있는 바삭한 구움 과자 입니다.', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/09/[9300000001198]_20170921154305151.jpg', 411, 7, 2);
INSERT INTO item values(514, '현무암 러스크', '[제주지역 한정푸드]현무암을 연상케 하는 오징어 먹물 빵에 달콤한 초콜릿을 찍어 만든 바삭한 식감이 특징인 러스크 입니다.', 5200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/09/[9300000001199]_20170921154415264.jpg', 174, 7, 2);
INSERT INTO item values(515, '화이트 초콜릿 카우보이 쿠키', '달콤한 화이트 초콜릿과 고소한 피칸이 들어있는 초콜릿 쿠키입니다. ', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5650003320]_20150723022640144.jpg', 450, 7, 2);
INSERT INTO item values(516, '다크 초콜릿 마카롱', '쫀득 쫀득한 초코 가나슈가 샌드된 진한 맛의 초콜릿 마카롱입니다.  ', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/01/[9300000001924]_20190114110705823.jpg', 165, 7, 2);
INSERT INTO item values(517, '바닐라 마카롱', '달콤한 바닐라 맛의 겉은 바삭하고 속은 쫄깃한 마카롱입니다.', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5110008078]_20150722210718416.jpg', 150, 7, 2);
INSERT INTO item values(518, '블루베리 마카롱', '겉은 바삭하고 속은 쫄깃한 새콤달콤 블루베리 맛의 마카롱입니다.', 1900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/07/[5110008075]_20150722211058139.jpg', 150, 7, 2);
INSERT INTO item values(519, '스트로베리 마카롱', '쫄깃한 식감의 마카롱 피와 딸기 맛 연유 버터 크림의 마카롱입니다.', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001318]_20180207163707876.jpg', 140, 7, 2);
INSERT INTO item values(543, '바닐라 아포가토', '유기농 바닐라 아이스크림에 스타벅스의 에스프레소를 부어 만든 달콤 쌉싸름한 이탈리아 정통 디저트입니다.', 3700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/06/[9900000000031]_20160610102716564.jpg', 208, 7, 2);
INSERT INTO item values(520, '20 W-day 캔디 하트 백', '천연 과일 (딸기, 라즈베리, 블루베리)과 민트를 각각  넣은 프리미엄 볼 캔디입니다. (135g / 28~30입)  특별한 하트 케이스와 패브릭 파우치에 담아  소장가치를 더했습니다.', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000002318]_20200225152129178.jpg', 520, 7, 2);
INSERT INTO item values(521, 'New 한 입에 쏙 고구마', '국내산 고구마를 건조한 고구마 말랭이입니다. 큐브 형태로 한 입에 간편하게 즐기실 수 있습니다.', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/06/[9300000002132]_20190619144821795.jpg', 265, 7, 2);
INSERT INTO item values(522, '더블 치즈 베이글 칩', '파마산 치즈와 모짜렐라 치즈를 넣어  구운 베이글에 꿀을 더해 한 번 더  바삭하게 구운 베이글 칩입니다.  ', 4800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002517]_20200129141414318.jpg', 295, 7, 2);
INSERT INTO item values(523, '라이스 칩(블루베리 잼)', '친환경인증 국내산 쌀과 자색고구마, 단호박, 시금치, 당근으로 만들었으며, 블루베리 잼이 함께 들어있습니다.', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/01/[9300000001894]_20190114110400588.jpg', 140, 7, 2);
INSERT INTO item values(524, '베어리스타 오가닉 젤리', '귀여운 베어리스타 모양의 6가지 과일 맛 젤리입니다.  (오렌지, 레몬, 라즈베리, 파인애플, 사과, 블랙커런트)  천연 과즙의 새콤 달콤한 맛과 부드러운 식감이 특징으로,  유기농/비건 인증을 받아 누구나 안심하고 드실 수 있습니다.', 5900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000002410]_20191107104122142.jpg', 210, 7, 2);
INSERT INTO item values(525, '스타벅스 찹쌀말랑', '국산 찹쌀과 잣으로 만든 쫄깃한 식감의 한국식 디저트입니다.', 1800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[9300000001391]_20180809163723366.jpg', 209, 7, 2);
INSERT INTO item values(526, '씨프렌즈 캔디', '예쁜 틴 케이스에 사이렌과 바닷속 친구들이 담겨져 있는 캔디입니다.', 1900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/07/[9300000001058]_20180710125626733.jpg', 196, 7, 2);
INSERT INTO item values(527, '아몬드 토피넛 캔디', '아몬드와 버터를 듬뿍 넣어 수제 방식으로 만든  바삭하고 달콤한 토피넛 캔디입니다.  낱개 포장되어 있어 취식이 편리합니다. (10개입)  ', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000002621]_20200228105751583.jpg', 316, 7, 2);
INSERT INTO item values(528, '애프터 커피 캔디 (페퍼민트)', '스타벅스에서만 만나실 수 있는 시원한 페퍼민트맛의 캔디입니다.', 1800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[9300000001523]_20180831125504905.jpg', 80, 7, 2);
INSERT INTO item values(529, '우도 땅콩 다쿠아즈', '[제주지역 한정푸드] 부드럽고 폭신한 식감이 특징인 다쿠아즈 과자에 제주 특산물인 우도 땅콩이 버터 크림에 버무려진 달콤한 디저트입니다.', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/09/[9300000001189]_20170921154050948.jpg', 130, 7, 2);
INSERT INTO item values(530, '우리 흑米 카스텔라', '친환경 쌀과 국내산 흑미, 동물복지 유정란으로 만든  촉촉한 쌀 카스텔라입니다.', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002617]_20200116130709118.jpg', 630, 7, 2);
INSERT INTO item values(531, '우리米 카스텔라', '국내산 친환경 인증 쌀과 동물복지 유정란으로 만든  촉촉한 쌀 카스텔라입니다.', 7000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002127]_20200122173812466.jpg', 610, 7, 2);
INSERT INTO item values(532, '자일리톨 캔디 크리스탈 레몬', '자작나무에서 추출한 핀란드산 천연 자일리톨로 만든  크리스탈 원석 형태의 캔디입니다.  (자일리톨 98.5%, 레몬향 첨가)  미니 틴케이스에 담아 편리하게 드실 수 있습니다.', 1800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/03/[9300000002556]_20200317142407826.jpg', 66, 7, 2);
INSERT INTO item values(533, '제주 녹차 다쿠아즈', '[제주지역 한정푸드] 부드럽고 폭신한 식감이 특징인 다쿠아즈 과자에 제주 특산물인 녹차를 크림에 넣어 쌉싸름한 맛이 특징인 디저트입니다.', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/09/[9300000001195]_20170921153929268.jpg', 130, 7, 2);
INSERT INTO item values(534, '카라멜 스틱', '유기농 설탕, 프랑스산 천일염, 버터로 만든 달콤한 카라멜을 스틱에 꽂아 더욱 편리하게 드실 수 있습니다.    ', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/09/[9300000001059]_20170919152045307.jpg', 165, 7, 2);
INSERT INTO item values(535, '카라멜 와플', '따뜻한 커피 위에 올려두시면 카라멜 본연의 맛과 커피의 아로마가 어우러져 더욱 맛있게 드실 수 있습니다.      ', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/12/[5650003327]_20151214094216294.jpg', 300, 7, 2);
INSERT INTO item values(536, '한입에 쏙 공주 알밤', '국내산 공주 밤을 껍질 제거 후 그대로 쪄낸 간식입니다.  국내 최대 산지인 공주 밤을 엄선해 알이 크고 단 맛이 좋습니다.', 7600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/09/[9300000002000]_20190927151638169.jpg', 120, 7, 2);

-- 아이스크림
INSERT INTO item values(537, '유기농 바닐라 아이스크림', '부드럽고 깔끔한 맛의 유기농 바닐라 아이스크림을 즐기세요.', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/06/[5110009050]_20160610090705752.jpg', 203, 5, 2);
INSERT INTO item values(538, '유기농 초콜릿 아이스크림', '부드럽고 깔끔한 맛의 유기농 초콜릿 아이스크림을 즐기세요.', 9900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/05/[9300000000810]_20170523151927203.jpg', 226, 5, 2);
INSERT INTO item values(539, '자바 칩 유기농 바닐라 아이스크림', '유기농 바닐라 아이스크림에 달콤한 자바 칩(초콜릿 칩)을 토핑하였습니다.', 6600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/06/[9900000000034]_20160610090907630.jpg', 255, 5, 2);
INSERT INTO item values(540, '자바 칩 유기농 초콜릿 아이스크림', '유기농 초콜릿 아이스크림에 달콤한 자바 칩(초콜릿 칩)을 토핑하였습니다.', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/05/[9900000000171]_20170523152018211.jpg', 278, 5, 2);
INSERT INTO item values(541, '넛츠 바닐라 아포가토', '유기농 바닐라 아이스크림에 스타벅스의 에스프레소를 붓고 고소한 넛츠를 토핑한 아포가토입니다.', 8600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/06/[9900000000033]_20160610103328615.jpg', 310, 5, 2);
INSERT INTO item values(542, '넛츠 초콜릿 아포가토', '유기농 초콜릿 아이스크림에 스타벅스의 에스프레소를 붓고 고소한 넛츠를 토핑한 아포가토입니다.', 8700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/05/[9900000000170]_20170523152501374.jpg', 333, 5, 2);
INSERT INTO item values(576, '스타벅스 1호점 스퀘어 머그 355ml', '이대R 매장 전용 상품', 8800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002477]_20200513100924481.jpg', 0, 5, 2);
INSERT INTO item values(544, '자바 칩 바닐라 아포가토', '유기농 바닐라 아이스크림에 스타벅스의 에스프레소를 붓고 달콤한 자바칩을 토핑한 아포가토입니다.', 5900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/06/[9900000000032]_20160610103052650.jpg', 260, 5, 2);
INSERT INTO item values(545, '자바 칩 초콜릿 아포가토', '유기농 초콜릿 아이스크림에 스타벅스의 에스프레소를 붓고 달콤한 자바칩을 토핑한 아포가토입니다.', 2800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/05/[9900000000169]_20170523152354183.jpg', 283, 5, 2);
INSERT INTO item values(546, '초콜릿 아포가토', '유기농 초콜릿 아이스크림에 스타벅스의 에스프레소를 부어 만든 달콤 쌉싸름한 이탈리아 정통 디저트입니다.', 8700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/05/[9900000000168]_20170523152252647.jpg', 231, 5, 2);

-- 머그
INSERT INTO item values(547, '사이렌 그러데이션 핸들 머그 473ml', '2020 서머2 프로모션 상품입니다.   싱그러운 그린 컬러의 그러데이션이 돋보이는 시즌한정 머그 상품입니다. ', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002498]_20200522134405268.jpg', 0, 1, 3);
INSERT INTO item values(548, '서머 라탄 핸들 글라스 473ml', '2020 서머2 프로모션 상품입니다.   글라스 핸들에 라탄이 매치되어 여름을 물씬 느낄 수 있는 글라스로 시즌한정 상품입니다. ', 3200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002495]_20200522134628042.jpg', 0, 1, 3);
INSERT INTO item values(549, 'SS 리저브 커피 블랙 더블월 머그 355ml', '스타벅스 리저브™ 매장 전용 상품', 6400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[11076530]_20180806094930302.jpg', 0, 1, 3);
INSERT INTO item values(550, 'SS 리저브 화이트 더블월 머그 355ml', '스타벅스 리저브™ 매장 전용 상품', 4500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[11076531]_20180806095015148.jpg', 0, 1, 3);
INSERT INTO item values(551, 'SS 헤리티지 핸들 머그 355ml', '더블 월 구조로 제작된 스테인리스 스틸 소재 머그입니다', 4800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/06/[11064776]_20170615185222455.jpg', 0, 1, 3);
INSERT INTO item values(552, '경주 투어 머그 355ml', '경주 시티 상품', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001759]_20190806110930929.jpg', 0, 1, 3);
INSERT INTO item values(553, '리얼 광주 데미머그 89ml', '시티 상품', 5200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9300000000259]_20160926165354574.jpg', 0, 1, 3);
INSERT INTO item values(554, '리얼 대구 데미머그 89ml', '시티 상품', 3500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9300000000253]_20160926154141765.jpg', 0, 1, 3);
INSERT INTO item values(555, '리얼 대구 머그 414ml', '시티 상품', 4000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9300000000252]_20160926153852074.jpg', 0, 1, 3);
INSERT INTO item values(556, '리얼 대전 데미머그 89ml', '시티 상품', 7600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9300000000271]_20160926153715888.jpg', 0, 1, 3);
INSERT INTO item values(557, '리얼 대전 머그 414ml', '시티 상품', 2200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9300000000270]_20160926153446252.jpg', 0, 1, 3);
INSERT INTO item values(558, '리저브 뉴블랙 데미머그 89ml', '스타벅스 리저브™ 매장 전용 상품', 3600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11100501]_20200401095132152.jpg', 0, 1, 3);
INSERT INTO item values(559, '리저브 뉴블랙 머그 355ml', '스타벅스 리저브™ 매장 전용 상품', 5500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11100503]_20200401095836690.jpg', 0, 1, 3);
INSERT INTO item values(560, '리저브 뉴블랙 머그 473ml', '스타벅스 리저브™ 매장 전용 상품', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11100504]_20200401100604088.jpg', 0, 1, 3);
INSERT INTO item values(561, '리저브 블랙 DW 머그 296ml', '스타벅스 리저브™ 매장 전용 상품', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11083303]_20190514172128256.jpg', 0, 1, 3);
INSERT INTO item values(562, '리저브 화이트 DW 머그 296ml', '스타벅스 리저브™ 매장 전용 상품', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11083304]_20190514172237197.jpg', 0, 1, 3);
INSERT INTO item values(563, '마블 화이트 머그 355ml', '고급스러운 대리석 느낌으로 디자인 된 세라믹 소재 머그', 2100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001043]_20180221164921644.jpg', 0, 1, 3);
INSERT INTO item values(564, '바닷속 고래 머그 355ml', '2020 서머1 프로모션 상품입니다.  핸들 그립감이 우수한 고래 모양의 머그입니다.', 4100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002348]_20200406110615236.jpg', 0, 1, 3);
INSERT INTO item values(565, '부산 투어 머그 355ml', '부산 시티 상품', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001749]_20190806110327262.jpg', 0, 1, 3);
INSERT INTO item values(566, '북청사자놀음 데미머그 89ml', '상시 판매 상품', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000001765]_20191112102659545.jpg', 0, 1, 3);
INSERT INTO item values(567, '북청사자놀음 머그 355ml', '상시 판매 상품', 5100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000001762]_20191112102226378.jpg', 0, 1, 3);
INSERT INTO item values(568, '블랙 헤리티지 머그 355ml', '헤리티지 로고가 프린팅 된 세라믹 소재 머그', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/05/[9300000001015]_20180517170824674.jpg', 0, 1, 3);
INSERT INTO item values(569, '블랙 헤리티지 머그 473ml', '헤리티지 로고가 프린팅 된 세라믹 소재 머그', 6400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/05/[9300000001017]_20180517170907030.jpg', 0, 1, 3);
INSERT INTO item values(570, '빈 데어 코리아 데미머그 59ml', '상시 판매 상품', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[11111578]_20200131151955795.jpg', 0, 1, 3);
INSERT INTO item values(571, '빈 데어 코리아 머그 414ml', '상시 판매 상품', 8600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[11112118]_20200131154101542.jpg', 0, 1, 3);
INSERT INTO item values(572, '서울 제주 데미머그 세트', '서울/제주 시티 상품', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001756]_20190806111016247.jpg', 0, 1, 3);
INSERT INTO item values(573, '서울 투어 머그 355ml', '서울 시티 상품', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001746]_20190806110016739.jpg', 0, 1, 3);
INSERT INTO item values(574, '스타벅스 1호점 머그 400ml', '이대R 매장 전용 상품', 7700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002109]_20190716144514352.jpg', 0, 1, 3);
INSERT INTO item values(575, '스타벅스 1호점 뱃지 머그 414ml', '이대R 매장 전용 상품', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002476]_20200513100735953.jpg', 0, 1, 3);
INSERT INTO item values(577, '아이코닉 사이렌 머그 355ml', '스타벅스의 사이렌 로고를 활용한 세라믹 소재 머그', 6900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[11100513]_20190429144456596.jpg', 0, 1, 3);
INSERT INTO item values(578, '아이코닉 사이렌 머그 473ml', '스타벅스의 사이렌 로고를 활용한 세라믹 소재 머그', 2400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[11100514]_20190429144748991.jpg', 0, 1, 3);
INSERT INTO item values(579, '어뮤즈먼트 파크 좌표 머그 355ml', '스타벅스 용인에버랜드R점 전용 상품', 1700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002054]_20190709091312502.jpg', 0, 1, 3);
INSERT INTO item values(580, '어뮤즈먼트 파크 컬러 머그 355ml', '스타벅스 용인에버랜드R점 전용 상품', 9400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002055]_20190709091430969.jpg', 0, 1, 3);
INSERT INTO item values(581, '여름 바다 머그 473ml', '2020 서머1 프로모션 상품입니다.  오로라 빛 컬러가 아름다운 그란데 사이즈 머그입니다.', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002347]_20200406111239678.jpg', 0, 1, 3);
INSERT INTO item values(582, '우리나라 도자 머그 355ml', '상시 판매 상품', 9000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000001764]_20200221093233787.jpg', 0, 1, 3);
INSERT INTO item values(583, '인천 투어 머그 355ml', '인천 시티 상품', 5400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001752]_20190806110536414.jpg', 0, 1, 3);
INSERT INTO item values(584, '제주 에코컵 세트', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 7100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001166]_20180221164750351.jpg', 0, 1, 3);
INSERT INTO item values(585, '제주 투어 머그 355ml', '제주 시티 상품', 9300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001755]_20190806110735375.jpg', 0, 1, 3);
INSERT INTO item values(586, '청담스타 블랙 머그 237ml', '청담스타R점 전용 상품', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9300000001565]_20181212171018586.jpg', 0, 1, 3);
INSERT INTO item values(587, '청담스타 화이트 머그 296ml', '청담스타R점 전용 상품', 7000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/12/[9300000001566]_20181212171053150.jpg', 0, 1, 3);
INSERT INTO item values(588, '코리아 데미머그 세트(4개입)', '상시 판매 상품', 8000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/09/[9300000000884]_20170921155042586.jpg', 0, 1, 3);
INSERT INTO item values(589, '코리아 훈민정음 머그 355ml', '한글의 근원인 훈민정음이 새겨진 머그', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/10/[9300000000276]_20161007125445232.jpg', 0, 1, 3);
INSERT INTO item values(590, '티바나 그린 리드 머그 355ml', 'Teavana bar 매장 전용 상품', 8500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002121]_20191011094757279.jpg', 0, 1, 3);
INSERT INTO item values(591, '티바나 포터 머그 355ml', 'Teavana bar 매장 전용 상품', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002122]_20191011094908497.jpg', 0, 1, 3);
INSERT INTO item values(592, '티바나 핑크 리드 머그 355ml', 'Teavana bar 매장 전용 상품', 4500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002120]_20191011094641630.jpg', 0, 1, 3);
INSERT INTO item values(593, '티바나 핸들 머그 354ml', '티바나 브랜딩이 디자인 된 티 음료 전용 핸들 머그', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[11059977]_20160901112408712.jpg', 0, 1, 3);

-- 글라스
INSERT INTO item values(594, '글리터 핸들 글라스 355ml', '2020 서머1 프로모션 상품입니다.  핸들의 글리터가 포인트인 찬 음료 전용 글라스 머그입니다. ', 7100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002349]_20200406110324002.jpg', 0, 2, 3);
INSERT INTO item values(595, '사이렌 핸들 글라스 700ml', '2020 서머1 프로모션 상품입니다.  오로라 빛 컬러가 아름다운 700mL 대용량 글라스 머그입니다.', 1900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002350]_20200407105308715.jpg', 0, 2, 3);
INSERT INTO item values(596, '스타벅스 1호점 핸들 글라스 502ml', '이대R 매장 전용 상품', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002478]_20200513101116307.jpg', 0, 2, 3);
INSERT INTO item values(597, '어뮤즈먼트 파크 시온 글라스 머그 470ml', '스타벅스 용인에버랜드R점 전용 상품', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000002056]_20190813103127554.jpg', 0, 2, 3);
INSERT INTO item values(598, '라탄 글라스 워터보틀 533ml', '2020 서머2 프로모션 상품입니다.   라탄 슬리브가 매치된 글라스 워터보틀로 시즌한정 상품입니다. ', 8700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002509]_20200522111118139.jpg', 0, 2, 3);
INSERT INTO item values(599, '서머 사이렌 블루 글라스 콜드컵 591ml', '2020 서머2 프로모션 상품입니다.   사이렌 로고가 음각으로 디자인된 청량한 바다색의 글라스 콜드컵으로 시즌한정 상품입니다. ', 7500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002493]_20200522135009682.jpg', 0, 2, 3);
INSERT INTO item values(600, '서머 헤리티지 DW 글라스 355ml', '2020 서머2 프로모션 상품입니다.   우드 리드가 매치된 글라스로 시즌한정 상품입니다. ', 8500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002494]_20200522134806240.jpg', 0, 2, 3);
INSERT INTO item values(601, '헤리티지 그린 마블 글라스 355ml', '2020 서머2 프로모션 상품입니다.   유니크한 마블 디자인의 시즌한정 글라스 상품입니다. ', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002492]_20200522135232783.jpg', 0, 2, 3);
INSERT INTO item values(602, '바다 글라스 473ml', '2020 서머1 프로모션 상품입니다.  바닥 면에 바다를 연상시키는 글리터가 압착되어 있는 찬 음료 전용 글라스 제품입니다.', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002346]_20200407190237238.jpg', 0, 2, 3);
INSERT INTO item values(603, '바닷속 DW 글리터 글라스 콜드컵 591ml', '2020 서머1 프로모션 상품입니다.  이중벽 구조로 된 벤티 사이즈의 찬 음료 전용 글라스 콜드컵입니다.', 4400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002344]_20200406112505176.jpg', 0, 2, 3);
INSERT INTO item values(604, '오로라 글라스 콜드컵 473ml', '보는 각도에 따라 오묘한 컬러를 연출하는 글라스 콜드컵', 8100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000001773]_20191016143459371.jpg', 0, 2, 3);
INSERT INTO item values(605, '클래식 화이트 글라스 500ml', '살짝 얼은 듯한 표면 효과를 주어 더욱 시원하게 음료를 즐길 수 있는 글라스', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001771]_20190809135257372.jpg', 0, 2, 3);

-- 플라스틱 텀블러
INSERT INTO item values(634, '제주 에코 투고 컵 473ml', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 7700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001860]_20190214152641791.jpg', 0, 3, 3);
INSERT INTO item values(635, '티바나 블루 실린더 콜드컵 500ml', '상시 운영 상품 ', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/03/[9300000000545]_20170329152553869.jpg', 0, 3, 3);
INSERT INTO item values(636, '티바나 핑크 실린더 콜드컵 500ml', '상시 운영 상품 ', 8900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/03/[9300000000546]_20170329152114258.jpg', 0, 3, 3);
INSERT INTO item values(637, '옐로 러브 워터보틀 414ml', '2020 서머1 프로모션 상품입니다.  가벼워 휴대가 편리하고 네임스트랩이 있어 아이들이 사용하기 좋은 찬 음료 전용 워터보틀입니다.', 3700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002334]_20200406111107619.jpg', 0, 3, 3);
INSERT INTO item values(638, '화이트 서니 스트랩 워터보틀 500ml', '상/하단이 분리되어 세척에 용이한 플라스틱 소재 워터보틀', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/04/[11067556]_20180425174004769.jpg', 0, 3, 3);
INSERT INTO item values(639, 'SS 노바토 사이렌 브라운 텀블러 355ml', '2020 서머2 프로모션 상품입니다.   이중 잠금 장치로 완전 밀폐 가능한 시즌한정 텀블러입니다. ', 6100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002483]_20200529145525201.jpg', 0, 3, 3);
INSERT INTO item values(640, 'SS 사피어 화이트 텀블러 473ml', '2020 서머2 프로모션 상품입니다.   은은한 그러데이션과 스톤효과가 매력적인 시즌한정 텀블러입니다. ', 8800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002468]_20200522110530283.jpg', 0, 3, 3);
INSERT INTO item values(641, 'SS 서머 콩코드 그러데이션 텀블러 591ml', '2020 서머2 프로모션 상품입니다.   시원한 여름을 느낄 수 있는 컬러가 그러데이션으로 디자인된 스테인리스 스틸 재질의 시즌한정 텀블러 입니다. ', 6700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002470]_20200522111141632.jpg', 0, 3, 3);
INSERT INTO item values(642, 'SS 스트랩 화이트 히비스커스 텀블러 355ml', '2020 서머2 프로모션 상품입니다.   볼드한 그래픽 디자인이 매력적인 스테인리스 스틸 재질의 텀블러로 시즌한정 상품입니다.', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002473]_20200522132846273.jpg', 0, 3, 3);
INSERT INTO item values(643, 'SS 엘마 틸블루 그러데이션 텀블러 473ml', '2020 서머2 프로모션 상품입니다.  사이렌 로고가 음각으로 새겨져 더욱 세련되고 매력적인 시즌한정 텀블러입니다. ', 4500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002472]_20200522111527602.jpg', 0, 3, 3);
INSERT INTO item values(644, 'SS 제니 워드마크 텀블러 473ml', '2020 서머2 프로모션 상품입니다.   청량감 있는 컬러와 워드마크가 포인트인 스테인리스 스틸 재질의 시즌한정 텀블러입니다. ', 2700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002469]_20200522111002648.jpg', 0, 3, 3);
INSERT INTO item values(645, 'SS 트로이 소피아 텀블러 473ml', '2020 서머2 프로모션 상품입니다.   볼드한 그래픽 디자인이 매력적인 스테인리스 스틸 재질의 텀블러로 시즌한정 상품입니다.', 4000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002471]_20200522111346249.jpg', 0, 3, 3);
INSERT INTO item values(646, 'SS 서머 페일 그러데이션 콜드컵 473ml', '2020 서머2 프로모션 상품입니다.   시원한 여름을 느낄 수 있는 컬러가 그러데이션으로 디자인된 스테인리스 스틸 재질의 시즌한정 콜드컵입니다. ', 4300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002467]_20200522110354463.jpg', 0, 3, 3);
INSERT INTO item values(647, 'SS 헤리티지 딥그린 콜드컵 710ml', '2020 서머2 프로모션 상품입니다.  710ml 대용량 사이즈의 콜드컵으로 시즌한정 상품입니다. ', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002484]_20200522133202678.jpg', 0, 3, 3);
INSERT INTO item values(648, 'SS 헤리티지 DW 워터보틀 500ml', '2020 서머2 프로모션 상품입니다.   이중벽 구조로 결로없이 사용 가능한 스테인리스 스틸 재질의 워터보틀입니다. ', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002487]_20200522134506231.jpg', 0, 3, 3);
INSERT INTO item values(649, 'SS DW 그린 워드마크 투고 텀블러 591ml', '유광 디자인이 고급스러운 591ml 용량의 스테인리스 스틸 텀블러', 8100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002415]_20200414151152881.jpg', 0, 3, 3);
INSERT INTO item values(650, 'SS DW 클래식 투고 텀블러 473ml', '더블 월 구조로 제작된 컵 형태의 스테인리스 스틸 소재 텀블러', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001044]_20180221164951776.jpg', 0, 3, 3);
INSERT INTO item values(651, 'SS DW 파란 여름 투고 텀블러 591ml', '2020 서머1 프로모션 상품입니다.   시원한 컬러가 인상적인 벤티 사이즈 DW TO GO 텀블러입니다.', 8800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002343]_20200406113024010.jpg', 0, 3, 3);
INSERT INTO item values(652, 'SS DW 피치 선셋 투고 텀블러 473ml', '2020 서머1 프로모션 상품입니다.  붉은 컬러의 그러데이션이 인상적인 DW TO GO 텀블러입니다. ', 1600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002336]_20200406131131905.jpg', 0, 3, 3);
INSERT INTO item values(653, 'SS 경주 투어 텀블러 355ml', '경주 시티 상품', 6000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001758]_20190806110838028.jpg', 0, 3, 3);

-- 스테인리스 텀블러
INSERT INTO item values(654, 'SS 루시 레터 슬리브 텀블러 355ml', '시즌에 구애받지 않는 화이트 컬러에 돌려 여는 리드가 매치된 스테인리스 텀블러', 5600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000001768]_20191016142541993.jpg', 0, 4, 3);
INSERT INTO item values(655, 'SS 마블 화이트 오페라 텀블러 473ml', '깔끔한 화이트 바디 컬러에, 인조가죽 슬리브가 끼워져 있는 비교적 큰 용량의 스테인리스 스틸 소재 텀블러', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001770]_20190809135158926.jpg', 0, 4, 3);
INSERT INTO item values(656, 'SS 미르 레몬 텀블러 473ml', '2020 서머1 프로모션 상품입니다.  리드에 핸들이 부착된 미르 텀블러입니다.', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11111101]_20200407104836157.jpg', 0, 4, 3);
INSERT INTO item values(657, 'SS 부산 투어 텀블러 355m', '부산 시티 상품', 9700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001748]_20190806110134848.jpg', 0, 4, 3);
INSERT INTO item values(658, 'SS 북청사자놀음 텀블러 473ml', '상시 판매 상품', 2800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/11/[9300000001761]_20191112101432776.jpg', 0, 4, 3);
INSERT INTO item values(659, 'SS 블랙 헤리티지 오드리 텀블러 355ml', '매트한 바디 컬러에 플라스틱 소재 핸들에 매치되어 테이블에 두고 사용하기 좋은 텀블러', 6700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001769]_20190809135055101.jpg', 0, 4, 3);
INSERT INTO item values(660, 'SS 서울 투어 텀블러 355ml', '서울 시티 상품  ', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001745]_20190806105254858.jpg', 0, 4, 3);
INSERT INTO item values(661, 'SS 에치드 블랙 텀블러 473ml', '더블월 구조로 보냉/보온력이 우수한 스테인리스 스틸 소재 텀블러', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/08/[11067453]_20170828182541951.jpg', 0, 4, 3);
INSERT INTO item values(662, 'SS 에치드 실버 텀블러 473ml', '더블월 구조로 보냉/보온력이 우수한 스테인리스 스틸 소재 텀블러', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/08/[11067451]_20170828182453755.jpg', 0, 4, 3);
INSERT INTO item values(663, 'SS 엘마 블랙 헤리티지 텀블러 473ml', '입구가 넓어 사용하기 편리한 스테인리스 스틸 소재 텀블러', 2300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/01/[9300000001041]_20180103131602746.jpg', 0, 4, 3);
INSERT INTO item values(664, 'SS 엘마 클래식 화이트 텀블러 355ml', '견고한 구조의 스테인리스 스틸 소재 텀블러', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001046]_20180221165114868.jpg', 0, 4, 3);
INSERT INTO item values(665, 'SS 우리나라 도자 텀블러 355ml', '상시 판매 상품', 5300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000001763]_20200221093045820.jpg', 0, 4, 3);
INSERT INTO item values(666, 'SS 윌슨 서머 펀 텀블러 473ml', '2020 서머1 프로모션 상품입니다.  밀폐력이 우수한 컬러풀한 여름 무드의 텀블러입니다.', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11111100]_20200407104646174.jpg', 0, 4, 3);
INSERT INTO item values(667, 'SS 인천 투어 텀블러 355ml', '인천 시티 상품', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001751]_20190806110432098.jpg', 0, 4, 3);
INSERT INTO item values(668, 'SS 제주 수국 트로이 텀블러 473ml', '제주매장 한정 상품입니다.  수국이 핀 제주도 풍경을 그려낸 473ml 용량의 텀블러입니다. ', 4300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002533]_20200518173540052.jpg', 0, 4, 3);
INSERT INTO item values(669, 'SS 제주 투어 텀블러 355ml', '제주 시티 상품', 4800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001754]_20190806110640901.jpg', 0, 4, 3);
INSERT INTO item values(670, 'SS 처비돔 알로하 텀블러 355ml', '2020 서머1 프로모션 상품입니다.  바다 풍경을 담은 돔과 블루 컬러 바디가 결합된 텀블러입니다.', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002342]_20200407185546476.jpg', 0, 4, 3);
INSERT INTO item values(671, 'SS 컨투어 워드마크 텀블러 355ml', '리드에 사이렌 로고가 각인되어 더욱 매력적인 스테인리스 스틸 텀블러 ', 9800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002417]_20200414151617233.jpg', 0, 4, 3);
INSERT INTO item values(672, 'SS 콩코드 사이렌 화이트 텀블러 591ml', '보온/보냉 기능이 우수한 591ml 용량의 스테인리스 스틸 텀블러', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002414]_20200414150926317.jpg', 0, 4, 3);
INSERT INTO item values(673, 'SS 트로이 스타벅스 1호점 텀블러 473ml', '이대R 매장 전용 상품', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002479]_20200513101236010.jpg', 0, 4, 3);
INSERT INTO item values(674, 'SS 티바나 다니엘 텀블러 473ml', 'Teavana bar 매장 전용 상품', 5100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[9300000002126]_20200102112136688.jpg', 0, 4, 3);
INSERT INTO item values(675, 'SS 티바나 햄튼 텀블러 355ml', 'Teavana bar 매장 전용 상품', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002125]_20191011095237190.jpg', 0, 4, 3);
INSERT INTO item values(676, 'SS 허쉘 DW 투고 텀블러 473ml', '캐나다 라이프스타일 브랜드 Herschel과의 콜라보레이션 한정 상품입니다.  데스크탑에 놓고 사용하기 좋은 to go 텀블러 입니다.', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11112695]_20200420185408053.jpg', 0, 4, 3);
INSERT INTO item values(677, 'SS 그린 처비 핸들 텀블러 473ml', '핸들이 있는 스테인리스 스틸 텀블러', 8400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002416]_20200422151618946.jpg', 0, 4, 3);
INSERT INTO item values(678, 'SS 미르 핸들 서머 펀 텀블러 354ml', '2020 서머1 프로모션 상품입니다.  손잡이와 리드가 있는 컬러풀한 여름 무드의 텀블러입니다.', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11111098]_20200407104149364.jpg', 0, 4, 3);
INSERT INTO item values(679, 'SS 블랙 헤리티지 뉴턴 텀블러 355ml', '견고한 스테인리스 스틸 소재의 텀블러에 손잡이와 리드가 매치된 상품', 2800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/01/[9300000001033]_20180103131527591.jpg', 0, 4, 3);
INSERT INTO item values(680, 'SS 허쉘 오시어너스 텀블러 355ml', '캐나다 라이프스타일 브랜드 Herschel과의 콜라보레이션 한정 상품입니다.  손잡이가 있어 데스크탑에 놓고 사용하기 좋은 오시어너스 텀블러 입니다.', 4900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11112696]_20200420185630070.jpg', 0, 4, 3);
INSERT INTO item values(681, 'SS 데일리 옐로 콜드컵 473ml', '2020 서머1 프로모션 상품입니다.  옐로 컬러에 실리콘 잎사귀 참이 포인트인 찬 음료 전용 콜드컵입니다.', 7600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002337]_20200406131553845.jpg', 0, 4, 3);
INSERT INTO item values(682, 'SS 리저브 블랙 콜드컵 473ml', '스타벅스 리저브™ 매장 전용 상품', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11065291]_20190514171905284.jpg', 0, 4, 3);
INSERT INTO item values(683, 'SS 블랙 헤리티지 터커 콜드컵 473ml', '시크한 블랙 컬러의 스테인리스 스틸 바디에 고무 밴드가 있어 사용하기 편리한 콜드컵', 7800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001767]_20190809134952656.jpg', 0, 4, 3);
INSERT INTO item values(684, 'SS 옐로 사이렌 콜드컵 473ml', '2020 서머1 프로모션 상품입니다.  상큼한 옐로 컬러의 찬 음료전용 스테인리스 콜드컵입니다.', 9700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002339]_20200406132746740.jpg', 0, 4, 3);
INSERT INTO item values(685, 'SS 화이트 사이렌 콜드컵 591ml', '2020 서머1 프로모션 상품입니다.  컬러 그러데이션이 매력적인 찬 음료 전용의 벤티 사이즈 콜드컵입니다.', 6200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002338]_20200406131852441.jpg', 0, 4, 3);
INSERT INTO item values(686, 'SS 리저브 화이트 워터보틀 591ml', '스타벅스 리저브™ 매장 전용 상품', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11077107]_20190514171952539.jpg', 0, 4, 3);

-- 보온병
INSERT INTO item values(687, 'FFW 브라운 워드마크 보온병 1000ml', '2020 서머2 프로모션 상품입니다.   리드에 손잡이가 있는 컵이 함께 있어 야외에서 사용이 용이한 대용량의 시즌한정 보온병입니다.', 2000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002499]_20200522134041164.jpg',0, 5, 3);
INSERT INTO item values(688, 'JNL 헤리티지 딥블루 보온병 350ml', '2020 서머2 프로모션 상품입니다.   원터치 형식으로 리드가 개폐되는 초경량의 실용성 높은 시즌한정 보온병입니다. ', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002500]_20200522133419706.jpg', 0, 5, 3);
INSERT INTO item values(689, 'JNM 보태니컬 워드마크 보온병 480ml', '2020 서머2 프로모션 상품입니다.   이중 잠금 장치로 음료가 새는 것을 방지해주는 실용성 높은 시즌한정 보온병입니다. ', 5200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002501]_20200522112009719.jpg', 0, 5, 3);
INSERT INTO item values(690, 'JNT 서머 화이트 워드마크 보온병 550ml', '2020 서머2 프로모션 상품입니다.   스트랩이 추가되어 휴대성이 우수한 시즌한정 보온병입니다. ', 10000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002502]_20200522111632274.jpg', 0, 5, 3);
INSERT INTO item values(691, 'JMZ 그린 사이렌 보온병 350ml', '보온/보냉 기능이 우수한 아담한 보온병', 2600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002420]_20200414152251778.jpg', 0, 5, 3);
INSERT INTO item values(692, 'JNL 어뮤즈먼트 파크 보온병 500ml', '스타벅스 용인에버랜드R점 전용 상품', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002053]_20190709091207849.jpg', 0, 5, 3);
INSERT INTO item values(693, 'JNO 마블 화이트 보온병 500ml', '보온/보냉 효과가 매우 우수하며 완전 밀폐 가능한 리드가 매치된 보온병', 5100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000001048]_20180221165201088.jpg', 0, 5, 3);
INSERT INTO item values(694, 'JNO 알로하 보온병 500ml', '2020 서머1 프로모션 상품입니다.  열대 해변이 프린팅된 넉넉한 용량의 보온병입니다.', 9700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002333]_20200406103834664.jpg', 0, 5, 3);
INSERT INTO item values(695, 'JNX 피치 선셋 보온병 500ml', '2020 서머1 프로모션 상품입니다.  피치 코랄 컬러에 스타벅스 레터 로고가 포인트인 보온병입니다.', 9300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002340]_20200406133131630.jpg', 0, 5, 3);

-- 액세서리
INSERT INTO item values(696, '서머 보태니컬 장우산', '2020 서머2 프로모션 상품입니다.   휴양지 느낌이 물씬 나는 디자인에 우드 중봉, 가죽 패치가 매치되어 고급스러움 자아내는 장우산입니다.', 9700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002505]_20200529145817023.jpg', 0, 6, 3);
INSERT INTO item values(697, '서머 트래블 에코백', '2020 서머2 프로모션 상품입니다.   국내 라이프스타일 브랜드인 "RAWROW" 에서 제작한 넉넉한 사이즈와 패커블 기능이 돋보이는 에코백입니다.', 2200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002508]_20200529151014971.jpg', 0, 6, 3);
INSERT INTO item values(698, '서머 트래블 파우치세트', '2020 서머2 프로모션 상품입니다.   국내 라이프스타일 브랜드인 "RAWROW" 에서 제작한 2개 사이즈로 구성된 트래블 파우치 세트입니다.  ', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/06/[9300000002506]_20200608165606039.jpg', 0, 6, 3);
INSERT INTO item values(699, '어뮤즈먼트 파크 튤립 베어리스타', '용인에버랜드R점 단독 한정 상품입니다.  에버랜드 앞치마를 입고 튤립을 들고 있는 귀여운 베어리스타입니다.', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11096716]_20200423183501887.jpg', 0, 6, 3);
INSERT INTO item values(700, '경주 투어 미니백', '경주 시티 상품', 8100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001760]_20190801132033440.jpg', 0, 6, 3);
INSERT INTO item values(701, '리저브 블랙 에코백', '스타벅스 리저브™ 매장 전용 상품', 5200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11062168]_20190514171622852.jpg', 0, 6, 3);
INSERT INTO item values(702, '리저브 블루 카드 홀더', '스타벅스 리저브™ 매장 전용 상품', 5000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[11091483]_20190422142403568.jpg', 0, 6, 3);
INSERT INTO item values(703, '리저브 블루 펜슬 파우치', '스타벅스 리저브™ 매장 전용 상품', 9000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[11097100]_20190422143112931.jpg', 0, 6, 3);
INSERT INTO item values(704, '리저브 오렌지 카드 홀더', '스타벅스 리저브™ 매장 전용 상품', 7500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[11091482]_20190422142318174.jpg', 0, 6, 3);
INSERT INTO item values(705, '부산 투어 미니백', '부산 시티 상품', 3100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001750]_20190801131934710.jpg', 0, 6, 3);
INSERT INTO item values(706, '빈 데어 코리아 에코백', '상시 판매 상품', 9100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/01/[11111822]_20200131153730550.jpg', 0, 6, 3);
INSERT INTO item values(707, '서울 투어 에코백', '서울 시티 상품', 7200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001747]_20190801125703684.jpg', 0, 6, 3);
INSERT INTO item values(708, '스타벅스 1호점 랩탑 파우치', '이대R 매장 전용 상품', 4300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002111]_20190716144731124.jpg', 0, 6, 3);
INSERT INTO item values(709, '스타벅스 1호점 에코백', '이대R 매장 전용 상품', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002110]_20190716144615016.jpg', 0, 6, 3);
INSERT INTO item values(710, '스튜던트 투웨이 에코백', '숄더백 혹은 백팩, 2가지 타입으로 활용이 가능한 에코백입니다. ', 4600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001660]_20190226124901422.jpg', 0, 6, 3);
INSERT INTO item values(711, '알로하 쿨링백', '2020 서머1 프로모션 상품입니다.  그린 컬러에 포켓을 더해 실용성이 좋은 쿨링백입니다.', 3900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002352]_20200407105613543.jpg', 0, 6, 3);
INSERT INTO item values(712, '어뮤즈먼트 파크 에코백 ', '스타벅스 용인에버랜드R점 전용 상품', 6800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002058]_20190709091715729.jpg', 0, 6, 3);
INSERT INTO item values(713, '인천 투어 에코백', '인천 시티 상품', 2400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001753]_20190801130307354.jpg', 0, 6, 3);
INSERT INTO item values(714, '제주 손수건 2종 세트', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 1700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001863]_20190219134125265.jpg', 0, 6, 3);
INSERT INTO item values(715, '제주 수국 에코백', '제주매장 한정 상품입니다.  수국 자수가 곱게 놓인 활용도 높은 에코백 입니다.  ', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002524]_20200512095534037.jpg', 0, 6, 3);
INSERT INTO item values(716, '제주 시티 에코백', '제주 시티 상품', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/08/[9300000001757]_20190801130723521.jpg', 0, 6, 3);
INSERT INTO item values(717, '제주 유채꽃 에코백', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000000921]_20180221164318575.jpg', 0, 6, 3);

--커피용품
INSERT INTO item values(718, '허쉘 백팩', '캐나다 라이프스타일 브랜드 Herschel과의 콜라보레이션 한정 상품입니다.  PET를 재활용하여 제작한 더욱 의미 있는 패브릭 상품입니다.', 9000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11112697]_20200420185804401.jpg', 0, 7, 3);
INSERT INTO item values(719, '허쉘 에코백', '캐나다 라이프스타일 브랜드 Herschel과의 콜라보레이션 한정 상품입니다.  PET를 재활용하여 제작한 더욱 의미 있는 패브릭 상품입니다.', 4600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11112755]_20200420190111694.jpg', 0, 7, 3);
INSERT INTO item values(720, '허쉘 파우치', '캐나다 라이프스타일 브랜드 Herschel과의 콜라보레이션 한정 상품입니다.  PET를 재활용하여 제작한 더욱 의미 있는 패브릭 상품입니다.', 8500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11115437]_20200420190259950.jpg', 0, 7, 3);
INSERT INTO item values(721, '허쉘 힙백', '캐나다 라이프스타일 브랜드 Herschel과의 콜라보레이션 한정 상품입니다.  PET를 재활용하여 제작한 더욱 의미 있는 패브릭 상품입니다.', 7900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[11112698]_20200420185930509.jpg', 0, 7, 3);
INSERT INTO item values(722, '리저브 그린 키 체인', '리저브™ 매장 전용 상품', 9300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/11/[11091479]_20181113140144587.jpg', 0, 7, 3);
INSERT INTO item values(723, '리저브 레드 키 체인', '리저브™ 매장 전용 상품', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/11/[11091478]_20181113140113439.jpg', 0, 7, 3);
INSERT INTO item values(724, '리저브 우드 박스 펜슬 세트', '스타벅스 리저브™ 매장 전용 상품', 7300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/04/[11085385]_20190422142215591.jpg', 0, 7, 3);
INSERT INTO item values(725, '리저브 우드 카드 케이스', '스타벅스 리저브™ 매장 전용 상품', 5700, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11085384]_20190514172324186.jpg', 0, 7, 3);
INSERT INTO item values(726, '리저브 우드 트레이', '스타벅스 리저브™ 매장 전용 상품', 2200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11077766]_20190514172034399.jpg', 0, 7, 3);
INSERT INTO item values(727, '바닷속 스노우 글로브', '2020 서머1 프로모션 상품입니다.  바닷속 풍경을 담은 스노우 글로브입니다.', 9300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002353]_20200406105621266.jpg', 0, 7, 3);
INSERT INTO item values(728, '바닷속 콜드컵 키 체인', '2020 서머1 프로모션 상품입니다.  바닷속 풍경을 담은 콜드컵 키 체인입니다.', 7100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002354]_20200407110400856.jpg', 0, 7, 3);
INSERT INTO item values(729, '사이렌 코랄 패스포트 홀더', '5월 21일에 출시하는 여름시즌 한정 상품입니다.', 9500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002716]_20200513142222675.jpg', 0, 7, 3);
INSERT INTO item values(730, '사이렌 틸그린 패스포트 홀더', '5월 21일에 출시하는 여름시즌 한정 상품입니다.', 6400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002717]_20200520155947471.jpg', 0, 7, 3);
INSERT INTO item values(731, '서머 실리콘 스트로 세트', '2020 서머1 프로모션 상품입니다.   스타벅스커피 코리아에서 처음 소개되는 실리콘 스트로 세트 상품입니다.', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002355]_20200406103302806.jpg', 0, 7, 3);
INSERT INTO item values(732, '서머 트래블 스티커', '5월 21일에 출시하는 여름시즌 한정 상품입니다.', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002715]_20200513141524324.jpg', 0, 7, 3);
INSERT INTO item values(733, '스타벅스 트래블 스티커', '5월 21일에 출시하는 여름시즌 한정 상품입니다.', 7100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002714]_20200513141428999.jpg', 0, 7, 3);
INSERT INTO item values(734, '스튜던트 가죽 펜슬 케이스', '스튜던트 시리즈의 가죽 펜슬 케이스입니다.', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001661]_20190226133459489.jpg', 0, 7, 3);
INSERT INTO item values(735, '알로하 베어리스타 키 체인', '2020 서머1 프로모션 상품입니다.  훌라 댄서 복장의 베어리스타 키 체인입니다.', 9400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/04/[9300000002351]_20200407110036394.jpg', 0, 7, 3);
INSERT INTO item values(736, '어뮤즈먼트 파크 스타 키체인', '스타벅스 용인에버랜드R점 전용 상품', 3400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/07/[9300000002057]_20190709091624658.jpg', 0, 7, 3);
INSERT INTO item values(737, '우리나라 도자 마그넷 세트', '상시 판매 상품', 1500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/02/[9300000001766]_20200221093437465.jpg', 0, 7, 3);
INSERT INTO item values(738, '제주 마그넷 6종 세트', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001862]_20190219134256544.jpg', 0, 7, 3);
INSERT INTO item values(739, '제주 수국 베어리스타 키 체인', '제주매장 한정 상품입니다.  수국이 핀 제주로 힐링여행을 떠난 베어리스타 키링입니다.', 8000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002526]_20200512100759566.jpg', 0, 7, 3);
INSERT INTO item values(740, '제주 수국 스노우 글로브', '제주매장 한정 상품입니다.   수국이 활짝 핀 제주 풍경을 담은 스노우 글로브입니다.', 7400, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002528]_20200512102214982.jpg', 0, 7, 3);
INSERT INTO item values(741, '제주 수국 양우산', '제주매장 한정 상품입니다.  비오는 날의 제주 수국이 안쪽에 프린팅 된 3단 양산 겸용 우산입니다.', 3500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002525]_20200512102730592.jpg', 0, 7, 3);
INSERT INTO item values(742, '제주 수국 파우치 키 체인', '제주매장 한정 상품입니다.   작은 소품을 넣을 수 있는 파우치형 키 체인입니다.', 3800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002527]_20200512101828893.jpg', 0, 7, 3);
INSERT INTO item values(743, '제주 유채꽃 양우산', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 9000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/02/[9300000000922]_20180221164413065.jpg', 0, 7, 3);
INSERT INTO item values(744, '제주 하르방 키 체인', '제주 특화 상품  * 제주도 지역 내 매장에서만 판매합니다.', 9800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/02/[9300000001861]_20190214152428425.jpg', 0, 7, 3);
INSERT INTO item values(745, '서머 사이렌 글라스 피쳐 1200ml', '2020 서머2 프로모션 상품입니다.   콜드브루 필터 팩을 추출할 수 있는 글라스 재질의 시즌한정 상품입니다. ', 9900, 'https://www.istarbucks.co.kr/upload/store/skuimg/2020/05/[9300000002503]_20200522111349802.jpg', 0, 7, 3);
INSERT INTO item values(746, '3컵 리저브 카퍼 프렌치 프레스 ', '리저브 매장 전용 상품 ', 9200, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/06/[11070982]_20170615185335194.jpg', 0, 7, 3);
INSERT INTO item values(747, '4컵 리저브 카퍼 프렌치 프레스 ', '리저브 매장 전용 상품 ', 6100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/06/[11070983]_20170615185424777.jpg', 0, 7, 3);
INSERT INTO item values(748, '리저브 블랙 캐니스터', '스타벅스 리저브™ 매장 전용 상품', 5600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[11079035]_20180806095107445.jpg', 0, 7, 3);
INSERT INTO item values(749, '리저브 스타 스쿱/클립', '스타벅스 리저브™ 매장 전용 상품', 1600, 'https://www.istarbucks.co.kr/upload/store/skuimg/2018/08/[11091526]_20180806095220811.jpg', 0, 7, 3);
INSERT INTO item values(750, '리저브 블랙 푸어오버 드리퍼', '스타벅스 리저브™ 매장 전용 상품', 3000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/05/[11098342]_20190514172411170.jpg', 0, 7, 3);
INSERT INTO item values(751, '클래식 푸어 오버 콘 드리퍼', '커피를 드립 방식으로 내려 마실 때 사용하는는 세라믹 소재의 드리퍼 ', 6500, 'https://www.istarbucks.co.kr/upload/store/skuimg/2017/06/[11028807]_20170615184820649.jpg', 0, 7, 3);
INSERT INTO item values(752, '티바나 루비 레드 티 팟 473ml', 'Teavana bar 매장 전용 상품', 2800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002123]_20191011095026473.jpg', 0, 7, 3);
INSERT INTO item values(753, '티바나 펠트 그린 티 팟 473ml', 'Teavana bar 매장 전용 상품', 5800, 'https://www.istarbucks.co.kr/upload/store/skuimg/2019/10/[9300000002124]_20191011095136621.jpg', 0, 7, 3);
INSERT INTO item values(754, '페이퍼 필터 2', '커피 향과 맛을 최대한 살릴 수 있도록 고안된 종이 필터입니다. 2~4인용으로 적당합니다. ', 6100, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[5630001200]_20150810182538262.jpg', 0, 7, 3);
INSERT INTO item values(755, '페이퍼 필터 4', '커피 메이커 안에 넣어 커피 향과 맛을 최대한 살릴 수 있도록 고안된 종이 필터입니다. 4~7인용으로 적당합니다. ', 8300, 'https://www.istarbucks.co.kr/upload/store/skuimg/2015/08/[5630001201]_20150810182851245.jpg', 0, 7, 3);

-- 패티지 티
INSERT INTO item values(756, '티바나 제주녹차', '화학비료 대신 유기 비료만을 사용하여 재배한 것이 특징인 유기 녹차', 7000, 'https://www.istarbucks.co.kr/upload/store/skuimg/2016/09/[9300000000393]_20160905155645649.jpg', 0,8, 3);
*/
SELECT * FROM menu;
SELECT * FROM category;
SELECT * FROM item;

SELECT
    category.menu_id,
    category.category_id,
    item.item_id,
    item.item_name,
    item.item_price,
    item.description
FROM item
inner join menu
    on menu.menu_id = item.menu_id
inner join category
    on item.category_id = category.category_id
        and item.menu_id = category.menu_id;
