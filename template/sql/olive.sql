/*言語を設定*/
set names utf8;

/*初期化？*/
set foreign_key_checks = 0;

/*同じデータベース名のデータベースが存在する場合は消去する*/
drop database if exists olive;

/*データベースを新たに作成する*/
create database if not exists olive;

/*データベースを使用すると定義する*/
use olive;

/*同じテーブル名のテーブルが存在する場合は消去する(念のため?)*/
drop table if exists user_info;

/*テーブルを新たに作成する*/
create table user_info(

/*重複しないシーケンス番号を割り当てている*/
	id int primary key not null auto_increment,/*ID*/

	/*テーブルの中の名前と型と大きさを記載*/
	user_id  varchar(16) unique not null,/*ユーザーID*/
	password varchar(16) not null,/*パスワード*/
	family_name varchar(32) not null,/*姓*/
	first_name varchar(32) not null,/*名*/
	family_name_kana varchar(32) not null,/*姓かな*/
	first_name_kana varchar(32) not null,/*名かな*/
	sex tinyint default 0,/*性別*/
	email varchar(32),/*メールアドレス*/
	status tinyint default 0,/*ステータス*/
	logined tinyint default 0,/*ログインフラグ*/
	regist_date datetime,/*登録日時*/
	update_date datetime/*更新日時*/
);

/*同じテーブル名のテーブルが存在する場合は消去する(念のため?)*/
drop table if exists product_info;

