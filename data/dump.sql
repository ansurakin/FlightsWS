/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : avia

Target Server Type    : PGSQL
Target Server Version : 90500
File Encoding         : 65001

Date: 2018-02-13 09:29:30
*/

;

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS "flight";
CREATE TABLE "flight" (
"id" int8 NOT NULL,
"code" varchar(100) NOT NULL,
"date_depart" int8 NOT NULL,
"date_come" int8 NOT NULL,
"aircraft_id" int8 NOT NULL,
"city_from_id" int8 NOT NULL,
"city_to_id" int8 NOT NULL
)

;

-- ----------------------------
-- Records of flight
-- ----------------------------
BEGIN;
INSERT INTO "flight" VALUES ('1', 'TUV-234', '1328191800000', '1328202600000', '1', '1', '2');
INSERT INTO "flight" VALUES ('2', 'ITO-67', '1328472000000', '1328652900000', '2', '3', '2');
COMMIT;

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS "passenger";
CREATE TABLE "passenger" (
"id" int8 NOT NULL,
"given_name" varchar(255) NOT NULL,
"middle_name" varchar(255),
"family_name" varchar(255) NOT NULL,
"document_number" varchar(100) NOT NULL,
"email" varchar(100) NOT NULL,
"phone" varchar(45) NOT NULL
)

;

-- ----------------------------
-- Records of passenger
-- ----------------------------
BEGIN;
INSERT INTO "passenger" VALUES ('1', 'Given name', 'Miidle name', 'Family', 'AG2131', 'test@mail.ru', '234-2342-34');
INSERT INTO "passenger" VALUES ('2', 'Given name2', 'Miidle name2', 'Family2', 'AG342', 'test2@mail.ru', '111-2342-34');
COMMIT;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS "reservation";
CREATE TABLE "reservation" (
"id" int8 NOT NULL,
"flight_id" int8 NOT NULL,
"passenger_id" int8 NOT NULL,
"place_id" int8 NOT NULL,
"add_info" varchar(100),
"reserve_datetime" int8 NOT NULL,
"code" varchar(45) NOT NULL
)

;
COMMENT ON COLUMN "reservation"."code" IS 'уникальный номер после покупки';

-- ----------------------------
-- Records of reservation
-- ----------------------------
BEGIN;
INSERT INTO "reservation" VALUES ('9', '1', '1', '2', 'Без обеда', '1328418000000', '8b625c44-d0c7-4f0e-ad25-7f1f28172a45');
INSERT INTO "reservation" VALUES ('10', '1', '2', '3', 'Без обеда', '1328418000000', '8b625c41-d0c7-4f0e-ad25-7f1f28172a45');
COMMIT;

-- ----------------------------
-- Table structure for spr_aircraft
-- ----------------------------
DROP TABLE IF EXISTS "spr_aircraft";
CREATE TABLE "spr_aircraft" (
"id" int8 NOT NULL,
"name" varchar(200) NOT NULL,
"company_id" int8 NOT NULL,
"desc" varchar(200)
)

;

-- ----------------------------
-- Records of spr_aircraft
-- ----------------------------
BEGIN;
INSERT INTO "spr_aircraft" VALUES ('1', 'Fokker 100', '1', null);
INSERT INTO "spr_aircraft" VALUES ('2', 'Airbus 360', '1', null);
INSERT INTO "spr_aircraft" VALUES ('3', 'Boeing 747', '2', null);
COMMIT;

-- ----------------------------
-- Table structure for spr_aircraft_place
-- ----------------------------
DROP TABLE IF EXISTS "spr_aircraft_place";
CREATE TABLE "spr_aircraft_place" (
"id" int8 NOT NULL,
"aircraft_id" int8 NOT NULL,
"place_id" int8 NOT NULL
)

;
COMMENT ON TABLE "spr_aircraft_place" IS 'таблица связывает самолет и его места (связь "много ко многим")';

