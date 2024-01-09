REMOVE NAMESPACE meal_gen;
DEFINE NAMESPACE meal_gen;

USE NAMESPACE meal_gen;

REMOVE DATABASE meal_gen;
DEFINE DATABASE meal_gen;

USE DATABASE meal_gen;

---------------------------
-- default_serving_units --
---------------------------


DEFINE TABLE default_serving_units SCHEMAFULL;

-- DEFINE FIELD default_serving_unit_id ON TABLE default_serving_units TYPE int;
DEFINE FIELD default_serving_type ON TABLE default_serving_units TYPE string;
DEFINE FIELD default_serving_unit ON TABLE default_serving_units TYPE string;

DEFINE INDEX default_serving_type_index ON TABLE default_serving_units COLUMNS default_serving_type UNIQUE;


--------------
-- servings --
--------------

DEFINE TABLE servings SCHEMAFULL;

-- DEFINE FIELD serv_id            ON TABLE servings TYPE int;
DEFINE FIELD serv_name          ON TABLE servings TYPE string;
DEFINE FIELD serv_size          ON TABLE servings TYPE float;
DEFINE FIELD serv_unit          ON TABLE servings TYPE option<string>;
DEFINE FIELD serv_cal           ON TABLE servings TYPE float DEFAULT 0; 
DEFINE FIELD serv_fat_tot       ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_fat_sat       ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_fat_trans     ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_chol          ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_sod           ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_carb_tot      ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_fiber_diet    ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_sugar_tot     ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_sugar_add     ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_prot          ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_vit_d         ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_calcium       ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_iron          ON TABLE servings TYPE float DEFAULT 0;
DEFINE FIELD serv_potas         ON TABLE servings TYPE float DEFAULT 0;

DEFINE INDEX serv_id_index ON TABLE servings COLUMNS serv_name UNIQUE;

CREATE default_serving_units SET default_serving_type = "type", default_serving_unit = "ty";

