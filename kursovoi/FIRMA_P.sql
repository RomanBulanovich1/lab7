CREATE OR REPLACE PROCEDURE fill_firma_table_meaningful AS
BEGIN
  INSERT INTO FIRMA (FIRMA_ID, NAZVANIE, RUKOVODITEL, ADRES, GLAV_BUH, TELEPHONE, BIK, E_MAIL)
  SELECT ROWNUM,
         CASE MOD(ROWNUM, 5)
           WHEN 0 THEN 'ООО "TTN.by"'
           WHEN 1 THEN 'ЗАО "Бывалый перкарь"'
           WHEN 2 THEN 'ОАО "AMD.by"'
           WHEN 3 THEN 'ИП "Cyborg"'
           WHEN 4 THEN 'ООО "XYECOC"'
         END,
         CASE MOD(ROWNUM, 3)
           WHEN 0 THEN 'Иванов Иван Иванович'
           WHEN 1 THEN 'Петров Петр Петрович'
           WHEN 2 THEN 'Сидоров Сидор Сидорович'
         END,
         CASE MOD(ROWNUM, 4)
           WHEN 0 THEN 'г. Москва, ул. Ленина, д.1'
           WHEN 1 THEN 'г. Санкт-Петербург, ул. Пушкина, д.2'
           WHEN 2 THEN 'г. Новосибирск, ул. Кирова, д.3'
           WHEN 3 THEN 'г. Екатеринбург, ул. Гагарина, д.4'
         END,
         CASE MOD(ROWNUM, 4)
           WHEN 0 THEN 'Иванова Мария Петровна'
           WHEN 1 THEN 'Петрова Анна Ивановна'
           WHEN 2 THEN 'Сидорова Ольга Сергеевна'
           WHEN 3 THEN 'Кузнецова Екатерина Александровна'
         END,
         TO_CHAR(dbms_random.value(1000000000,9999999999)),
         TO_CHAR(dbms_random.value(10000000,99999999)),
         dbms_random.string('L',5) || '@' || dbms_random.string('L',5) || '.com'
    FROM dual CONNECT BY LEVEL <= 10;
END;
CREATE OR REPLACE PROCEDURE insert_json_data (sample1 IN VARCHAR2) AS
  l_bfile BFILE;
  l_blob  BLOB;
BEGIN
  INSERT INTO my_table (id, json_data)
  VALUES (1,
    JSON_OBJECT_T.PARSE(
      UTL_RAW.CAST_TO_RAW(
        BFILENAME('MY_DIR', sample1)
      ).GETCLOB()
    )
  );
END;



CREATE OR REPLACE PROCEDURE insert_json_data (sample1 IN VARCHAR2) AS
  l_blob  BLOB;
  l_clob  CLOB;
  l_obj   JSON_OBJECT_T;
BEGIN
  -- Load the JSON data from the file into a CLOB
  SELECT UTL_RAW.CAST_TO_CLOB(BFILENAME('D:\Developer\kursovoi', sample1))
  INTO   l_clob
  FROM   DUAL;

  -- Parse the JSON data into an object
  l_obj := JSON_OBJECT_T.PARSE(l_clob);

  -- Insert the data into the table
  INSERT INTO FIRMA (id, json_data)
  VALUES (1, l_obj);
END;