-- ----------------------------
-- Records of spr_aircraft_place
-- ----------------------------
BEGIN;
INSERT INTO "spr_aircraft_place" VALUES ('1', '1', '1');
INSERT INTO "spr_aircraft_place" VALUES ('2', '1', '2');
INSERT INTO "spr_aircraft_place" VALUES ('3', '1', '3');
INSERT INTO "spr_aircraft_place" VALUES ('4', '1', '4');
INSERT INTO "spr_aircraft_place" VALUES ('5', '1', '5');
INSERT INTO "spr_aircraft_place" VALUES ('6', '1', '6');
INSERT INTO "spr_aircraft_place" VALUES ('7', '1', '7');
INSERT INTO "spr_aircraft_place" VALUES ('8', '1', '8');
INSERT INTO "spr_aircraft_place" VALUES ('9', '1', '9');
INSERT INTO "spr_aircraft_place" VALUES ('10', '1', '10');
INSERT INTO "spr_aircraft_place" VALUES ('11', '1', '11');
INSERT INTO "spr_aircraft_place" VALUES ('12', '1', '12');
INSERT INTO "spr_aircraft_place" VALUES ('13', '1', '13');
INSERT INTO "spr_aircraft_place" VALUES ('14', '1', '14');
INSERT INTO "spr_aircraft_place" VALUES ('15', '1', '15');
INSERT INTO "spr_aircraft_place" VALUES ('16', '1', '16');
INSERT INTO "spr_aircraft_place" VALUES ('17', '1', '17');
INSERT INTO "spr_aircraft_place" VALUES ('18', '1', '18');
INSERT INTO "spr_aircraft_place" VALUES ('19', '1', '19');
INSERT INTO "spr_aircraft_place" VALUES ('20', '1', '20');
INSERT INTO "spr_aircraft_place" VALUES ('21', '2', '1');
INSERT INTO "spr_aircraft_place" VALUES ('22', '2', '2');
INSERT INTO "spr_aircraft_place" VALUES ('23', '2', '3');
INSERT INTO "spr_aircraft_place" VALUES ('24', '2', '4');
INSERT INTO "spr_aircraft_place" VALUES ('25', '2', '5');
INSERT INTO "spr_aircraft_place" VALUES ('26', '2', '6');
INSERT INTO "spr_aircraft_place" VALUES ('27', '2', '7');
INSERT INTO "spr_aircraft_place" VALUES ('28', '2', '8');
INSERT INTO "spr_aircraft_place" VALUES ('29', '2', '9');
INSERT INTO "spr_aircraft_place" VALUES ('30', '2', '10');
INSERT INTO "spr_aircraft_place" VALUES ('31', '2', '11');
INSERT INTO "spr_aircraft_place" VALUES ('32', '2', '12');
INSERT INTO "spr_aircraft_place" VALUES ('33', '2', '13');
INSERT INTO "spr_aircraft_place" VALUES ('34', '2', '14');
INSERT INTO "spr_aircraft_place" VALUES ('35', '2', '15');
INSERT INTO "spr_aircraft_place" VALUES ('36', '2', '16');
INSERT INTO "spr_aircraft_place" VALUES ('37', '2', '17');
INSERT INTO "spr_aircraft_place" VALUES ('38', '2', '18');
INSERT INTO "spr_aircraft_place" VALUES ('39', '2', '19');
INSERT INTO "spr_aircraft_place" VALUES ('40', '2', '20');
INSERT INTO "spr_aircraft_place" VALUES ('41', '2', '21');
INSERT INTO "spr_aircraft_place" VALUES ('42', '2', '22');
INSERT INTO "spr_aircraft_place" VALUES ('43', '2', '23');
INSERT INTO "spr_aircraft_place" VALUES ('44', '2', '24');
COMMIT;

-- ----------------------------
-- Table structure for spr_city
-- ----------------------------
DROP TABLE IF EXISTS "spr_city";
CREATE TABLE "spr_city" (
"id" int8 NOT NULL,
"name" varchar(200) NOT NULL,
"country_id" varchar(45) NOT NULL,
"code" varchar(45),
"desc" varchar(200)
)

;

-- ----------------------------
-- Records of spr_city
-- ----------------------------
BEGIN;
INSERT INTO "spr_city" VALUES ('1', 'Москва', '1', 'MOS', null);
INSERT INTO "spr_city" VALUES ('2', 'Нью-Йорк', '3', 'NY', null);
INSERT INTO "spr_city" VALUES ('3', 'Киев', '2', 'KI', null);
INSERT INTO "spr_city" VALUES ('6', 'Вашингтон', '3', 'WS', null);
INSERT INTO "spr_city" VALUES ('7', 'Самара', '1', 'SM', null);
COMMIT;

