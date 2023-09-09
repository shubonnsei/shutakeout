-- Drop table if it exists
DROP TABLE IF EXISTS address_book;

-- Create table
CREATE TABLE address_book (
  id bigint PRIMARY KEY,
  user_id bigint NOT NULL,
  consignee varchar(50) NOT NULL,
  sex smallint NOT NULL, -- Used smallint instead of tinyint
  phone varchar(11) NOT NULL,
  province_code varchar(12),
  province_name varchar(32),
  city_code varchar(12),
  city_name varchar(32),
  district_code varchar(12),
  district_name varchar(32),
  detail varchar(200),
  label varchar(100),
  is_default smallint NOT NULL DEFAULT 0, -- Used smallint instead of tinyint
  create_time timestamp NOT NULL,
  update_time timestamp NOT NULL,
  create_user bigint NOT NULL,
  update_user bigint NOT NULL,
  is_deleted int NOT NULL DEFAULT 0
);

-- Comments for columns in Japanese
COMMENT ON COLUMN address_book.id IS '主キー';
COMMENT ON COLUMN address_book.user_id IS 'ユーザID';
COMMENT ON COLUMN address_book.consignee IS '受取人';
COMMENT ON COLUMN address_book.sex IS '性別 0 女性 1 男性';
COMMENT ON COLUMN address_book.phone IS '電話番号';
COMMENT ON COLUMN address_book.province_code IS '都道府県コード';
COMMENT ON COLUMN address_book.province_name IS '都道府県名';
COMMENT ON COLUMN address_book.city_code IS '市区町村コード';
COMMENT ON COLUMN address_book.city_name IS '市区町村名';
COMMENT ON COLUMN address_book.district_code IS '地域コード';
COMMENT ON COLUMN address_book.district_name IS '地域名';
COMMENT ON COLUMN address_book.detail IS '詳しい住所';
COMMENT ON COLUMN address_book.label IS 'ラベル';
COMMENT ON COLUMN address_book.is_default IS 'デフォルト 0 いいえ 1 はい';
COMMENT ON COLUMN address_book.create_time IS '作成時間';
COMMENT ON COLUMN address_book.update_time IS '更新時間';
COMMENT ON COLUMN address_book.create_user IS '作成者';
COMMENT ON COLUMN address_book.update_user IS '更新者';
COMMENT ON COLUMN address_book.is_deleted IS '削除済み';

-- Records of address_book
INSERT INTO address_book VALUES ('1417414526093082626', '1417012167126876162', '太郎', '1', '13812345678', null, null, null, null, null, null, '昌平区金燕龙オフィスビル', '会社', '1', '2021-07-20 17:22:12', '2021-07-20 17:26:33', '1417012167126876162', '1417012167126876162', '0');
INSERT INTO address_book VALUES ('1417414926166769666', '1417012167126876162', '次郎', '1', '13512345678', null, null, null, null, null, null, 'テスト', '家', '0', '2021-07-20 17:23:47', '2021-07-20 17:23:47', '1417012167126876162', '1417012167126876162', '0');

-- Table structure for category
DROP TABLE IF EXISTS category;
CREATE TABLE category (
  id bigint PRIMARY KEY,
  type int,
  name varchar(64) NOT NULL UNIQUE,
  sort int DEFAULT '0' NOT NULL,
  create_time timestamp NOT NULL,
  update_time timestamp NOT NULL,
  create_user bigint NOT NULL,
  update_user bigint NOT NULL
);

COMMENT ON COLUMN category.type IS 'タイプ 1 料理カテゴリ 2 セットメニューカテゴリ';
COMMENT ON COLUMN category.name IS 'カテゴリ名';
COMMENT ON COLUMN category.sort IS '順番';
COMMENT ON COLUMN category.create_time IS '作成日時';
COMMENT ON COLUMN category.update_time IS '更新日時';
COMMENT ON COLUMN category.create_user IS '作成者';
COMMENT ON COLUMN category.update_user IS '更新者';

COMMENT ON TABLE category IS '料理およびセットメニューカテゴリ';

