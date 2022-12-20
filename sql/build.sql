-- This script creates the meal_gen database. It should include all the relevant data. 

DROP DATABASE IF EXISTS meal_gen;

CREATE DATABASE IF NOT EXISTS meal_gen;

USE meal_gen;

CREATE TABLE servings (
  serv_id         INT          NOT NULL     UNIQUE  AUTO_INCREMENT  PRIMARY KEY,
  serv_name       VARCHAR(50)  NOT NULL     UNIQUE,
  serv_size       VARCHAR(5)   NOT NULL,
  serv_cal        INT          DEFAULT 0, 
  serv_fat_tot    INT          DEFAULT 0,
  serv_fat_sat    INT          DEFAULT 0,
  serv_fat_trans  INT          DEFAULT 0,
  serv_chol       INT          DEFAULT 0,
  serv_sod        INT          DEFAULT 0,
  serv_carb_tot   INT          DEFAULT 0,
  serv_fiber_diet INT          DEFAULT 0,
  serv_sugar_tot  INT          DEFAULT 0,
  serv_sugar_add  INT          DEFAULT 0,
  serv_prot       INT          DEFAULT 0,
  serv_vit_d      INT          DEFAULT 0,
  serv_calc       INT          DEFAULT 0,
  serv_iron       INT          DEFAULT 0,
  serv_potas      INT          DEFAULT 0
);

CREATE TABLE meals (
  meal_id         INT          NOT NULL     UNIQUE    AUTO_INCREMENT   PRIMARY KEY,
  meal_name       VARCHAR(50)  NOT NULL     
);

CREATE TABLE meal_break (
  meal_break_id   INT   
);

CREATE TABLE meal_lun (
  meal_lun_id
);

CREATE TABLE meal_din (
  meal_din_id
)