/*テーブルを新たに作成する*/
create table product_info(

	/*重複しないシーケンス番号を割り当てている*/
	id int not null primary key auto_increment,/*ID*/

	/*テーブルの中の名前と型と大きさを記載*/
	product_id int unique not null,/*商品ID*/
	product_name varchar(100) unique not null,/*商品名*/
	product_name_kana varchar(100) unique not null,/*商品名かな*/
	product_description varchar(255),/*商品詳細*/
	category_id int not null,/*カテゴリID*/
	price int not null,/*値段*/
	image_file_path varchar(100) not null,/*画像ファイルパス*/
	image_file_name varchar(50) not null,/*画像ファイル名*/
	release_date datetime,/*発売年月*/
	release_company varchar(50),/*発売会社*/
	logined tinyint default 1,/*ステータス*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(category_id) references m_category(category_id)
);

/*同じテーブル名のテーブルが存在する場合は消去する(念のため?)*/
drop table if exists cart_info;

/*テーブルを新たに作成する*/
create table cart_info(

	/*重複しないシーケンス番号を割り当てている*/
	id int not null primary key auto_increment,/*ID*/

	/*テーブルの中の名前と型と大きさを記載*/
	user_id varchar(16) not null,/*ユーザーID*/
	product_id int not null,/*商品ID*/
	product_count int not null,/*個数*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(product_id) references product_info(product_id)
);

/*同じテーブル名のテーブルが存在する場合は消去する(念のため?)*/
drop table if exists purchase_history_info;

/*テーブルを新たに作成する*/
create table purchase_history_info(

	/*重複しないシーケンス番号を割り当てている*/
	id int not null primary key auto_increment,/*ID*/

	/*テーブルの中の名前と型と大きさを記載*/
	user_id varchar(16) not null,/*ユーザーID*/
	product_id int not null,/*商品ID*/
	product_count int,/*個数*/
	price int not null,/*値段*/
	destination_id int,/*宛先情報ID*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(product_id) references product_info(product_id)
);

/*同じテーブル名のテーブルが存在する場合は消去する(念のため?)*/
drop table if exists destination_info;

/*テーブルを新たに作成する*/
create table destination_info(

	/*重複しないシーケンス番号を割り当てている*/
	id int not null primary key auto_increment,/*ID*/

	/*テーブルの中の名前と型と大きさを記載*/
	user_id  varchar(16) unique not null,/*ユーザーID*/
	family_name varchar(32) not null,/*姓*/
	first_name varchar(32) not null,/*名*/
	family_name_kana varchar(32) not null,/*姓かな*/
	first_name_kana varchar(32) not null,/*名かな*/
	email varchar(32),/*メールアドレス*/
	tel_number varchar(13),/*電話番号*/
	user_address varchar(50) not null,/*住所*/
	regist_date datetime,/*登録日時*/
	update_date datetime,/*更新日時*/
	foreign key(user_id) references user_info(user_id)
);

/*同じテーブル名のテーブルが存在する場合は消去する(念のため?)*/
drop table if exists m_category;

/*テーブルを新たに作成する*/
create table m_category(

	/*重複しないシーケンス番号を割り当てている*/
	id int not null primary key auto_increment,/*ID*/

	/*テーブルの中の名前と型と大きさを記載*/
	category_id int  not null unique,/*カテゴリID*/
	category_name varchar(20) not null unique,/*カテゴリ名*/
	category_description varchar(100),/*カテゴリ詳細*/
	insert_date datetime not null,/*登録日時*/
	update_date datetime/*更新日時*/
);

/*データを追加する(ID,ユーザーID,パスワード,姓,名,姓かな,名かな,ログインフラグ)*/
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(1,"guest1","guest1","姓1","名1","姓かな1","名かな1",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(2,"guest2","guest2","姓2","名2","姓かな2","名かな2",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(3,"guest3","guest3","姓3","名3","姓かな3","名かな3",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(4,"guest4","guest4","姓4","名4","姓かな4","名かな4",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(5,"guest5","guest5","姓5","名5","姓かな5","名かな5",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(6,"guest6","guest6","姓6","名6","姓かな6","名かな6",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(7,"guest7","guest7","姓7","名7","姓かな7","名かな7",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(8,"guest8","guest8","姓8","名8","姓かな8","名かな8",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(9,"guest9","guest9","姓9","名9","姓かな9","名かな9",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(10,"guest10","guest10","姓10","名10","姓かな10","名かな10",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(11,"guest11","guest11","姓11","名11","姓かな11","名かな11",0);
INSERT INTO user_info(id,user_id,password,family_name,first_name,family_name_kana,first_name_kana,logined) values(12,"guest12","guest12","姓12","名12","姓かな12","名かな12",0);

/*データを追加する(全て,肉、魚、野菜・果物、飲料)*/
INSERT INTO m_category(id,category_id,category_name,insert_date) values(1,1,"すべて",now());
INSERT INTO m_category(id,category_id,category_name,insert_date) values(2,2,"肉",now());
INSERT INTO m_category(id,category_id,category_name,insert_date) values(3,3,"魚",now());
INSERT INTO m_category(id,category_id,category_name,insert_date) values(4,4,"野菜・果物",now());
INSERT INTO m_category(id,category_id,category_name,insert_date) values(5,5,"飲料",now());

/*データを追加する(各カテゴリの商品)*/
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(1,1,"肉1","にく1",2,100,"./syokuhin","niku1.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(2,2,"肉2","にく2",2,200,"./syokuhin","niku2.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(3,3,"肉3","にく3",2,300,"./syokuhin","niku3.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(4,4,"肉4","にく4",2,400,"./syokuhin","niku4.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(5,5,"肉5","にく5",2,500,"./syokuhin","niku5.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(6,6,"魚1","さかな1",3,100,"./syokuhin","sakana1.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(7,7,"魚2","さかな2",3,200,"./syokuhin","sakana2.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(8,8,"魚3","さかな3",3,300,"./syokuhin","sakana3.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(9,9,"魚4","さかな4",3,400,"./syokuhin","sakana4.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(10,10,"魚5","さかな5",3,500,"./syokuhin","sakana5.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(11,11,"野菜・果物1","やさい・くだもの1",4,100,"./syokuhin","yasai,kudamono1.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(12,12,"野菜・果物2","やさい・くだもの2",4,200,"./syokuhin","yasai,kudamono2.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(13,13,"野菜・果物3","やさい・くだもの3",4,300,"./syokuhin","yasai,kudamono3.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(14,14,"野菜・果物4","やさい・くだもの4",4,400,"./syokuhin","yasai,kudamono4.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(15,15,"野菜・果物5","やさい・くだもの5",4,500,"./syokuhin","yasai,kudamono5.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(16,16,"飲料1","いんりょう1",5,100,"./syokuhin","inryou1.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(17,17,"飲料2","いんりょう2",5,200,"./syokuhin","inryou2.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(18,18,"飲料3","いんりょう3",5,300,"./syokuhin","inryou3.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(19,19,"飲料4","いんりょう4",5,400,"./syokuhin","inryou4.jpg");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,category_id,price,image_file_path,image_file_name) values(20,20,"飲料5","いんりょう5",5,500,"./syokuhin","inryou5.jpg");

/*データを追加する(宛先情報)*/
INSERT INTO destination_info(id,user_id,family_name,first_name,family_name_kana,first_name_kana,user_address) values(1,1,"インターノウス","株式会社","いんたーのうす","かぶしきがいしゃ","東京都千代田区三番町1-1 KY三番町ビル1F");
