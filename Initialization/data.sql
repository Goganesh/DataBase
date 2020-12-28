SELECT * FROM AUCTION.STATUSES;
SELECT * FROM AUCTION.CURRENCIES;
SELECT * FROM AUCTION.LOT_TYPES;
SELECT * FROM AUCTION.EVENT_TYPES;
SELECT * FROM AUCTION.PERSONS;
SELECT * FROM AUCTION.LOTS;
SELECT * FROM AUCTION.EVENTS;
SELECT * FROM AUCTION.LOT_TO_EVENT;
SELECT * FROM AUCTION.EVENT_CATEGORIES;
SELECT * FROM AUCTION.CATEGORY_TO_EVENT;
SELECT * FROM AUCTION.ORDERS;


--СКРИПТЫ ГЕНЕРАЦИИ ДАННЫХ
INSERT INTO AUCTION.STATUSES
(ID, TYPE, NAME)
VALUES
('FE0B8703C7174365B7E57C86777AFFFC', 'PERSON_STATUS', 'ACTIVE'),
('FCA7874EB9834212BBF000EFE39D145E', 'PERSON_STATUS', 'PASSIVE'),
('79520248CBF0400C87D489E8EFA6277A', 'LOT_STATUS', 'LOT_TRANSFER'),
('290B8F1F19BD46A8A2FD7ABDC40B5B27', 'LOT_STATUS', 'APPROVED'),
('8F49CBCCF8DE4C4AA3DC94027E42F429', 'LOT_STATUS', 'TRADING'),
('36440F43A16B47708083915E3F33CA9D', 'LOT_STATUS', 'READY_FOR_TRADE'),
('23291B645B344A6F8D8063FC1FD0CE1C', 'LOT_STATUS', 'CHEKING_FOR_TRADE'),
('AD3297FC43184601BB02902211239AFC', 'LOT_STATUS', 'NEW'),
('9F8956E2CC984E97960DB77824F5E013', 'EVENT_STATUS', 'ARCHIVED'),
('CEEA746A099F4BD186430CEB326BB699', 'EVENT_STATUS', 'LOT_TRANSFER'),
('CDF05E06AD1E4D3093194262AFB6C20E', 'EVENT_STATUS', 'APPROVED'),
('B97FDF93142F44B0BEF1ED4EB4CB29BC', 'EVENT_STATUS', 'TRADING'),
('582F930F18F743FBA6E04385BF4AB80F', 'EVENT_STATUS', 'IN_WORK'),
('48B1B224B41343FA94BABD2670FECFA1', 'EVENT_STATUS', 'CANCELED'),
('6973301EE6D64CC986832ADD326BCDD7', 'ORDER_STATUS', 'APPVORED'),
('6349FDFD4A174D0FB38A0134BAE98645', 'ORDER_STATUS', 'BEATED'),
('985B739599894B0FAA5AD31A4125DDB3', 'ORDER_STATUS', 'CANCELED')
;

INSERT INTO AUCTION.CURRENCIES
(ID, CODE, NAME)
VALUES
('B7F66719F15147F4A4195AFFBA89090C', 'RUB', 'РОССИЙСКИЙ РУБЛЬ'),
('95A1EF0DDA5045E998C62BF2F6F0A627', 'USD', 'ДОЛЛАР США')
;

INSERT INTO AUCTION.LOT_TYPES
(ID, PARENT_ID, NAME)
VALUES
('CC385007F2384C47BF238EE8537C4239', NULL, 'ART'),
('D6CC8DE767D84F42967E3AFC2D4468EC', 'CC385007F2384C47BF238EE8537C4239', 'PICTUTE'),
('B1AA58334D1C4BD68070FFBA9939E423', 'CC385007F2384C47BF238EE8537C4239', 'STATUE')
;

INSERT INTO AUCTION.EVENT_TYPES
(ID, NAME)
VALUES
('D1412F0740144ACF8A76ACFE9520F9F6', 'SIMPLE TRADE')
;

INSERT INTO AUCTION.EVENT_CATEGORIES
(ID, NAME)
VALUES
('DC195AB38B8A4B0DB437692AC3DC5A09', 'TRADE_LESS_100_DOLLARS'),
('B54C4F0904454675BE477B9E661136D2', 'PREMIUM_TRADE'),
('2AD04A2F173C4CD98CCD0B4786247196', 'ART_TRADING')
;

INSERT INTO AUCTION.PERSONS
(ID, NAME, SURNAME, PATRONYMIC, MAIL, PHONENUMBER, PERSON_STATUS_ID)
VALUES
('3E4F30130AF646C0A2E3D29EA92169B2', 'GEORGY', 'BASILADZE', 'TAMAZOVICH', 'BASILADZE@MAIL.RU', '9267257128', 'FE0B8703C7174365B7E57C86777AFFFC'),
('1514DECE19CC4820AA6B688945B2F27E', 'ANDRO', 'BASILADZE', 'TAMAZOVICH', 'ANDROBASILADZE@MAIL.RU', '9268168313', 'FCA7874EB9834212BBF000EFE39D145E'),
('A27487B604194830941EC2969F9AA05A', 'DENIS', 'IVIN', 'VLADIMIROVICH', 'IVIN@GMAIL.COM', '9267257777', 'FE0B8703C7174365B7E57C86777AFFFC')
;

