CREATE TABLE VIDI_USLUG
(
ID_VIDA NUMBER (6,0) NOT NULL ENABLE,
VID_USLUGI1 VARCHAR2 (60) NOT NULL ENABLE,
CONSTRAINT VIDI_USLUG1_PK PRIMARY KEY (ID_VIDA) ENABLE,
CONSTRAINT FK_VIDI_USLUG1_VID FOREIGN KEY (VID_USLUGI1) REFERENCES USLUGI(VID_USLUGI)
);
drop table VIDI_USLUG
/
CREATE OR REPLACE TRIGGER BI_VIDI_USLUG
BEFORE INSERT ON VIDI_USLUG
FOR EACH ROW
BEGIN
IF:NEW. KOD IS NULL THEN
SELECT VIDI_USLUG_SEQ1.NEXTVAL INTO:NEW. KOD FROM SYS.dual;
END IF;
END;
/
ALTER TRIGGER BI_VIDI_USLUG ENABLE;

CREATE OR REPLACE PROCEDURE fill_vidi_uslug AS 
  v_vids vchar2_table := vchar2_table('Доставить не позже 9', 'Доставка на машине', 'Доставить из другой страны по морю', 'Доставка на велосипеде', 'Доставка на самолете', 'Доставка на поезде', 'Доставка на корабле', 'Доставка на грузовике', 'Доставка на мотоцикле', 'Доставка на лошади');
BEGIN 
  FOR i IN 1..20 LOOP 
    INSERT INTO VIDI_USLUG (KOD, VID) VALUES (i, v_vids(i)); 
  END LOOP; 
  COMMIT;
END;