-- ----------------------------
-- Table structure for spr_company
-- ----------------------------
DROP TABLE IF EXISTS "spr_company";
CREATE TABLE "spr_company" (
"id" int8 NOT NULL,
"name" varchar(200) NOT NULL,
"desc" varchar(200)
)

;

-- ----------------------------
-- Records of spr_company
-- ----------------------------
BEGIN;
INSERT INTO "spr_company" VALUES ('1', 'America Airlines', null);
INSERT INTO "spr_company" VALUES ('2', 'Аэрофлот', null);
COMMIT;

-- ----------------------------
-- Table structure for spr_country
-- ----------------------------
DROP TABLE IF EXISTS "spr_country";
CREATE TABLE "spr_country" (
"id" int8 NOT NULL,
"name" varchar(200) NOT NULL,
"code" varchar(45) NOT NULL,
"flag" bytea,
"desc" varchar(200)
)

;
COMMENT ON COLUMN "spr_country"."code" IS 'сокращенный код страны';

-- ----------------------------
-- Records of spr_country
-- ----------------------------
BEGIN;
INSERT INTO "spr_country" VALUES ('1', 'Россия', 'RUS', E'\\211PNG\\015\\012\\032\\012\\000\\000\\000\\015IHDR\\000\\000\\000\\036\\000\\000\\000\\027\\010\\006\\000\\000\\000\\034?\\377j\\000\\000\\000\\011pHYs\\000\\000\\035\\207\\000\\000\\035\\207\\001\\217\\345\\361e\\000\\000\\000\\007tIME\\007\\336\\003\\034\\022\\007\\001\\236k\\224G\\000\\000\\000\\007tEXtAuthor\\000\\251\\256\\314H\\000\\000\\000\\014tEXtDescription\\000\\023\\011!#\\000\\000\\000\\012tEXtCopyright\\000\\254\\017\\314:\\000\\000\\000\\016tEXtCreation time\\0005\\367\\017\\011\\000\\000\\000\\011tEXtSoftware\\000]p\\377:\\000\\000\\000\\013tEXtDisclaimer\\000\\267\\300\\264\\217\\000\\000\\000\\010tEXtWarning\\000\\300\\033\\346\\207\\000\\000\\000\\007tEXtSource\\000\\365\\377\\203\\353\\000\\000\\000\\010tEXtComment\\000\\366\\314\\226\\277\\000\\000\\000\\006tEXtTitle\\000\\250\\356\\322''\\000\\000\\001\\330IDATH\\211\\305\\224?n\\023Q\\020\\306\\277of,\\214M\\020\\2269\\204\\257`.\\000\\027A\\242\\243D49@\\012\\267\\026\\342\\012t\\334\\200\\2062}\\332\\210\\026D\\024\\261d\\343}\\037\\305\\3729\\273\\353\\2048q\\354<i\\264\\273\\357\\317\\374f\\336|;\\234\\317\\347\\257\\246\\323\\351;3s\\000\\304\\016\\207$\\221<\\233\\315f\\2071\\032\\215\\016''\\223\\311\\353\\210\\330%s5\\212\\242\\000\\200\\223\\210\\210aD\\300\\335\\367\\002\\356\\365zp\\367\\201\\355\\205\\266>\\370X`\\030\\271S=\\335\\014\\226\\364(\\3408>Ni0X$w\\241\\231\\374m\\027\\221\\022p[\\314\\335u3\\240,+\\234\\236Jqtd\\326\\357\\273\\271;\\314j\\240Ym\\315\\000\\244\\032v\\027\\240te\\371\\\\U\\031./\\311\\000\\010)[\\015\\312\\233sf\\3316\\225C\\366q\\303*\\000`\\255k\\344\\003U\\325\\206\\335G\\203\\315\\000\\272\\301D\\2065\\263\\334\\207\\336\\254\\013\\336\\244\\206\\233\\216\\377\\371\\261\\346\\246\\207\\202^\\347\\243;\\027\\200\\004%Il)87\\226,\\270-\\302\\270\\346[\\212\\317\\361\\026o\\236\\274\\227\\033\\353\\016J\\266m+\\346z\\015\\313T\\341C\\365\\033\\361\\274\\377\\207/\\207\\013\\363\\346OL\\000\\340\\325\\363~\\324\\234\\\\\\013~\\221\\022\\372\\213\\222\\301\\241\\003/\\034\\253\\356\\321\\315\\226\\254\\035l\\312\\317{\\245%<C\\001\\210`"X\\030\\302\\236\\021\\034\\373\\022\\326\\200o\\225\\261\\032\\245\\315\\360\\004$\\202"\\354\\027\\021<0`\\354\\353\\365\\005\\032\\360\\273s\\333P\\0002\\000\\011\\220\\201?\\014a\\007\\016\\214\\243\\223\\351C\\200\\033j^]\\273\\201J\\340S"\\316\\007\\366\\267\\032;\\204\\316\\025\\353\\236\\320&\\274U\\353z2\\311P\\230\\225\\361\\361{\\361\\351\\333O-\\334\\031\\\\\\302\\353\\322\\326\\324-4\\275|\\021\\004AK\\221\\235_\\350\\354\\313I\\371\\365\\037\\230\\364\\372\\2563&\\251\\255\\000\\000\\000\\000IEND\\256B`\\202', null);
INSERT INTO "spr_country" VALUES ('2', 'Украина', 'UKR', E'\\211PNG\\015\\012\\032\\012\\000\\000\\000\\015IHDR\\000\\000\\000\\036\\000\\000\\000\\023\\010\\006\\000\\000\\000\\207\\256\\275|\\000\\000\\000\\011pHYs\\000\\000\\015\\327\\000\\000\\015\\327\\001B(\\233x\\000\\000\\000\\007tIME\\007\\336\\003\\034\\022\\0079\\266i,\\331\\000\\000\\000\\007tEXtAuthor\\000\\251\\256\\314H\\000\\000\\000\\014tEXtDescription\\000\\023\\011!#\\000\\000\\000\\012tEXtCopyright\\000\\254\\017\\314:\\000\\000\\000\\016tEXtCreation time\\0005\\367\\017\\011\\000\\000\\000\\011tEXtSoftware\\000]p\\377:\\000\\000\\000\\013tEXtDisclaimer\\000\\267\\300\\264\\217\\000\\000\\000\\010tEXtWarning\\000\\300\\033\\346\\207\\000\\000\\000\\007tEXtSource\\000\\365\\377\\203\\353\\000\\000\\000\\010tEXtComment\\000\\366\\314\\226\\277\\000\\000\\000\\006tEXtTitle\\000\\250\\356\\322''\\000\\000\\0003IDATH\\211c\\264*=\\362\\237a\\000\\000\\323@X:j\\361\\250\\305\\243\\026S\\025\\260\\244Y,\\032\\020\\213\\031\\177\\336\\025\\033-\\271F-\\036\\265x\\324b\\262\\000\\000\\361\\377\\006\\304jy\\324\\236\\000\\000\\000\\000IEND\\256B`\\202', null);
INSERT INTO "spr_country" VALUES ('3', 'США', 'USA', E'\\377\\330\\377\\340\\000\\020JFIF\\000\\001\\000\\001\\001,\\001,\\000\\000\\377\\376\\000\\037LEAD Technologies Inc. V1.01\\000\\377\\333\\000\\204\\000\\005\\005\\005\\010\\005\\010\\014\\007\\007\\014\\014\\011\\011\\011\\014\\015\\014\\014\\014\\014\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\001\\005\\010\\010\\012\\007\\012\\014\\007\\007\\014\\015\\014\\012\\014\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\015\\377\\304\\001\\242\\000\\000\\001\\005\\001\\001\\001\\001\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\001\\002\\003\\004\\005\\006\\007\\010\\011\\012\\013\\001\\000\\003\\001\\001\\001\\001\\001\\001\\001\\001\\001\\000\\000\\000\\000\\000\\000\\001\\002\\003\\004\\005\\006\\007\\010\\011\\012\\013\\020\\000\\002\\001\\003\\003\\002\\004\\003\\005\\005\\004\\004\\000\\000\\001}\\001\\002\\003\\000\\004\\021\\005\\022!1A\\006\\023Qa\\007"q\\0242\\201\\221\\241\\010#B\\261\\301\\025R\\321\\360$3br\\202\\011\\012\\026\\027\\030\\031\\032%&''()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\\203\\204\\205\\206\\207\\210\\211\\212\\222\\223\\224\\225\\226\\227\\230\\231\\232\\242\\243\\244\\245\\246\\247\\250\\251\\252\\262\\263\\264\\265\\266\\267\\270\\271\\272\\302\\303\\304\\305\\306\\307\\310\\311\\312\\322\\323\\324\\325\\326\\327\\330\\331\\332\\341\\342\\343\\344\\345\\346\\347\\350\\351\\352\\361\\362\\363\\364\\365\\366\\367\\370\\371\\372\\021\\000\\002\\001\\002\\004\\004\\003\\004\\007\\005\\004\\004\\000\\001\\002w\\000\\001\\002\\003\\021\\004\\005!1\\006\\022AQ\\007aq\\023"2\\201\\010\\024B\\221\\241\\261\\301\\011#3R\\360\\025br\\321\\012\\026$4\\341%\\361\\027\\030\\031\\032&''()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\\202\\203\\204\\205\\206\\207\\210\\211\\212\\222\\223\\224\\225\\226\\227\\230\\231\\232\\242\\243\\244\\245\\246\\247\\250\\251\\252\\262\\263\\264\\265\\266\\267\\270\\271\\272\\302\\303\\304\\305\\306\\307\\310\\311\\312\\322\\323\\324\\325\\326\\327\\330\\331\\332\\342\\343\\344\\345\\346\\347\\350\\351\\352\\362\\363\\364\\365\\366\\367\\370\\371\\372\\377\\300\\000\\021\\010\\000\\024\\000\\036\\003\\001\\021\\000\\002\\021\\001\\003\\021\\001\\377\\332\\000\\014\\003\\001\\000\\002\\021\\003\\021\\000?\\000\\361\\313;H\\232\\010\\311\\215\\013\\024C\\312\\014\\222V<\\177\\313<\\222O\\227\\217\\220\\223\\272<$\\276j\\015W\\353\\036\\357\\372\\357\\377\\000\\007\\257}\\254\\371;\\277\\257\\353\\372\\377\\000\\201\\321\\370R\\332\\3215H\\204\\311i\\345\\030\\345\\317\\332b\\235\\341\\316\\325\\333\\221j\\032B\\330\\301C\\346\\025#\\346\\375\\352\\2213\\371\\270\\337\\340\\273\\333\\342\\216\\367\\363\\355\\257\\341\\367l{y_?\\326?u\\355y\\271e\\374)R\\214\\376\\372\\336\\345\\273\\365\\354z\\367\\331\\364\\177\\371\\347\\241\\177\\340&\\261\\3765\\362\\332\\177w\\356\\221\\367?\\355=\\361\\377\\000\\3707\\001\\376DS[\\351\\030\\3414>\\275\\255u\\177\\352h\\323\\373\\277t\\210\\227\\326m\\276;\\377\\000\\006\\340\\177\\310\\247\\037\\200\\264\\330\\321Qm\\256\\002\\250\\000/\\366\\316\\217\\214\\001\\214c\\311\\301\\004n\\310?{\\315\\237v|\\371\\267\\373\\037_\\251\\374\\261\\373\\377\\000\\373o\\352\\313\\262>O\\3732\\227\\375\\004\\317\\377\\000\\010\\361?\\374\\211\\243\\246\\370Z\\337H\\270[\\3138\\257"\\235\\025\\224H\\272\\346\\224\\257\\207\\306\\341\\271c\\014w\\021\\226\\311\\371\\230\\226l\\261$\\343W\\025:\\261\\366r\\212J\\351\\373\\262I\\351\\363gM\\014\\015,<\\371\\335USF\\271j`1R\\216\\275me\\252\\350t\\336}\\367\\374\\364\\324\\177\\360\\241\\323\\277\\370\\232\\340\\327\\317\\377\\000\\003G\\247\\311G\\3710\\277\\370l\\305\\177\\231\\014\\363\\336\\355\\377\\000Y\\250\\365\\357\\342\\015<\\372\\373Q\\257\\237\\376\\006\\211p\\243\\374\\230o\\3746\\342\\227\\352x\\320\\361\\365\\317\\374\\371i?\\370.\\266\\377\\000\\342+\\237\\237\\312?\\370\\012>\\343\\373.\\037\\363\\377\\000\\027\\377\\000\\205U\\277\\371 \\377\\000\\204\\372\\347\\376|\\264\\237\\374\\027[\\177\\361\\024s\\371G\\377\\000\\001A\\375\\227\\017\\371\\377\\000\\213\\377\\000\\302\\252\\337\\374\\220\\177\\302}s\\377\\000>ZO\\376\\013\\255\\277\\370\\2129\\374\\243\\377\\000\\200\\240\\376\\313\\207\\374\\377\\000\\305\\377\\000\\341Uo\\376Hd\\236<\\271a\\217\\261iC\\351\\247[\\017\\375\\222\\216\\177(\\375\\310\\211e\\220K\\370\\370\\277\\374*\\255\\377\\000\\311\\037\\377\\331', null);
COMMIT;