-- Records of category
INSERT INTO category VALUES ('1397844263642378242', '1', '湖南料理', '1', '2021-05-27 09:16:58', '2021-07-15 20:25:23', '1', '1');
INSERT INTO category VALUES ('1397844303408574465', '1', '四川料理', '2', '2021-05-27 09:17:07', '2021-06-02 14:27:22', '1', '1');
INSERT INTO category VALUES ('1397844391040167938', '1', '広東料理', '3', '2021-05-27 09:17:28', '2021-07-09 14:37:13', '1', '1');
INSERT INTO category VALUES ('1413341197421846529', '1', 'ドリンク', '11', '2021-07-09 11:36:15', '2021-07-09 14:39:15', '1', '1');
INSERT INTO category VALUES ('1413342269393674242', '2', 'ビジネスセット', '5', '2021-07-09 11:40:30', '2021-07-09 14:43:45', '1', '1');
INSERT INTO category VALUES ('1413384954989060097', '1', '主食', '12', '2021-07-09 14:30:07', '2021-07-09 14:39:19', '1', '1');
INSERT INTO category VALUES ('1413386191767674881', '2', '子供セット', '6', '2021-07-09 14:35:02', '2021-07-09 14:39:05', '1', '1');

-- Table structure for dish
DROP TABLE IF EXISTS dish;
CREATE TABLE dish (
  id bigint PRIMARY KEY,
  name varchar(64) NOT NULL UNIQUE,
  category_id bigint NOT NULL,
  price decimal(10,2),
  code varchar(64) NOT NULL,
  image varchar(200) NOT NULL,
  description varchar(400),
  status int DEFAULT '1' NOT NULL,
  sort int DEFAULT '0' NOT NULL,
  create_time timestamp NOT NULL,
  update_time timestamp NOT NULL,
  create_user bigint NOT NULL,
  update_user bigint NOT NULL,
  is_deleted int DEFAULT '0' NOT NULL
);

COMMENT ON COLUMN dish.id IS '主キー';
COMMENT ON COLUMN dish.name IS '料理名';
COMMENT ON COLUMN dish.category_id IS '料理カテゴリID';
COMMENT ON COLUMN dish.price IS '料理の価格';
COMMENT ON COLUMN dish.code IS '商品コード';
COMMENT ON COLUMN dish.image IS '画像';
COMMENT ON COLUMN dish.description IS '説明情報';
COMMENT ON COLUMN dish.status IS '0 停止 1 販売開始';
COMMENT ON COLUMN dish.sort IS '順番';
COMMENT ON COLUMN dish.create_time IS '作成日時';
COMMENT ON COLUMN dish.update_time IS '更新日時';
COMMENT ON COLUMN dish.create_user IS '作成者';
COMMENT ON COLUMN dish.update_user IS '更新者';
COMMENT ON COLUMN dish.is_deleted IS '削除されているか';

COMMENT ON TABLE dish IS '料理管理';


INSERT INTO dish VALUES ('1397860792492666882', '焼きダック', '1397844391040167938', '28800.00', '213456432123457', '2e96a7e3-affb-438e-b7c4-e1430df425d0.jpeg', '広州式の焼きダックは主成分として選択されたダックを使用し、その香りを最大限に引き出すための調味料と一緒に炭火で焼き上げられます。特有の香りと美味しさが評価されています。', '1', '1', '2021-05-27 10:24:39', '2021-05-27 10:24:39', '1', '0', '0');

