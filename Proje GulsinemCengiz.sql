create database Kutupanecim1
use Kutupanecim1

create table Musteri (
MusteriId int primary key,
AdiSoyadi nvarchar (50),
Email nvarchar (50))

create table Adres(
AdresId int primary key,
Adres nvarchar (200),
Telefon nvarchar (50))

Create table Kitaplar(
KitapId int primary key identity (1,1),
AdresId int foreign key references Adres(AdresId),
MusteriId int foreign key references Musteri(MusteriId),
Alinmatarihi datetime)

create table Yazarlar(
YazarId int primary key identity (1,1),
KitapId int foreign key references Kitaplar(KitapId),
Yazaradsoyad nvarchar (50),
Kitapadi nvarchar (50),
Sayfasayisi int,
Kiralamabedeli decimal (10,2))
 
 
insert into Musteri( MusteriId , Adisoyadi, email) values
(1,'Gülsinem Cengiz', 'gulsinemcengiz@gmail.com'),
(2 ,'Çağın Barış' , 'caginbari@gmail.com'),
(3 , 'Ebru Bitiktaş' , 'ebru@gmail.com'),
(4 , 'Didem Söğüt' , 'didem@gmail.com'),
(5 , 'Ezgi Koç' , 'ezgikoc@gmail.com'),
(6 , ' Ege Söğüt' , 'egesogut@gmail.com'),
(7 , 'Zeynep Bitiktaş' , 'zeyno@gmail.com'),
(8, 'Nisan Aydın' ,'nisanaydın @gmail.com'),
(9 , 'Ecem Türkan' , 'eceem@gmail.com'),
(10, 'Utku Maden' , 'utkumaden@gmail.com'),
(11 , 'Perihan İbişoğlu' , 'reihan@gmail.com'),
(12 , 'Esin Aslan' , 'esin@gmail.com'),
(13 , 'Erdinç Söğüt' , 'erdincc@gmail.com'),
(14 ,  'Ali Güneş' , 'aligunes@gmail.com'),
(15 , 'Esra Kaya' , 'esrakaya@gmail.com')




insert into Adres( AdresId , Adres, Telefon) values
(1, 'Bahçelievler mah. 1848/5 sok.' , '5067889944'),
(2 , 'Bahçelievler mah. 1958/5 sok.' , ' 5057998765'),
(3 , 'Bahriyeüçok mah. 1605 sok.' , '05068884635'),
(4, 'Alaybey mah. 11706 sok.' , '5078884532'),
(5 , 'Bostanli mah. 10655 sok.' , '5087662323'),
(6 , 'Denizbostanlisi mah. 1988 sok.' ,'5067885443'),
(7 , 'Bahriyeüçok mah. 1605 sok.' , '5072334656'),
(8 , 'yenisehir mah. 11706 sok.' , '5069008776'),
(9, 'Ugur Mumcu mah. 19655 sok.' , '5067994536'),
(10 , 'Kentkoop mah. 11806 sok.' , '5052564433'),
(11 , 'Bahriyeüçok mah. 1609 sok.' , '5067994632'),
(12 , 'Yenisehir  mah. 1958/5 sok.' , '5065664534'),
(13 , 'Batisitesi mah. 11706 sok.' , '5067558883'),
(14 ,'Terasevler mah.35. sok.' , '5078776453'),
(15, 'Tersane mah. 508. sok. ' , '5075443425')

declare @counter int =1
while @counter <=100000
begin
declare @randomMusteiId int =round(rand()*14+1 ,0)
declare @randomadresId int =round(rand()*14+1 , 0)
declare @Alinmatarihi datetime = dateadd(day,Round(rand() * datediff(day, '2020-04-01', getdate ()),0), '2020-04-01')
insert into Kitaplar (MusteriId , AdresId , Alinmatarihi) values
(@randomMusteiId , @randomadresId,@Alinmatarihi)
set @counter =@counter +1
end