-- ----------------------------
-- Table structure for spr_flight_class
-- ----------------------------
DROP TABLE IF EXISTS "spr_flight_class";
CREATE TABLE "spr_flight_class" (
"id" int8 NOT NULL,
"name" varchar(200) NOT NULL,
"desc" varchar(100)
)

;

-- ----------------------------
-- Records of spr_flight_class
-- ----------------------------
BEGIN;
INSERT INTO "spr_flight_class" VALUES ('1', 'Эконом', 'Без выбора меню');
INSERT INTO "spr_flight_class" VALUES ('2', 'Бизнес', 'Обед на выбор, больше места');
COMMIT;

-- ----------------------------
-- Table structure for spr_place
-- ----------------------------
DROP TABLE IF EXISTS "spr_place";
CREATE TABLE "spr_place" (
"id" int8 NOT NULL,
"seat_letter" char(1) NOT NULL,
"seat_number" int4 NOT NULL,
"flight_class_id" int8 NOT NULL
)

;

-- ----------------------------
-- Records of spr_place
-- ----------------------------
BEGIN;
INSERT INTO "spr_place" VALUES ('1', 'A', '1', '1');
INSERT INTO "spr_place" VALUES ('21', 'A', '1', '2');
INSERT INTO "spr_place" VALUES ('2', 'A', '2', '1');
INSERT INTO "spr_place" VALUES ('22', 'A', '2', '2');
INSERT INTO "spr_place" VALUES ('3', 'A', '3', '1');
INSERT INTO "spr_place" VALUES ('23', 'A', '3', '2');
INSERT INTO "spr_place" VALUES ('4', 'A', '4', '1');
INSERT INTO "spr_place" VALUES ('24', 'A', '4', '2');
INSERT INTO "spr_place" VALUES ('5', 'B', '1', '1');
INSERT INTO "spr_place" VALUES ('6', 'B', '2', '1');
INSERT INTO "spr_place" VALUES ('7', 'B', '3', '1');
INSERT INTO "spr_place" VALUES ('8', 'B', '4', '1');
INSERT INTO "spr_place" VALUES ('9', 'C', '1', '1');
INSERT INTO "spr_place" VALUES ('10', 'C', '2', '1');
INSERT INTO "spr_place" VALUES ('11', 'C', '3', '1');
INSERT INTO "spr_place" VALUES ('12', 'C', '4', '1');
INSERT INTO "spr_place" VALUES ('13', 'D', '1', '1');
INSERT INTO "spr_place" VALUES ('14', 'D', '2', '1');
INSERT INTO "spr_place" VALUES ('15', 'D', '3', '1');
INSERT INTO "spr_place" VALUES ('16', 'D', '4', '1');
INSERT INTO "spr_place" VALUES ('17', 'E', '1', '1');
INSERT INTO "spr_place" VALUES ('18', 'E', '2', '1');
INSERT INTO "spr_place" VALUES ('19', 'E', '3', '1');
INSERT INTO "spr_place" VALUES ('20', 'E', '4', '1');
COMMIT;

