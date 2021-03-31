--ПОИСК ЛОТОВ ФАБРИКИ ЛФЗ
SELECT *
FROM LOTS L
WHERE UPPER(L.DESCRIPTION) LIKE '% ЛФЗ %';

--ПОИСК СТАТУСА ПО UUID
SELECT *
FROM STATUSES
WHERE ID = 'FE0B8703C7174365B7E57C86777AFFFC';

--ПРОСМОТР СТАТУСОВ ЛОТОВ
SELECT S.NAME, L.*
FROM LOTS L LEFT JOIN STATUSES S ON L.LOT_STATUS_ID = S.ID;

--ПРОСМОТР ЛОТОВ В СТАТУСЕ READY_FOR_TRADE
SELECT L.*
FROM LOTS L LEFT JOIN STATUSES S ON L.LOT_STATUS_ID = S.ID
WHERE S.NAME = 'READY_FOR_TRADE';

--ПРОСМОТР СОБЫТИЙ  В СТАТУСЕ TRADING И СВЯЗАННЫХ ЛОТОВ
SELECT E.DESCRIPTION, L.DESCRIPTION
FROM EVENTS E
JOIN LOT_TO_EVENT LE ON LE.EVENT_ID = E.ID
JOIN LOTS L ON L.ID = LE.LOT_ID
JOIN STATUSES S ON S.ID = E.EVENT_STATUS_ID
WHERE S.NAME = 'TRADING';

--самая дорогая/дешевая заявка + кол-во всего заявок на покупку лотов  = где все макс цена выше 1000
select EVENT_ID, max(price) max_price , min(price) min_price, count(*) orders_qty
from ORDERS
GROUP BY EVENT_ID
HAVING max_price > 1000
;