INSERT INTO AUCTION.LOTS
(ID, DESCRIPTION, LOT_TYPE_ID, OWNER_ID, LOT_STATUS_ID)
VALUES
('A25E75A9DE714FEA99EE2FAFD7ABFDF5', 'СТАТУЯ ЛФЗ - СИБИРСКИЙ КОТ', 'B1AA58334D1C4BD68070FFBA9939E423', '3E4F30130AF646C0A2E3D29EA92169B2', '36440F43A16B47708083915E3F33CA9D'),
('0C0CD1A1E944415EBC523792BA3C9985', 'СТАТУЯ ЛФЗ - ЦЫГАНКА', 'B1AA58334D1C4BD68070FFBA9939E423', '3E4F30130AF646C0A2E3D29EA92169B2', '36440F43A16B47708083915E3F33CA9D'),
('4EB25121F5144089AC6E1537C1CE02F5', 'СТАТУЯ ЛФЗ - ПОЭТ', 'B1AA58334D1C4BD68070FFBA9939E423', '3E4F30130AF646C0A2E3D29EA92169B2', '23291B645B344A6F8D8063FC1FD0CE1C')
;

INSERT INTO AUCTION.EVENTS
(ID, DESCRIPTION, EVENT_STATUS_ID, EVENT_TYPE_ID, START_DATE, END_DATE, PRICE, CURRENCY_ID, PERSON_ID)
VALUES
('CC0E42D500844C55844E480410BA68D7', 'АУКЦИОН РАРИТЕТНЫХ СТАТУЭТОК ЗАВОДА ЛФЗ', 'B97FDF93142F44B0BEF1ED4EB4CB29BC', 'D1412F0740144ACF8A76ACFE9520F9F6', TO_DATE('27.12.2020', 'DD.MM.YYYY'), TO_DATE('29.12.2020', 'DD.MM.YYYY'), 2500, '95A1EF0DDA5045E998C62BF2F6F0A627', '3E4F30130AF646C0A2E3D29EA92169B2')
;

INSERT INTO AUCTION.LOT_TO_EVENT
(ID, LOT_ID, EVENT_ID)
VALUES
('EC438CCE0B2D4224AD57D97981485040', 'A25E75A9DE714FEA99EE2FAFD7ABFDF5', 'CC0E42D500844C55844E480410BA68D7'),
('8DAE27E1FFDB47EAB15343105B7533AE', '0C0CD1A1E944415EBC523792BA3C9985', 'CC0E42D500844C55844E480410BA68D7')
;

INSERT INTO AUCTION.CATEGORY_TO_EVENT
(ID, EVENT_CATEGORY_ID, EVENT_ID)
VALUES
('BCC58504CD734411A95AD3E900BB206D', '2AD04A2F173C4CD98CCD0B4786247196', 'CC0E42D500844C55844E480410BA68D7'),
('EC64D2EDE43B43D793FA6C72C2E1F27E', 'B54C4F0904454675BE477B9E661136D2', 'CC0E42D500844C55844E480410BA68D7')
;

INSERT INTO AUCTION.ORDERS
(ID, PERSON_ID, ORDER_STATUS_ID, PRICE, CURRENCY_ID, EVENT_ID, ORDER_DATE)
VALUES
('6779B8BE16084A66B0F24E6862D1392F', 'A27487B604194830941EC2969F9AA05A', '6973301EE6D64CC986832ADD326BCDD7', 2600, '95A1EF0DDA5045E998C62BF2F6F0A627', 'CC0E42D500844C55844E480410BA68D7', TO_TIMESTAMP('27.12.2020 10:13', 'DD.MM.YYYY HH:MI'))
;

--ЗАПРОС С РЕГУЛЯРНЫМ ВЫРАЖЕНИЕ
--ПОИСК ЛОТОВ ФАБРИКИ ЛФЗ
SELECT * FROM AUCTION.LOTS L WHERE UPPER(L.DESCRIPTION) LIKE '% ЛФЗ %';
SELECT * FROM AUCTION.LOTS L WHERE UPPER(L.DESCRIPTION) SIMILAR TO '%( ЛФЗ )%';

--ЗАПРОС JOIN
SELECT E.DESCRIPTION, L.DESCRIPTION
FROM AUCTION.EVENTS E
JOIN AUCTION.LOT_TO_EVENT LE ON LE.EVENT_ID = E."ID"
JOIN AUCTION.LOTS L ON L."ID" = LE.LOT_ID
WHERE E.ID = 'CC0E42D5-0084-4C55-844E-480410BA68D7';

--ИЗМЕНЕНИЕ АТРИБУТА ДЛЯ ЗАПИСИ ТАБЛИЦЫ
UPDATE AUCTION.PERSONS
SET PERSON_STATUS_ID = 'FE0B8703-C717-4365-B7E5-7C86777AFFFC'
WHERE ID = '1514DECE-19CC-4820-AA6B-688945B2F27E'
RETURNING *;

--УДАЛЕНИЕ ДАННЫХ С ПОМОЩЬЮ USING
DELETE FROM AUCTION.LOTS L USING AUCTION.PERSONS E
  WHERE E.ID = L.OWNER_ID AND E.ID = '3E4F30130AF646C0A2E3D29EA92169B2'
  RETURNING *;