-- ----------------------------
-- Indexes structure for table flight
-- ----------------------------
CREATE UNIQUE INDEX "number_UNIQUE" ON "flight" USING btree (code);
CREATE INDEX "fk_aircraft_idx" ON "flight" USING btree (aircraft_id);
CREATE INDEX "fk_city_idx" ON "flight" USING btree (city_from_id);
CREATE INDEX "fk_city_to_idx" ON "flight" USING btree (city_to_id);

-- ----------------------------
-- Primary Key structure for table flight
-- ----------------------------
ALTER TABLE "flight" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table passenger
-- ----------------------------
ALTER TABLE "passenger" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table reservation
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE1" ON "reservation" USING btree (id);
CREATE UNIQUE INDEX "code_UNIQUE" ON "reservation" USING btree (code);
CREATE UNIQUE INDEX "idx_reserve" ON "reservation" USING btree (flight_id, passenger_id);
CREATE INDEX "fk_passenger_idx" ON "reservation" USING btree (passenger_id);
CREATE INDEX "fk_place_idx" ON "reservation" USING btree (place_id);

-- ----------------------------
-- Primary Key structure for table reservation
-- ----------------------------
ALTER TABLE "reservation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_aircraft
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE2" ON "spr_aircraft" USING btree (id);
CREATE INDEX "fk_company_idx" ON "spr_aircraft" USING btree (company_id);