INSERT INTO "dish" VALUES ('1397849739276890114', '辣子鸡', '1397844263642378242', '7800.00', '222222222', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '来自鲜嫩美味的小鸡，值得一尝', '1', '0', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397850140982161409', '毛氏红烧肉', '1397844263642378242', '6800.00', '123412341234', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '毛氏红烧肉毛氏红烧肉，确定不来一份？', '1', '0', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397850392090947585', '组庵鱼翅', '1397844263642378242', '4800.00', '123412341234', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '组庵鱼翅，看图足以表明好吃程度', '1', '0', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397850851245600769', '霸王别姬', '1397844263642378242', '12800.00', '123412341234', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '还有什么比霸王别姬更美味的呢？', '1', '0', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397851099502260226', '全家福', '1397844263642378242', '11800.00', '23412341234', 'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', '别光吃肉啦，来份全家福吧，让你长寿又美味', '1', '0', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397851370462687234', '邵阳猪血丸子', '1397844263642378242', '13800.00', '1246812345678', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '看，美味不？来嘛来嘛，这才是最爱吖', '1', '0', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397851668262465537', '口味蛇', '1397844263642378242', '16800.00', '1234567812345678', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '爬行界的扛把子，东兴-口味蛇，让你欲罢不能', '1', '0', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397852391150759938', '辣子鸡丁', '1397844303408574465', '8800.00', '2346812468', 'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', '辣子鸡丁，辣子鸡丁，永远的魂', '1', '0', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397853183287013378', '麻辣兔头', '1397844303408574465', '19800.00', '123456787654321', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '麻辣兔头的详细制作，麻辣鲜香，色泽红润，回味悠长', '1', '0', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397853709101740034', '蒜泥白肉', '1397844303408574465', '9800.00', '1234321234321', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', '多么的有食欲啊', '1', '0', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397853890262118402', '鱼香肉丝', '1397844303408574465', '3800.00', '1234212321234', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', '鱼香肉丝简直就是我们童年回忆的一道经典菜，上学的时候点个鱼香肉丝盖饭坐在宿舍床上看着肥皂剧，绝了！现在完美复刻一下上学的时候感觉', '1', '0', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397854652581064706', '麻辣水煮鱼', '1397844303408574465', '14800.00', '2345312·345321', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '鱼片是买的切好的鱼片，放几个虾，增加味道', '1', '0', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397854865672679425', '鱼香炒鸡蛋', '1397844303408574465', '2000.00', '23456431·23456', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '鱼香菜也是川味的特色。里面没有鱼却鱼香味', '1', '0', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397860242057375745', '脆皮烧鹅', '1397844391040167938', '12800.00', '123456786543213456', 'e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', '“广东烤鸭美而香，却胜烧鹅说古冈（今新会），燕瘦环肥各佳妙，君休偏重便宜坊”，可见烧鹅与烧鸭在粤菜之中已早负盛名。作为广州最普遍和最受欢迎的烧烤肉食，以它的“色泽金红，皮脆肉嫩，味香可口”的特色，在省城各大街小巷的烧卤店随处可见。', '1', '0', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397860578738352129', '白切鸡', '1397844391040167938', '6600.00', '12345678654', '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', '白切鸡是一道色香味俱全的特色传统名肴，又叫白斩鸡，是粤菜系鸡肴中的一种，始于清代的民间。白切鸡通常选用细骨农家鸡与沙姜、蒜茸等食材，慢火煮浸白切鸡皮爽肉滑，清淡鲜美。著名的泮溪酒家白切鸡，曾获商业部优质产品金鼎奖。湛江白切鸡更是驰名粤港澳。粤菜厨坛中，鸡的菜式有200余款之多，而最为人常食不厌的正是白切鸡，深受食家青睐。', '1', '0', '2021-05-27 10:21:48', '2021-05-27 10:21:48', '1', '1', '0');
INSERT INTO dish VALUES ('1397860792492666881', '焼き乳豚', '1397844391040167938', '38800.00', '213456432123456', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', '広州式の焼き乳豚は主成分として小さな乳豚を使用し、ガーリックを補助材料として、調味料として五香粉、胡麻のペースト、八角粉などを使用しています。この料理は主に、食材を炭火で焼くことによって作られます。焼き乳豚は広州の最も有名な伝統的な料理の1つであり、"満漢全席"のメイン料理の1つとしても知られています。焼き乳豚は、長い間広東人が先祖を祀るための供え物として使われてきました。', '1', '0', '2021-05-27 10:22:39', '2021-05-27 10:22:39', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397860963880316929', '脆皮乳鸽', '1397844391040167938', '10800.00', '1234563212345', '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', '“脆皮乳鸽”是广东菜中的一道传统名菜，属于粤菜系，具有皮脆肉嫩、色泽红亮、鲜香味美的特点，常吃可使身体强健，清肺顺气。随着菜品制作工艺的不断发展，逐渐形成了熟炸法、生炸法和烤制法三种制作方法。无论那种制作方法，都是在鸽子经过一系列的加工，挂脆皮水后再加工而成，正宗的“脆皮乳鸽皮脆肉嫩、色泽红亮、鲜香味美、香气馥郁。这三种方法的制作过程都不算复杂，但想达到理想的效果并不容易。', '1', '0', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397861683434139649', '清蒸河鲜海鲜', '1397844391040167938', '38800.00', '1234567876543213456', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', '新鲜的海鲜，清蒸是最好的处理方式。鲜，体会为什么叫海鲜。清蒸是广州最经典的烹饪手法，过去岭南地区由于峻山大岭阻隔，交通不便，经济发展起步慢，自家打的鱼放在锅里煮了就吃，没有太多的讲究，但却发现这清淡的煮法能使鱼的鲜甜跃然舌尖。', '1', '0', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397862198033297410', '老火靓汤', '1397844391040167938', '49800.00', '123456786532455', '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', '老火靓汤又称广府汤，是广府人传承数千年的食补养生秘方，慢火煲煮的中华老火靓汤，火候足，时间长，既取药补之效，又取入口之甘甜。 广府老火汤种类繁多，可以用各种汤料和烹调方法，烹制出各种不同口味、不同功效的汤来。', '1', '0', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO "dish" VALUES ('1397862477831122945', '上汤焗龙虾', '1397844391040167938', '108800.00', '1234567865432', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', '上汤焗龙虾是一道色香味俱全的传统名菜，属于粤菜系。此菜以龙虾为主料，配以高汤制成的一道海鲜美食。本品肉质洁白细嫩，味道鲜美，蛋白质含量高，脂肪含量低，营养丰富。是色香味俱全的传统名菜。', '1', '0', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO "dish" VALUES ('1413342036832100354', '北冰洋', '1413341197421846529', '500.00', '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '', '1', '0', '2021-07-09 11:39:35', '2021-07-09 15:12:18', '1', '1', '0');
INSERT INTO "dish" VALUES ('1413384757047271425', '王老吉', '1413341197421846529', '500.00', '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', '', '1', '0', '2021-07-09 14:29:20', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO "dish" VALUES ('1413385247889891330', '米饭', '1413384954989060097', '200.00', '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '', '1', '0', '2021-07-09 14:31:17', '2021-07-11 16:35:26', '1', '1', '0');

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS "dish_flavor";
CREATE TABLE "dish_flavor" (
  "id" bigint PRIMARY KEY ,
  "dish_id" bigint NOT NULL,
  "name" varchar  NOT NULL,
  "value" varchar  DEFAULT NULL,
  "create_time" timestamp NOT NULL,
  "update_time" timestamp NOT NULL,
  "create_user" bigint NOT NULL,
  "update_user" bigint NOT NULL,
  "is_deleted" int NOT NULL DEFAULT '0'
) ;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO "dish_flavor" VALUES ('1397849417888346113', '1397849417854791681', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397849739297861633', '1397849739276890114', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397849739323027458', '1397849739276890114', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397849936421761025', '1397849936404983809', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397849936438538241', '1397849936404983809', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850141015715841', '1397850140982161409', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850141040881665', '1397850140982161409', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850392120307713', '1397850392090947585', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850392137084929', '1397850392090947585', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850630734262274', '1397850630700707841', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850630755233794', '1397850630700707841', '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850851274960898', '1397850851245600769', '忌口', '[\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397850851283349505', '1397850851245600769', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397851099523231745', '1397851099502260226', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397851099527426050', '1397851099502260226', '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397851370483658754', '1397851370462687234', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397851370483658755', '1397851370462687234', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397851370483658756', '1397851370462687234', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397851668283437058', '1397851668262465537', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397852391180120065', '1397852391150759938', '忌口', '[\"不要葱\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397852391196897281', '1397852391150759938', '辣度', '[\"不辣\",\"微辣\",\"重辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397853183307984898', '1397853183287013378', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397853423486414850', '1397853423461249026', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397853709126905857', '1397853709101740034', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397853890283089922', '1397853890262118402', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397854133632413697', '1397854133603053569', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397854652623007745', '1397854652581064706', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397854652635590658', '1397854652581064706', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397854865735593986', '1397854865672679425', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397855742303186946', '1397855742273826817', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397855906497605633', '1397855906468245506', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397856190573621250', '1397856190540066818', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397859056709316609', '1397859056684150785', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397859277837217794', '1397859277812051969', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397859487502086146', '1397859487476920321', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397859757061615618', '1397859757036449794', '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397860242086735874', '1397860242057375745', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397860963918065665', '1397860963880316929', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397861135754506242', '1397861135733534722', '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397861370035744769', '1397861370010578945', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397861683459305474', '1397861683434139649', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397861898467717121', '1397861898438356993', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397862198054268929', '1397862198033297410', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1397862477835317250', '1397862477831122945', '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398089545865015297', '1398089545676271617', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398089782323097601', '1398089782285348866', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398090003262255106', '1398090003228700673', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398090264554811394', '1398090264517062657', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398090455399837698', '1398090455324340225', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398090685449023490', '1398090685419663362', '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398090825358422017', '1398090825329061889', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398091007051476993', '1398091007017922561', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398091296164851713', '1398091296131297281', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398091546531246081', '1398091546480914433', '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398091729809747969', '1398091729788776450', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398091889499484161', '1398091889449152513', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398092095179763713', '1398092095142014978', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398092283877306370', '1398092283847946241', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398094018939236354', '1398094018893099009', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1398094391494094850', '1398094391456346113', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1399574026165727233', '1399305325713600514', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', '1399309715396669441', '1399309715396669441', '0');
INSERT INTO "dish_flavor" VALUES ('1413389540592263169', '1413384757047271425', '温度', '[\"常温\",\"冷藏\"]', '2021-07-12 09:09:16', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO "dish_flavor" VALUES ('1413389684020682754', '1413342036832100354', '温度', '[\"常温\",\"冷藏\"]', '2021-07-09 15:12:18', '2021-07-09 15:12:18', '1', '1', '0');

-- ----------------------------
-- ----------------------------,
-- Table structure for employee,
-- ----------------------------,
DROP TABLE IF EXISTS "employee";
CREATE TABLE "employee" (
  "id" bigint PRIMARY KEY,
  "name" varchar  NOT NULL,
  "username" varchar  NOT NULL,
  "password" varchar  NOT NULL,
  "phone" varchar  NOT NULL,
  "sex" varchar  NOT NULL,
  "id_number" varchar  NOT NULL,
  "status" int NOT NULL DEFAULT '1',
  "create_time" timestamp NOT NULL,
  "update_time" timestamp NOT NULL,
  "create_user" bigint NOT NULL,
  "update_user" bigint NOT NULL,
  UNIQUE ("username")
) ;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO "employee" VALUES ('1', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', '1', '2021-05-06 17:20:07', '2021-05-10 02:24:09', '1', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "orders";
CREATE TABLE "orders" (
  "id" bigint PRIMARY KEY,
  "number" varchar  DEFAULT NULL,
  "status" int NOT NULL DEFAULT '1',
  "user_id" bigint NOT NULL,
  "address_book_id" bigint NOT NULL,
  "order_time" timestamp NOT NULL,
  "checkout_time" timestamp NOT NULL,
  "pay_method" int NOT NULL DEFAULT '1',
  "amount" decimal(10,2) NOT NULL,
  "remark" varchar  DEFAULT NULL,
  "phone" varchar  DEFAULT NULL,
  "address" varchar  DEFAULT NULL,
  "user_name" varchar  DEFAULT NULL,
  "consignee" varchar  DEFAULT NULL
) ;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS "order_detail";
CREATE TABLE "order_detail" (
  "id" bigint PRIMARY KEY,
  "name" varchar  DEFAULT NULL,
  "image" varchar  DEFAULT NULL,
  "order_id" bigint NOT NULL,
  "dish_id" bigint DEFAULT NULL,
  "setmeal_id" bigint DEFAULT NULL,
  "dish_flavor" varchar  DEFAULT NULL,
  "number" int NOT NULL DEFAULT '1',
  "amount" decimal(10,2) NOT NULL
) ;
-- ----------------------------,
-- Records of order_detail,
-- ----------------------------,

-- ----------------------------,
-- Table structure for setmeal,
-- ----------------------------,
DROP TABLE IF EXISTS "setmeal";
CREATE TABLE "setmeal" (
  "id" bigint PRIMARY KEY,
  "category_id" bigint NOT NULL,
  "name" varchar  NOT NULL,
  "price" decimal(10,2) NOT NULL,
  "status" int DEFAULT NULL,
  "code" varchar  DEFAULT NULL,
  "description" varchar  DEFAULT NULL,
  "image" varchar  DEFAULT NULL,
  "create_time" timestamp NOT NULL,
  "update_time" timestamp NOT NULL,
  "create_user" bigint NOT NULL,
  "update_user" bigint NOT NULL,
  "is_deleted" int NOT NULL DEFAULT '0',
  UNIQUE ("name")
) ;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO "setmeal" VALUES ('1415580119015145474', '1413386191767674881', '儿童套餐A计划', '4000.00', '1', '', '', '61d20592-b37f-4d72-a864-07ad5bb8f3bb.jpg', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS "setmeal_dish";
CREATE TABLE "setmeal_dish" (
  "id" bigint PRIMARY KEY,
  "setmeal_id" varchar NOT NULL,
  "dish_id" varchar  NOT NULL,
  "name" varchar  DEFAULT NULL,
  "price" decimal(10,2) DEFAULT NULL,
  "copies" int NOT NULL,
  "sort" int NOT NULL DEFAULT '0',
  "create_time" timestamp NOT NULL,
  "update_time" timestamp NOT NULL,
  "create_user" bigint NOT NULL,
  "update_user" bigint NOT NULL,
  "is_deleted" int NOT NULL DEFAULT '0'
) ;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO "setmeal_dish" VALUES ('1415580119052894209', '1415580119015145474', '1397862198033297410', '老火靓汤', '49800.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO "setmeal_dish" VALUES ('1415580119061282817', '1415580119015145474', '1413342036832100354', '北冰洋', '500.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO "setmeal_dish" VALUES ('1415580119069671426', '1415580119015145474', '1413385247889891330', '米饭', '200.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS "shopping_cart";
CREATE TABLE "shopping_cart" (
  "id" bigint PRIMARY KEY,
  "name" varchar  DEFAULT NULL,
  "image" varchar  DEFAULT NULL,
  "user_id" bigint NOT NULL,
  "dish_id" bigint DEFAULT NULL,
  "setmeal_id" bigint DEFAULT NULL,
  "dish_flavor" varchar  DEFAULT NULL,
  "number" int NOT NULL DEFAULT '1',
  "amount" decimal(10,2) NOT NULL,
  "create_time" timestamp DEFAULT NULL
) ;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
  "id" bigint PRIMARY KEY,
  "name" varchar  DEFAULT NULL,
  "phone" varchar  NOT NULL,
  "sex" varchar  DEFAULT NULL,
  "id_number" varchar  DEFAULT NULL,
  "avatar" varchar  DEFAULT NULL,
  "status" int DEFAULT '0'
) ;

COMMENT ON COLUMN "address_book"."id" IS '主キー';
COMMENT ON COLUMN "address_book"."user_id" IS 'ユーザーid';
COMMENT ON COLUMN "address_book"."consignee" IS '受取人';
COMMENT ON COLUMN "address_book"."sex" IS '性別 0 女性 1 男性';
COMMENT ON COLUMN "address_book"."phone" IS '携帯番号';
COMMENT ON COLUMN "address_book"."province_code" IS '県レベル区划番号';
COMMENT ON COLUMN "address_book"."province_name" IS '県レベル名称';
COMMENT ON COLUMN "address_book"."city_code" IS '市レベル区划番号';
COMMENT ON COLUMN "address_book"."city_name" IS '市レベル名称';
COMMENT ON COLUMN "address_book"."district_code" IS '区レベル区划番号';
COMMENT ON COLUMN "address_book"."district_name" IS '区レベル名称';
COMMENT ON COLUMN "address_book"."detail" IS '詳しいアドレス';
COMMENT ON COLUMN "address_book"."label" IS 'タグ';
COMMENT ON COLUMN "address_book"."is_default" IS 'デフォルト 0 いいえ 1はい';
COMMENT ON COLUMN "address_book"."create_time" IS '作成時間';
COMMENT ON COLUMN "address_book"."update_time" IS '更新時間';
COMMENT ON COLUMN "address_book"."create_user" IS '作成人';
COMMENT ON COLUMN "address_book"."update_user" IS '修正者';
COMMENT ON COLUMN "address_book"."is_deleted" IS 'はいいいえ删除';
COMMENT ON TABLE "address_book" IS '地址管理';
COMMENT ON COLUMN "category"."id" IS '主キー';
COMMENT ON COLUMN "category"."type" IS 'タイプ   1 料理分类 2 セットメニュー分类';
COMMENT ON COLUMN "category"."name" IS '分类名称';
COMMENT ON COLUMN "category"."sort" IS '順序';
COMMENT ON COLUMN "category"."create_time" IS '作成時間';
COMMENT ON COLUMN "category"."update_time" IS '更新時間';
COMMENT ON COLUMN "category"."create_user" IS '作成人';
COMMENT ON COLUMN "category"."update_user" IS '修正者';
COMMENT ON TABLE "category" IS '菜品及套餐分类';
COMMENT ON COLUMN "dish"."id" IS '主キー';
COMMENT ON COLUMN "dish"."name" IS '料理名称';
COMMENT ON COLUMN "dish"."category_id" IS '料理分类id';
COMMENT ON COLUMN "dish"."price" IS '料理価格';
COMMENT ON COLUMN "dish"."code" IS '商品コード';
COMMENT ON COLUMN "dish"."image" IS '画像';
COMMENT ON COLUMN "dish"."description" IS '説明信息';
COMMENT ON COLUMN "dish"."status" IS '0 停售 1 起售';
COMMENT ON COLUMN "dish"."sort" IS '順序';
COMMENT ON COLUMN "dish"."create_time" IS '作成時間';
COMMENT ON COLUMN "dish"."update_time" IS '更新時間';
COMMENT ON COLUMN "dish"."create_user" IS '作成人';
COMMENT ON COLUMN "dish"."update_user" IS '修正者';
COMMENT ON COLUMN "dish"."is_deleted" IS 'はいいいえ删除';
COMMENT ON TABLE "dish" IS '菜品管理';
COMMENT ON COLUMN "dish_flavor"."id" IS '主キー';
COMMENT ON COLUMN "dish_flavor"."dish_id" IS '料理';
COMMENT ON COLUMN "dish_flavor"."name" IS '味名称';
COMMENT ON COLUMN "dish_flavor"."value" IS '味数据list';
COMMENT ON COLUMN "dish_flavor"."create_time" IS '作成時間';
COMMENT ON COLUMN "dish_flavor"."update_time" IS '更新時間';
COMMENT ON COLUMN "dish_flavor"."create_user" IS '作成人';
COMMENT ON COLUMN "dish_flavor"."update_user" IS '修正者';
COMMENT ON COLUMN "dish_flavor"."is_deleted" IS 'はいいいえ删除';
COMMENT ON TABLE "dish_flavor" IS '菜品口味关系表';
COMMENT ON COLUMN "employee"."id" IS '主キー';
COMMENT ON COLUMN "employee"."name" IS '氏名';
COMMENT ON COLUMN "employee"."username" IS 'ユーザー名';
COMMENT ON COLUMN "employee"."password" IS 'パスワード';
COMMENT ON COLUMN "employee"."phone" IS '携帯番号';
COMMENT ON COLUMN "employee"."sex" IS '性別';
COMMENT ON COLUMN "employee"."id_number" IS 'ID番号';
COMMENT ON COLUMN "employee"."status" IS '状態 0:禁止，1:正常';
COMMENT ON COLUMN "employee"."create_time" IS '作成時間';
COMMENT ON COLUMN "employee"."update_time" IS '更新時間';
COMMENT ON COLUMN "employee"."create_user" IS '作成人';
COMMENT ON COLUMN "employee"."update_user" IS '修正者';
COMMENT ON TABLE "employee" IS '员工信息';
COMMENT ON COLUMN "orders"."id" IS '主キー';
COMMENT ON COLUMN "orders"."number" IS '注文号';
COMMENT ON COLUMN "orders"."status" IS '注文状態 1待付款，2待派送，3已派送，4已完成，5已取消';
COMMENT ON COLUMN "orders"."user_id" IS '下单ユーザー';
COMMENT ON COLUMN "orders"."address_book_id" IS 'アドレスid';
COMMENT ON COLUMN "orders"."order_time" IS '下单時間';
COMMENT ON COLUMN "orders"."checkout_time" IS '结账時間';
COMMENT ON COLUMN "orders"."pay_method" IS '支払い方法 1WeChat,2アリペイ';
COMMENT ON COLUMN "orders"."amount" IS '实收金额';
COMMENT ON COLUMN "orders"."remark" IS '備考';
COMMENT ON TABLE "orders" IS '订单表';
COMMENT ON COLUMN "order_detail"."id" IS '主キー';
COMMENT ON COLUMN "order_detail"."name" IS '名前';
COMMENT ON COLUMN "order_detail"."image" IS '画像';
COMMENT ON COLUMN "order_detail"."order_id" IS '注文id';
COMMENT ON COLUMN "order_detail"."dish_id" IS '料理id';
COMMENT ON COLUMN "order_detail"."setmeal_id" IS 'セットメニューid';
COMMENT ON COLUMN "order_detail"."dish_flavor" IS '味';
COMMENT ON COLUMN "order_detail"."number" IS '数量';
COMMENT ON COLUMN "order_detail"."amount" IS '金额';
COMMENT ON TABLE "order_detail" IS '订单明细表';
COMMENT ON COLUMN "setmeal"."id" IS '主キー';
COMMENT ON COLUMN "setmeal"."category_id" IS '料理分类id';
COMMENT ON COLUMN "setmeal"."name" IS 'セットメニュー名称';
COMMENT ON COLUMN "setmeal"."price" IS 'セットメニュー価格';
COMMENT ON COLUMN "setmeal"."status" IS '状態 0:停用 1:启用';
COMMENT ON COLUMN "setmeal"."code" IS 'コード';
COMMENT ON COLUMN "setmeal"."description" IS '説明信息';
COMMENT ON COLUMN "setmeal"."image" IS '画像';
COMMENT ON COLUMN "setmeal"."create_time" IS '作成時間';
COMMENT ON COLUMN "setmeal"."update_time" IS '更新時間';
COMMENT ON COLUMN "setmeal"."create_user" IS '作成人';
COMMENT ON COLUMN "setmeal"."update_user" IS '修正者';
COMMENT ON COLUMN "setmeal"."is_deleted" IS 'はいいいえ删除';
COMMENT ON TABLE "setmeal" IS '套餐';
COMMENT ON COLUMN "setmeal_dish"."id" IS '主キー';
COMMENT ON COLUMN "setmeal_dish"."setmeal_id" IS 'セットメニューid ';
COMMENT ON COLUMN "setmeal_dish"."dish_id" IS '料理id';
COMMENT ON COLUMN "setmeal_dish"."name" IS '料理名称 （冗余字段）';
COMMENT ON COLUMN "setmeal_dish"."price" IS '料理原价（冗余字段）';
COMMENT ON COLUMN "setmeal_dish"."copies" IS '部数';
COMMENT ON COLUMN "setmeal_dish"."sort" IS 'ソート';
COMMENT ON COLUMN "setmeal_dish"."create_time" IS '作成時間';
COMMENT ON COLUMN "setmeal_dish"."update_time" IS '更新時間';
COMMENT ON COLUMN "setmeal_dish"."create_user" IS '作成人';
COMMENT ON COLUMN "setmeal_dish"."update_user" IS '修正者';
COMMENT ON COLUMN "setmeal_dish"."is_deleted" IS 'はいいいえ删除';
COMMENT ON TABLE "setmeal_dish" IS '套餐菜品关系';
COMMENT ON COLUMN "shopping_cart"."id" IS '主キー';
COMMENT ON COLUMN "shopping_cart"."name" IS '名称';
COMMENT ON COLUMN "shopping_cart"."image" IS '画像';
COMMENT ON COLUMN "shopping_cart"."user_id" IS '主キー';
COMMENT ON COLUMN "shopping_cart"."dish_id" IS '料理id';
COMMENT ON COLUMN "shopping_cart"."setmeal_id" IS 'セットメニューid';
COMMENT ON COLUMN "shopping_cart"."dish_flavor" IS '味';
COMMENT ON COLUMN "shopping_cart"."number" IS '数量';
COMMENT ON COLUMN "shopping_cart"."amount" IS '金额';
COMMENT ON COLUMN "shopping_cart"."create_time" IS '作成時間';
COMMENT ON TABLE "shopping_cart" IS '购物车';
COMMENT ON COLUMN "user"."id" IS '主キー';
COMMENT ON COLUMN "user"."name" IS '氏名';
COMMENT ON COLUMN "user"."phone" IS '携帯番号';
COMMENT ON COLUMN "user"."sex" IS '性別';
COMMENT ON COLUMN "user"."id_number" IS 'ID番号';
COMMENT ON COLUMN "user"."avatar" IS 'アバター';
COMMENT ON COLUMN "user"."status" IS '状態 0:禁止，1:正常';
COMMENT ON TABLE "user" IS '用户信息';