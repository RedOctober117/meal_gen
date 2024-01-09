-- This script creates the meal_gen database. It should include all the relevant data. 

DROP DATABASE IF EXISTS meal_gen;

CREATE DATABASE IF NOT EXISTS meal_gen;

USE meal_gen;

CREATE TABLE default_serving_units (
  default_serving_unit_id   INT               AUTO_INCREMENT,
  default_serving_type      VARCHAR(50)       NOT NULL    UNIQUE,
  default_serving_unit      VARCHAR(50)       NOT NULL,
  PRIMARY KEY (default_serving_unit_id)
);

CREATE TABLE servings (
  serv_id         INT            AUTO_INCREMENT,
  serv_name       VARCHAR(50)    NOT NULL     UNIQUE,
  serv_size       DECIMAL(5,2)   NOT NULL,
  serv_unit       VARCHAR(50)    NOT NULL,
  serv_cal        INT            DEFAULT 0, 
  serv_fat_tot    INT            DEFAULT 0,
  serv_fat_sat    INT            DEFAULT 0,
  serv_fat_trans  INT            DEFAULT 0,
  serv_chol       INT            DEFAULT 0,
  serv_sod        INT            DEFAULT 0,
  serv_carb_tot   INT            DEFAULT 0,
  serv_fiber_diet INT            DEFAULT 0,
  serv_sugar_tot  INT            DEFAULT 0,
  serv_sugar_add  INT            DEFAULT 0,
  serv_prot       INT            DEFAULT 0,
  serv_vit_d      INT            DEFAULT 0,
  serv_calcium    INT            DEFAULT 0,
  serv_iron       INT            DEFAULT 0,
  serv_potas      INT            DEFAULT 0,
  PRIMARY KEY (serv_id, serv_name)
);

CREATE TABLE meal_names (
  meal_id         INT            AUTO_INCREMENT,
  meal_name       VARCHAR(50)    NOT NULL,
  PRIMARY KEY (meal_id)
);

CREATE TABLE meal_compositions (
  meal_id         INT            NOT NULL,
  serv_qty        DECIMAL(5,2)   NOT NULL,
  serv_id         INT            NOT NULL,
  CONSTRAINT FOREIGN KEY (serv_id) REFERENCES servings (serv_id) ON DELETE CASCADE,
  CONSTRAINT FOREIGN KEY (meal_id) REFERENCES meal_names (meal_id) ON DELETE CASCADE
);

CREATE TABLE meal_breakfast (
  meal_breakfast_id      INT      AUTO_INCREMENT,
  meal_compositions_id   INT      NOT NULL      UNIQUE,
  PRIMARY KEY (meal_breakfast_id),
  CONSTRAINT FOREIGN KEY (meal_compositions_id) REFERENCES meal_names (meal_id)
);

CREATE TABLE meal_lunch (
  meal_lunch_id               INT           AUTO_INCREMENT,
  meal_composition_id         INT           NOT NULL,
  PRIMARY KEY (meal_lunch_id),
  CONSTRAINT FOREIGN KEY (meal_composition_id) REFERENCES meal_names (meal_id)
);

CREATE TABLE meal_dinner (
  meal_dinner_id         INT     AUTO_INCREMENT,
  meal_composition_id    INT     NOT NULL,
  PRIMARY KEY (meal_dinner_id),
  CONSTRAINT FOREIGN KEY (meal_composition_id) REFERENCES meal_names (meal_id)
);

CREATE TABLE meal_week_history (
  meal_week_id    INT   AUTO_INCREMENT,
  meal_name_id    INT   NOT NULL
  CONSTRAINT FOREIGN KEY (meal_name_id) REFERENCES meal_names (meal_id)
)
/*
==============================================
HERE BEGINS THE INSERTION QUERY SECTION
==============================================
*/

INSERT INTO default_serving_units (default_serving_type, default_serving_unit) VALUES
  ("Calories", NULL),
  ("Total Fat", "g"),
  ("Saturated Fat", "g"),
  ("Trans Fat", "g"),
  ("Cholesterol", "mg"),
  ("Sodium", "mg"),
  ("Total Carbohydrates", "g"),
  ("Dietary Fiber", "g"),
  ("Total Sugars", "g"),
  ("Added Sugars", "g"),
  ("Protein", "g"),
  ("Vitamin D", "mcg"),
  ("Calcium", "mg"),
  ("Iron", "mg"),
  ("Potassium", "mg");

INSERT INTO meal_names (meal_name) VALUES
  ("Grilled Cheese");

INSERT INTO meal_compositions (meal_id, serv_qty, serv_id) VALUES
  (2, 2, 1),
  (2, 2, 2),
  (2, 2, 3);

INSERT INTO servings (serv_name, serv_size, serv_unit, serv_cal, serv_fat_tot, serv_fat_sat, serv_fat_trans, serv_chol, serv_sod, serv_carb_tot, serv_fiber_diet, serv_sugar_tot, serv_sugar_add, serv_prot, serv_vit_d, serv_calcium, serv_iron, serv_potas) VALUES
  ("Sweet Cream Butter Salted", 1, "Tbsp", 100, 11, 7, 0, 30, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  ("Nature's Own White Bread", 1, "Slice", 60, 1, 0, 0, 0, 90, 12, 0, 2, 2, 2, 0, 50, 1, 0),
  ("Cheese", 1, "Slice", 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100);