-- ----------------------------
-- Primary Key structure for table spr_aircraft
-- ----------------------------
ALTER TABLE "spr_aircraft" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_aircraft_place
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE3" ON "spr_aircraft_place" USING btree (id);
CREATE INDEX "fk_aircraft_id_idx" ON "spr_aircraft_place" USING btree (aircraft_id);
CREATE INDEX "fk_place_id_idx" ON "spr_aircraft_place" USING btree (place_id);

-- ----------------------------
-- Primary Key structure for table spr_aircraft_place
-- ----------------------------
ALTER TABLE "spr_aircraft_place" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_city
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE4" ON "spr_city" USING btree (id);
CREATE UNIQUE INDEX "UNIQUE1" ON "spr_city" USING btree (name, country_id);

-- ----------------------------
-- Primary Key structure for table spr_city
-- ----------------------------
ALTER TABLE "spr_city" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_company
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE5" ON "spr_company" USING btree (id);

-- ----------------------------
-- Primary Key structure for table spr_company
-- ----------------------------
ALTER TABLE "spr_company" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_country
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE6" ON "spr_country" USING btree (id);

-- ----------------------------
-- Primary Key structure for table spr_country
-- ----------------------------
ALTER TABLE "spr_country" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_flight_class
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE7" ON "spr_flight_class" USING btree (id);