insert into Yazarlar (KitapId,Yazaradsoyad,Kitapadi,Sayfasayisi,KiralamaBedeli) values
(1,'Jack London', 'Martin Eden' ,'302','19.5'),
(2,'Ahmet Arif' , 'Cemal Süreyaya Mektuplar' , '122' , '15'),
(3,'Zülfü Livaneli',	'Serenad', '356','21'),
(4, 'Charles Dickens' ,'İki Şehrin Hikâyesi','454','19'),
(5,'Antoine de Saint-Exupéry','Küçük Prens' , '143' ,'13'),
(6,'J. R. R. Tolkien' , '	Hobbit' , '135' , '13'),
(7,'Anna Sewell',	'Siyah İnci' , '344','21'),
(8,'Gabriel Garcia Marquez','Yüzyıllık Yalnızlık' ,'156','13'),
(9,'Virginia Woolf','Deniz Feneri','345',	'15'),
(10,	'Leo Tolstoy' ,	'Anna Karenina','465',	'19'),
(11	,'Gustave Flaubert'	,'Madame Bovary','476',	'21'),
(12,	'Leo Tolstoy'	,'Savaş ve Barış','567',	'21'),
(13	,'Herman Melville','Moby-Dick',	'234',	'15'),
(14	,'Charles Dickens',	'Büyük Umutlar',	'366',	'19'),
(15	,'Fyodor Dostoyevsky' ,	'Suç ve Ceza',	'432',	'19'),
(16	,'Vladimir Nabokov','Solgun Ateş','367','19'),
(17,'James Joyce',	'Dublinliler',	'422',	'19'),
(18	,'James Joyce',	'Ulysses',	'577',	'21'),
(19	,'George Orwell','Bin Dokuz Yüz Seksen Dört',	'389',	'19'),
(20,'Mario Puzo','Baba','565','21'),
(21	,'Jean-Paul Sartre','Varlık ve Hiçlik',	'21',	'19'),
(22,'Aldous Huxley','Cesur Yeni Dünya',	'544',	'21'),
(23	,'Margaret Mitchell' ,'Rüzgâr Gibi Geçti',	'322',	'19'),
(24	,'Zülfü Livaneli','Engeregin Gözü',	'434',	'19')

--Procedure oluşturma
create procedure AddAdres
@AdresId int,
@Adres nvarchar (200),
@Telefon nvarchar(50)
as begin 
insert into Adres (AdresId,Adres,Telefon)
values (@AdresId,@Adres,@Telefon)
end
--deneme aşaması

exec AddAdres '17','Bahçalievler caddesi 1848.Sok.','05067896586'

--View oluşturma
create view AlinankitaplarInfoView
as select
Yazarlar.YazarId,
Yazarlar.KitapId,
Musteri.MusteriId,
Musteri.Email,
Yazarlar.Kiralamabedeli,
Adres.Telefon from Yazarlar
   inner join Kitaplar on Yazarlar.KitapId=Kitaplar.KitapId
   inner join Adres on Adres.AdresId=Kitaplar.AdresId
   inner join Musteri on Musteri.MusteriId=Kitaplar.MusteriId

select * from AlinankitaplarInfoView



--Triger oluşturma
create trigger  tr_AdresControl on Adres
after insert as begin
  set nocount on
if(select count (*) from inserted where CHARINDEX ('Mah', Adres)>0 and 
CHARINDEX('.',SUBSTRING (Adres,CHARINDEX('Mah',Adres)+1 ,LEN (Adres)))>0)=0
begin
RAISERROR (' Adres sütunu mahalle bilgisi içermelidir',16,1)
rollback 
end 
end


--Sorgular--
--1----
select TOP 3 Adisoyadi,Sum (kiralamabedeli) as Toplamdeğer from musteri
inner join Kitaplar 
on Musteri.MusteriId=Kitaplar.MusteriId
inner join Yazarlar
on Kitaplar.KitapId=Yazarlar.KitapId
group by AdiSoyadi
order by Sum(Kiralamabedeli) desc

--2---
select 
Kiralamabedeli,KitapId,
case when (Kiralamabedeli<=15) then 'Fırsat ürünü'
when (kiralamabedeli>10) then 'indirimli ürün'
end
from Yazarlar



  
















































