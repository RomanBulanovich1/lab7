CREATE OR REPLACE PROCEDURE uslugi_insert (
  p_kod IN NUMBER,
  p_usluga IN VARCHAR2,
  p_price IN NUMBER,
  p_kod_vida IN NUMBER
) AS
BEGIN
  INSERT INTO USLUGI_NEW (ID_USLUGI, USLUGA, PRICE, ID_VIDA3)
  VALUES (p_kod, p_usluga, p_price, p_kod_vida);
END;
BEGIN
  uslugi_insert(1, 'Видеокарта RTX3080 16gb', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 1);
  uslugi_insert(2, 'Процессор Intel I5 10400K', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 2);
  uslugi_insert(3, 'Видеокарта RTX3060 8gb', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 1);
  uslugi_insert(4, 'Процессор Intel I5 10400K', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 2);
  uslugi_insert(5, 'SSD TOSHIBA 2TB', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 3);
  uslugi_insert(6, 'SSD SAMSUNG M2 2TB', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 3);
  uslugi_insert(7, 'Клавиатура VARMILO MK3', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 4);
  uslugi_insert(8, 'Компьютерная мышка Logitech G102', TRUNC(DBMS_RANDOM.VALUE(50,120)), 5);
  uslugi_insert(9, 'Компьютерная мышка Logitech G502', TRUNC(DBMS_RANDOM.VALUE(200,500)), 5);
  uslugi_insert(10, 'Процессор Ryzen 5 3600Х', TRUNC(DBMS_RANDOM.VALUE(700, 2000)), 2);
  uslugi_insert(11, 'Ноутбук ASUS TUF GAMING 1080ti', TRUNC(DBMS_RANDOM.VALUE(1000, 2000)), 6);
  uslugi_insert(12, 'Ноутбук HONOR MX50', TRUNC(DBMS_RANDOM.VALUE(900, 2000)), 6);
  uslugi_insert(13, 'Термопаста ARCTIC MX-4', TRUNC(DBMS_RANDOM.VALUE(20, 40)), 7);
  uslugi_insert(14, 'Кулер ARCTIC GI-X$', TRUNC(DBMS_RANDOM.VALUE(80, 130)), 8);
  uslugi_insert(15, 'Корпус TermakTake full tower', TRUNC(DBMS_RANDOM.VALUE(300, 500)), 9);
  uslugi_insert(16, 'Процессор Intel i7 7700k', TRUNC(DBMS_RANDOM.VALUE(700, 1500)), 2);
  uslugi_insert(17, 'Видеокарта AMD Radeon 570 OC', TRUNC(DBMS_RANDOM.VALUE(700, 1500)), 1);
  uslugi_insert(18, 'Видеокарта Palit RTX3090 12GB', TRUNC(DBMS_RANDOM.VALUE(700, 1500)), 1);
  uslugi_insert(19, 'Оперативная память Patriot Viper 8gb', TRUNC(DBMS_RANDOM.VALUE(700, 900)), 10);
END;


SELECT JSON_OBJECT(
  'procedure_name' VALUE 'uslugi_insert',
  'kod' VALUE p_kod,
  'usluga' VALUE p_usluga,
  'price' VALUE p_price,
  'kod_vida' VALUE p_kod_vida
) AS json_data
FROM uslugi;


DECLARE
  l_file UTL_FILE.FILE_TYPE;
BEGIN
  l_file := UTL_FILE.FOPEN('D:\Developer\kursovoi', 'zapolnenie.json', 'w');
  FOR c IN (
    SELECT JSON_OBJECT(
      'procedure_name' VALUE 'uslugi_insert',
      'kod' VALUE p_kod,
      'usluga' VALUE p_usluga,
      'price' VALUE p_price,
      'kod_vida' VALUE p_kod_vida
    ) AS json_data
    FROM uslugi
  ) LOOP
    UTL_FILE.PUT_LINE(l_file, c.json_data);
  END LOOP;
  UTL_FILE.FCLOSE(l_file);
END;


/*Процедура для удаления*/
CREATE OR REPLACE PROCEDURE DELETE_USLUGI_DATA (KOD IN NUMBER)
AS
BEGIN
  DELETE FROM USLUGI WHERE KOD = KOD;
  COMMIT;
END;


/*Процедура для обновления*/
CREATE OR REPLACE PROCEDURE UPDATE_USLUGI_DATA (KOD IN NUMBER, USLUGA IN VARCHAR2, PRICE IN NUMBER, KOD_VIDA IN NUMBER)
AS
BEGIN
  UPDATE USLUGI SET USLUGA = USLUGA, PRICE = PRICE, KOD_VIDA = KOD_VIDA WHERE KOD = KOD;
  COMMIT;
END;