-- ----------------------------
-- Primary Key structure for table spr_flight_class
-- ----------------------------
ALTER TABLE "spr_flight_class" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table spr_place
-- ----------------------------
CREATE UNIQUE INDEX "index_uniq1" ON "spr_place" USING btree (seat_letter, seat_number, flight_class_id);
CREATE INDEX "fk_flight_class_idx" ON "spr_place" USING btree (flight_class_id);

-- ----------------------------
-- Primary Key structure for table spr_place
-- ----------------------------
ALTER TABLE "spr_place" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "flight"
-- ----------------------------
ALTER TABLE "flight" ADD FOREIGN KEY ("aircraft_id") REFERENCES "spr_aircraft" ("id");
ALTER TABLE "flight" ADD FOREIGN KEY ("city_from_id") REFERENCES "spr_city" ("id");
ALTER TABLE "flight" ADD FOREIGN KEY ("city_to_id") REFERENCES "spr_city" ("id");

-- ----------------------------
-- Foreign Key structure for table "reservation"
-- ----------------------------
ALTER TABLE "reservation" ADD FOREIGN KEY ("flight_id") REFERENCES "flight" ("id");
ALTER TABLE "reservation" ADD FOREIGN KEY ("passenger_id") REFERENCES "passenger" ("id");
ALTER TABLE "reservation" ADD FOREIGN KEY ("place_id") REFERENCES "spr_place" ("id");

-- ----------------------------
-- Foreign Key structure for table "spr_aircraft"
-- ----------------------------
ALTER TABLE "spr_aircraft" ADD FOREIGN KEY ("company_id") REFERENCES "spr_company" ("id");

-- ----------------------------
-- Foreign Key structure for table "spr_aircraft_place"
-- ----------------------------
ALTER TABLE "spr_aircraft_place" ADD FOREIGN KEY ("aircraft_id") REFERENCES "spr_aircraft" ("id");
ALTER TABLE "spr_aircraft_place" ADD FOREIGN KEY ("place_id") REFERENCES "spr_place" ("id");

-- ----------------------------
-- Foreign Key structure for table "spr_place"
-- ----------------------------
ALTER TABLE "spr_place" ADD FOREIGN KEY ("flight_class_id") REFERENCES "spr_flight_class" ("id");
;
