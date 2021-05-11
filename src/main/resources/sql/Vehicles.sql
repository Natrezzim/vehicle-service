DROP TABLE IF EXISTS vehicle_classes CASCADE;
DROP TABLE IF EXISTS brands CASCADE;
DROP TABLE IF EXISTS models CASCADE;
DROP TABLE IF EXISTS vehicles CASCADE;


CREATE TABLE "vehicles"
(
    "id"                 BIGSERIAL PRIMARY KEY,
    "grnz"               text        NOT NULL,
    "grnz_country_code"  text        NOT NULL,
    "vehicle_uuid"       uuid UNIQUE NOT NULL,
    "brand_id"           integer,
    "model_id"           integer,
    "vehicle_classes_id" integer,
    "active"             boolean,
    "created_at"         timestamp DEFAULT (now())
);

CREATE TABLE "brands"
(
    "id"   SERIAL PRIMARY KEY,
    "name" text UNIQUE
);

CREATE TABLE "models"
(
    "id"                 SERIAL PRIMARY KEY,
    "name"               text UNIQUE,
    "brand_id"           integer,
    "vehicle_classes_id" integer
);

CREATE TABLE "vehicle_classes"
(
    "id"   SERIAL PRIMARY KEY,
    "code" integer UNIQUE
);

ALTER TABLE "vehicles"
    ADD FOREIGN KEY ("brand_id") REFERENCES "brands" ("id");

ALTER TABLE "vehicles"
    ADD FOREIGN KEY ("model_id") REFERENCES "models" ("id");

ALTER TABLE "vehicles"
    ADD FOREIGN KEY ("vehicle_classes_id") REFERENCES "vehicle_classes" ("id");

ALTER TABLE "models"
    ADD FOREIGN KEY ("brand_id") REFERENCES "brands" ("id");

ALTER TABLE "models"
    ADD FOREIGN KEY ("vehicle_classes_id") REFERENCES "vehicle_classes" ("id");

COMMENT ON COLUMN "vehicles"."grnz" IS 'Гос номер';

COMMENT ON COLUMN "vehicles"."grnz_country_code" IS 'Код региона';

COMMENT ON COLUMN "vehicles"."vehicle_uuid" IS 'Уникальный uuid ТС';

COMMENT ON COLUMN "vehicles"."brand_id" IS 'Id бренда';

COMMENT ON COLUMN "vehicles"."model_id" IS 'Id модели';

COMMENT ON COLUMN "vehicles"."vehicle_classes_id" IS 'Код класса ТС';

COMMENT ON COLUMN "vehicles"."active" IS 'Статус ТС';

COMMENT ON COLUMN "brands"."name" IS 'Название бренда';

COMMENT ON COLUMN "models"."name" IS 'Название модели';

COMMENT ON COLUMN "models"."brand_id" IS 'Id бренда';

COMMENT ON COLUMN "models"."vehicle_classes_id" IS 'Id класса ТС';

COMMENT ON COLUMN "vehicle_classes"."code" IS 'Код класса ТС';

--------------------------VEHICLES_INSERT-----------------------------------------------------------

insert into brands (name)
values ('Porsche');
insert into brands (name)
values ('Kia');
insert into brands (name)
values ('Mercedes-Benz');
insert into brands (name)
values ('Infiniti');
insert into brands (name)
values ('KTM');
insert into brands (name)
values ('Honda');
insert into brands (name)
values ('Citroen');
insert into brands (name)
values ('Renault');
insert into brands (name)
values ('Bugatti');
insert into brands (name)
values ('Maybach');
insert into brands (name)
values ('Caparo');
insert into brands (name)
values ('Subaru');
insert into brands (name)
values ('Koenigsegg');
insert into brands (name)
values ('Cadillac');
insert into brands (name)
values ('Hummer');
insert into brands (name)
values ('Audi');
insert into brands (name)
values ('Lotus');
insert into brands (name)
values ('Hyundai');
insert into brands (name)
values ('Land Rover');
insert into brands (name)
values ('Aston Martin');
insert into brands (name)
values ('Rolls-Royce');
insert into brands (name)
values ('MG');
insert into brands (name)
values ('Toyota');
insert into brands (name)
values ('Seat');
insert into brands (name)
values ('Tesla Motors');
insert into brands (name)
values ('Lexus');
insert into brands (name)
values ('Dodge');
insert into brands (name)
values ('Mini');
insert into brands (name)
values ('Pagani');
insert into brands (name)
values ('Caterham');
insert into brands (name)
values ('Abarth');
insert into brands (name)
values ('Alfa Romeo');
insert into brands (name)
values ('Lamborghini');
insert into brands (name)
values ('Noble');
insert into brands (name)
values ('Daihatsu');
insert into brands (name)
values ('Proton');
insert into brands (name)
values ('Skoda');
insert into brands (name)
values ('McLaren');
insert into brands (name)
values ('Mitsubishi');
insert into brands (name)
values ('Morgan');
insert into brands (name)
values ('Smart');
insert into brands (name)
values ('Chevrolet');
insert into brands (name)
values ('Bentley');
insert into brands (name)
values ('Holden');
insert into brands (name)
values ('Maserati');
insert into brands (name)
values ('VW');
insert into brands (name)
values ('Fisker');
insert into brands (name)
values ('Ford');
insert into brands (name)
values ('Chrysler');
insert into brands (name)
values ('Peugeot');

----------------------------------VEHICLES_CLASS_CODES_INSERT---------------------------------------
insert into vehicle_classes (code)
values ('1');
insert into vehicle_classes (code)
values ('2');
insert into vehicle_classes (code)
values ('3');
insert into vehicle_classes (code)
values ('4');


---------------------------------MODELS_INSERT------------------------------------------------------
insert into models (name, brand_id, vehicle_classes_id)
values ('Familia', 47, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('RX-7', 7, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('LeSabre', 22, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Sixty Special', 20, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Axiom', 7, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Touareg 2', 32, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Cirrus', 48, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('E-Series', 1, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('S-Class', 34, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('LeMans', 49, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Corolla', 12, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Mazda6', 22, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('4Runner', 27, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Grand Caravan', 10, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Impreza', 35, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Grand Marquis', 22, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('XJ Series', 29, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('X5', 5, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('MX-5', 9, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Grand Vitara', 31, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Frontier', 24, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Accent', 39, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Oasis', 41, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Fortwo', 46, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Murano', 37, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Sportage', 4, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Range Rover', 18, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Jetta', 6, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Suburban 1500', 30, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('A6', 3, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Celica', 8, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Concorde', 14, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Passat', 3, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Ram Van 2500', 2, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Lumina', 37, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Explorer', 34, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Beretta', 8, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('C30', 3, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('E150', 48, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Panamera', 24, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('CX-7', 29, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Silverado 3500', 10, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Taurus', 4, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('NX', 35, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('300C', 42, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('V70', 21, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Accord', 22, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Topaz', 44, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Tracer', 43, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Forester', 25, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Continental Flying Spur', 25, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('PT Cruiser', 45, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Esperante', 42, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('V8 Vantage S', 37, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('MX-6', 19, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Prius', 36, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('F150', 40, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Land Cruiser', 10, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('MKZ', 40, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('CTS-V', 21, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Express 1500', 22, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Swift', 26, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('i-350', 20, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Century', 4, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Savana', 42, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Laser', 27, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Pathfinder', 30, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Matrix', 3, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('XK', 10, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Continental GT', 30, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Legend', 16, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Eldorado', 19, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('RX-8', 4, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Veloster', 27, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Cooper', 27, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Altima', 35, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Xterra', 39, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Silverado 2500', 4, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Silhouette', 48, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('B-Series', 48, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('F-Series', 24, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Charger', 12, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Econoline E150', 6, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('6 Series', 4, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Azera', 44, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('LSS', 45, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Tribeca', 45, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Compass', 15, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Malibu', 50, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Ascender', 1, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Blazer', 10, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Tiguan', 49, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Vigor', 2, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('GS', 29, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Solstice', 21, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Eos', 47, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Titan', 8, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Murciélago', 27, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Armada', 31, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Grand Am', 37, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('TrailBlazer', 14, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('B9 Tribeca', 25, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Venture', 36, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('GTO', 2, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Sierra 3500', 16, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Town & Country', 19, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('S4', 36, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('SixtyToo', 12, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Continental Mark VII', 19, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('Cabriolet', 48, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Brat', 21, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Park Avenue', 6, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('9000', 6, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Sequoia', 29, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Mustang', 30, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('DB9', 10, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('E-Class', 5, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('CLK-Class', 3, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('Lancer Evolution', 13, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('X3', 25, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Aveo', 46, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('LTD Crown Victoria', 1, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('MKS', 28, 1);
insert into models (name, brand_id, vehicle_classes_id)
values ('9-5', 44, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Trooper', 42, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('350Z', 9, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Tahoe', 50, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('9-3', 46, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('V90', 38, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Odyssey', 43, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('F-Series Super Duty', 5, 4);
insert into models (name, brand_id, vehicle_classes_id)
values ('GT-R', 5, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('H2 SUT', 44, 2);
insert into models (name, brand_id, vehicle_classes_id)
values ('Montana', 16, 3);
insert into models (name, brand_id, vehicle_classes_id)
values ('Cayenne', 28, 2);

-----------------------------------------VEHICLES_INSERT--------------------------------------------
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C143FL', 166, '2074d674-76a3-49b1-a19b-586a959a862a', 3, 108, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X568UB', 73, '98ba34f4-a832-4743-972b-a58ecc7a104e', 22, 60, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L898RP', 72, '56ffb4f2-e755-4d2d-8464-74a7d43aef59', 8, 81, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R412GN', 190, '0d9691b5-c569-488e-9dfa-4de9edecd308', 31, 27, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R333WO', 169, '85a2f00d-427c-4488-bd0b-189db1fcb4fd', 42, 6, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B809QC', 144, '9aa7bd72-bfbf-489a-8eaf-8189e37f317a', 30, 130, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M246WX', 22, '91ed5c37-45de-4a97-85af-c92f1d23766b', 30, 123, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L452VZ', 101, 'cbe4b96c-3162-40c0-bacc-7f989594f08a', 34, 135, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y034FC', 49, 'c732622a-cc32-47c3-9f8b-e58fde154882', 21, 111, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M647ZP', 171, 'f3fecfe3-82d0-4093-a2aa-79fcaf9b1bc2', 18, 103, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T109WN', 149, 'eaba1ba2-a642-440c-adbf-72e678c9be84', 20, 13, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M830EY', 190, 'b6dc9301-2a5f-4683-8c72-f0f307a2f2a1', 32, 124, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P503QF', 123, '13ffaf7c-0848-4220-8b68-b9a9d63dc681', 15, 1, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N796DG', 132, '416c9b8e-1229-4ead-8535-af51555a24e6', 35, 54, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P328JU', 168, '51517c57-ae2b-4a43-8604-882875677842', 38, 108, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q149UH', 114, '16b16e22-6100-4063-b850-66b1d54aef3a', 18, 38, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Z017VC', 89, '4d70ff5e-e24f-4974-8d53-5e352d3fd9f6', 33, 59, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O282RK', 140, 'b734bcb0-9d3c-4a5f-b320-b1ad639eb98b', 4, 38, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A923GD', 101, 'f434096f-5ce2-43a7-8a98-c5151f055077', 9, 3, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q088MF', 107, 'f2f000aa-b20f-4205-838e-7baffe848cd1', 16, 46, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X239VP', 112, 'f1f716a3-b855-412a-8eed-170deeca1133', 7, 46, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J737HI', 199, 'f6846273-077d-4d8f-b776-c1a7bfe5b171', 7, 95, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E584SF', 62, 'c2ec3289-d7bf-435e-b99c-dcc5b4af4f30', 36, 62, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J857JG', 147, 'c595f34e-a604-4116-99e7-061d4e7d44ec', 47, 7, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O303LF', 190, '713f798a-99b0-4694-95c4-9052365cfadd', 38, 43, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S416SZ', 81, '163d3175-77e0-417b-9961-3de1bb5e5511', 20, 22, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P271RU', 124, '5258316d-6fdc-400d-8976-4ecde57102c9', 18, 96, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R712PN', 137, 'b3b8bf08-3573-47cd-aafd-b01cd734dac2', 40, 31, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q512QZ', 58, 'e7385fbc-ea4f-42ec-9d4b-8349d12fbca8', 5, 49, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E622SB', 125, '23965f70-c12d-4870-821f-95fde8eb5064', 36, 89, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('W461CC', 79, '938332fe-171c-44f2-9c12-8b41a4c911d6', 12, 99, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L384RM', 80, '76b26960-d21a-4ada-8ff2-4079868b35ec', 39, 96, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R524NU', 58, 'fb93eebd-e616-4710-bc96-10c827fb9c4a', 17, 43, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I988TG', 90, '6d46ee88-f3e0-41c9-832c-317370e89fec', 49, 21, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A411KL', 151, 'e25bf8c0-597c-415d-aa41-467326c8769b', 31, 83, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P162MO', 42, '6aee8fbc-283c-4a96-9c59-54b1d83ebab1', 17, 16, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q720TX', 195, '2a2a45e5-1d28-42e7-b738-2b228f8b69ce', 7, 121, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q282WS', 30, '2d7de842-a135-4e41-a442-df0b938fbf54', 22, 49, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y834YA', 50, 'fa412466-81b7-4cf5-9b1b-3faa52d3a324', 46, 122, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('G546WB', 117, 'e0b8ae85-ae6a-49ae-94f7-c6a5bc934d1c', 24, 31, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B892OG', 51, 'faef5e9f-b0e3-452f-931b-5e6c023d5812', 41, 31, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V381IS', 152, 'b5241ff4-79c4-421f-b438-a8df44edaad6', 48, 19, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X608SH', 141, 'ce9e20e2-47d5-4d12-aeb1-fc0ffe3d8b72', 13, 80, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T051DA', 20, '5466d977-119e-4d23-9883-a368d5f5919a', 5, 63, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y994KG', 80, '3dfa81a2-081b-4392-bafe-57e221bacd61', 10, 29, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H537QG', 61, '0e1c41a8-a476-4ff9-90d0-e8cd93c38df0', 21, 6, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E741RP', 173, 'effa0463-cb24-4280-949c-ff9190e4bb8d', 32, 83, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K635EC', 153, 'b0a9632e-5248-4fca-8c62-bfe4c6741ef4', 16, 17, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M799IE', 62, '47308cb3-3ca9-48a5-8375-758bd1ad6801', 20, 42, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('D144YG', 124, '2e1bcdaf-892d-441e-8e29-b59561882280', 9, 29, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J862TQ', 37, '336d98d7-3293-475e-a096-8ee59baffb0c', 41, 105, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S937MH', 42, 'f4d066e4-ee3c-45e7-a7a6-022e3a059062', 2, 96, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M985MQ', 25, '35106efc-241e-4640-9033-e536fa0c2ac4', 32, 11, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R842HP', 151, '7952ec85-f591-4e5d-b41b-f01c2ba28bdf', 39, 45, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('D414MM', 81, 'd5739e81-920e-42ff-a6a1-41ef9070b8d2', 38, 46, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('U560CM', 125, '9b3ce267-c6a0-42d6-bafa-28f12d6740a5', 12, 7, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M878BU', 65, 'e06455fe-5737-42a6-995d-a6b81437a305', 35, 54, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B518YO', 89, '6620e5f2-1cb2-4d75-ba93-a29bced5626a', 23, 63, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I642UU', 182, '5fd0fd11-b397-4e29-8ab4-c7d6486da229', 18, 26, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('G483IF', 13, 'c476099f-3a38-49eb-adb5-5cacfaf5bf56', 39, 3, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J039PI', 83, '8e94ea2c-fde8-4601-9109-4f420535710a', 14, 10, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R072TW', 162, '4c30fdfa-fbe4-40a6-acc6-818b07824d3d', 39, 13, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M657DO', 44, '1560c9b7-55e3-4af7-ad4d-8a3b671f77ae', 20, 134, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N702LY', 65, '6cd81fdf-246a-4cf7-bd30-c06faa4940e5', 29, 17, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K955IW', 130, '9610dbe4-2a65-4da6-9e12-018022011be3', 40, 59, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X947XR', 33, 'aaeea753-bf79-4714-a579-0cb748df118e', 16, 26, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A818RS', 165, 'cab27198-db91-4aaa-9bd8-78f02050af0a', 24, 72, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N518DB', 87, '9eff3471-2eb9-422f-aa41-3e1f1858df41', 31, 74, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M086MP', 12, 'e40c4707-fe1a-47fb-9b93-ef185b581038', 42, 4, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L344WJ', 124, 'de3a49f5-594f-43d3-826a-2c8f3d04dbc3', 2, 76, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B357OV', 164, 'ebdd1193-2def-4d83-9995-b813a05e6f38', 45, 36, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F948SP', 95, '9e4bd34e-7163-4509-889c-262b187acfeb', 16, 1, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E596MU', 139, '5d40fedf-2e35-4f99-88d9-57981032b143', 46, 62, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P734JN', 188, 'f51042c2-b27e-4797-81c2-8164913b55a3', 44, 78, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I757PK', 41, '406eba9e-5a59-47ef-9e90-f2f3efeeb74d', 42, 129, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O441QY', 125, '44c8d3a1-3f76-4d92-981d-b5d914de8337', 38, 84, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M674VX', 194, '7162b7c7-0c16-43f3-a883-99becf7642d9', 39, 128, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y667GR', 134, 'f739fc4f-d6c8-4fc3-adeb-bee8d744c389', 6, 53, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K552OF', 54, 'c2d1e4b5-04ab-4bb0-b027-da2e2c50743b', 44, 116, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V250LY', 40, '55f89ee8-cd84-4581-9893-4c1e92d39e60', 7, 16, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O691WT', 189, '96db796b-d6ea-451a-bc0f-6e764a2229af', 6, 21, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H353UI', 34, '2a598ca0-8df7-4467-a7d0-eae0e782c174', 23, 30, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R281UW', 58, 'f8a43f80-58a1-4e85-9d97-ef4cddf659e9', 6, 111, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J498EH', 121, '9a811598-7b18-4bd0-95dc-9ef0d248d1d9', 29, 121, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V085RT', 77, 'c2e84039-981f-4ceb-986a-014cf0e12db8', 21, 47, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F916YJ', 169, '7949fdbb-a143-4991-a502-6fce6ee0e66d', 19, 25, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V279KT', 137, '3a433f61-8112-4b43-ab9b-dcaa3a692ea4', 21, 99, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V797VN', 27, 'c1c60383-af84-4103-bcae-70b89d4dc9c5', 31, 81, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I747NR', 70, '4767dd9b-7714-4b3a-917a-884e55b60b53', 8, 98, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F416UD', 25, '04771ff8-b070-49c2-bc5a-cffe84750610', 26, 21, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q244UA', 48, '7ff75250-0ef0-4fd2-8b3c-ceb5bae8dc6d', 35, 129, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B001XC', 197, 'bd869404-5abf-4587-8e8a-ddd4a7fe2a4d', 34, 4, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y658RG', 59, '513b3c18-e239-48c1-a30e-f752e670ceee', 45, 128, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q170ZH', 110, '3d8bfbb7-5ca6-41c0-aa1e-0efb85b6ceba', 28, 17, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L243PE', 70, 'cbf7cb91-bf83-4123-af04-79a8e06c3fd2', 17, 43, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S654SE', 106, '2f28360e-11fb-44d8-a365-a147158877f9', 24, 46, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A054CR', 43, '2255d3d6-2e25-4746-a7f4-bdb998a91bed', 3, 65, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X899QY', 13, 'ea59bc82-88ec-4203-86f3-38151b9c4447', 29, 118, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N206CQ', 40, 'eda278f2-6332-46ba-8637-20d18f772722', 14, 55, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E567IF', 71, 'c6ccacac-594d-4ad7-850a-60a1e272853f', 28, 34, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C842FX', 36, '9b53dd83-17b6-4261-989e-4e15298427c9', 36, 40, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P300KT', 138, 'ff8c2f58-70aa-4013-afdf-32dc405974bd', 24, 97, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V214DN', 38, '86293a36-0f02-4797-8b2c-742cb3ab8a51', 18, 43, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S619OT', 124, '1d884ede-355a-4d2b-87bd-55e5836a8540', 20, 89, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('U785EW', 197, 'daa44f35-98c2-4cdf-87ad-de8b30eeaf60', 31, 6, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N973VP', 60, 'da38fb22-1ead-48f2-a479-4d242f318cda', 4, 129, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E844BQ', 108, '9b222344-e3db-4722-ba61-3fbf30ab8781', 27, 75, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('U235CR', 153, 'ef5f4c5e-01c5-4336-95fd-f26bd505519e', 29, 128, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F232OA', 76, '54490e4c-4a09-40b4-94f3-788076d555bf', 3, 92, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R683BU', 176, '54569fbd-64e5-45a6-81b7-fc601b12ee7d', 5, 87, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N033VW', 88, '95297981-d990-4de8-80b0-098f7fb0203c', 44, 106, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N761QJ', 185, 'e08b456f-b4e9-446d-b0b0-f819841b1a33', 15, 39, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B765WP', 189, 'e1a8627e-9cc6-4190-ba15-723225a2f596', 19, 77, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N237SP', 137, '4e514c17-70c2-463a-8901-89d488a7db8e', 45, 48, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N535QM', 23, '1246c766-ba00-4739-ba46-085266095e49', 43, 60, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T141PX', 56, '7cdaac09-a4d6-4175-9306-fc06909d11c7', 34, 99, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S568SD', 75, '96bb107f-2e76-479e-ba2c-06a2fa84c17f', 10, 24, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V417CI', 164, 'ee8e4735-4ed5-403f-878d-377c1a670003', 33, 124, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N279PW', 121, 'a61af267-0a8a-4375-b478-f8bc50bbe41c', 24, 128, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Z199TI', 21, '624b924f-a539-41db-aedf-a8c87c322a39', 11, 131, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q283LG', 102, '84de95e8-f1c9-434b-8862-d9e91f2323c1', 26, 84, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q715RD', 83, '1bade4b9-4b68-4a4c-b59a-632728c0a6f8', 1, 68, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O249AQ', 125, '4e80b28e-58b0-4368-8220-feecfec18765', 40, 55, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A266DH', 146, '46024f84-622b-4801-bcc1-55133f243dd5', 20, 38, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I320FF', 18, '24c82adf-a75d-42fe-903f-d42802a9380f', 35, 23, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O551YU', 50, 'afb8e54f-8c20-4539-bb6c-32747d4f1e87', 5, 27, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L612SI', 118, '9aa35642-dbc9-4361-8598-17e4c4dc4b43', 21, 125, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H737GK', 88, '9d35b749-e53b-496e-9c8c-6985b33ac3b1', 40, 35, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A978ND', 15, '70d59ba8-18d2-44a7-8e54-94775afad1c9', 40, 87, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X774NP', 51, '04ac7815-caa4-4211-80d2-25bd28452e5a', 1, 86, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F300CZ', 98, '466e0a58-52c1-4c2a-bf28-5ebb40ad63ed', 8, 44, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E433CK', 46, 'f002aab1-19f2-41e2-8b63-aaf55f5f8f0d', 11, 36, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N457NE', 169, '1dcfe988-dcb8-433a-be21-bfc3c36bb9f5', 8, 92, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K796AR', 16, '3f31945e-3389-4793-8016-dbe7ed49e2bc', 25, 104, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V065LF', 138, '4da112bd-72c4-4bf3-83fa-263ca9679412', 16, 36, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C976LF', 90, '80e13d4d-9651-449c-a27d-8967523562cc', 15, 45, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I081YZ', 197, '460bdf80-f7f6-46fc-b194-6ed4bf8758d7', 11, 30, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A006HU', 130, '387664cd-d61c-4866-beb7-e2fb5312669c', 23, 75, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Z676AH', 133, 'a5dcf604-2205-4ff2-9860-b27190d0e16a', 35, 50, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('U075PX', 84, '1389adc7-5bbb-43b4-b51d-9739a7b35a81', 10, 33, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H855CF', 150, 'df2117a0-9b93-40fc-97d2-bbad65b88aa9', 49, 77, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V747XS', 176, '47ac2bc5-025f-47f6-906b-1ea8d8939cdf', 25, 75, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E801YJ', 127, 'c5170f78-9201-42c8-adce-fdf836f47b54', 45, 66, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('X149IK', 102, '61a36143-b757-46cd-b01c-714014d23339', 48, 117, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C814EA', 13, '0c2bb1c9-0ffa-459c-8a12-e448998151ec', 9, 16, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Z318NM', 185, '0f95706f-1855-41a7-bcac-0844c9b0b565', 27, 125, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q379VY', 138, '4d1729a3-1bd9-45dd-83b8-039fc4b0f4e1', 9, 83, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S471DW', 67, '6b493a90-ba5b-41b6-bfa7-4a732c6f4628', 2, 45, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('D573YL', 56, '504a31b5-0e0a-4c47-8d92-bbcf5ee759c0', 1, 26, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T051KO', 145, '6226681d-a157-471f-b1a6-29c688243a3d', 15, 130, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q618OJ', 97, 'd90c4b32-c79e-4b34-86b8-7b7890557cc9', 38, 66, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y915KL', 31, 'a2e0301d-946e-41e6-a3da-65c43dff6f26', 32, 49, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L588KW', 74, '689a6c75-3d55-405d-8534-fafc1f05e3dd', 31, 99, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C545RD', 39, 'f6286def-88a3-4f39-a06f-61c0b41da632', 45, 55, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K075EC', 190, 'aa5020e6-9cad-45d7-8cd6-75db6be4815a', 8, 68, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Z610BI', 148, 'a8e36fc7-59bf-4613-91e2-b0450bebc986', 28, 3, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Z934DV', 30, '581c9f01-844d-4e53-92ab-eb0c40eab6b9', 6, 118, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E699YM', 100, '8ef286ac-4039-44bb-9357-ac4b4931485f', 33, 8, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J101JE', 77, 'f962b18d-8a09-4bb4-8396-3c2e1ab11b46', 7, 5, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K872XZ', 78, '4a249de0-80f7-4e91-b235-750ddbb3bff8', 24, 25, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Y665VI', 139, 'ec594914-ad1b-445a-9263-f83d1442ca6b', 15, 129, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('G759QG', 117, '09287272-60f4-4602-84cd-465594b296b7', 37, 116, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E163KJ', 157, '7f6ace65-6e87-4b78-9c74-1b78a70f519c', 5, 135, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F989KJ', 112, 'c999d81e-1af7-4baa-9d97-78a7118428f8', 37, 59, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C888IW', 118, 'be0bd986-7466-464f-a804-1484dcba96f2', 7, 74, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('G938WA', 36, '952d525f-f6f0-4dce-b5b3-142339daa9e5', 39, 39, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('M147NN', 37, '29a1fbb0-81d2-482d-b46f-2abd34e0aa84', 26, 85, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H106WC', 127, 'bfd286f4-091a-42e1-b970-32846104aaef', 18, 129, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V337PG', 36, '0e9752ee-6946-4306-b57d-18964241a0f0', 39, 104, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S154JQ', 137, '8bafb1ad-0038-4bb5-a6ff-3ff1b4d18d48', 38, 43, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A558KC', 183, '0a37b404-72ad-480b-9ded-64181ace2726', 20, 8, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H829RI', 145, '3849f13f-2d76-4b31-b09d-833a410f1c84', 25, 29, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I725MV', 111, 'c5ed1084-073f-4a48-853a-83c2efda9ee8', 48, 50, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H817EV', 25, '7617e289-3a99-4780-8e88-cac6e488fdc4', 16, 30, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N826ML', 23, 'ce057dde-b5a5-4f6f-a445-0438a57067d5', 1, 117, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B594VI', 172, '8fb6d2f3-0ba6-4f7f-956d-5ab58607fae0', 21, 95, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S704SL', 167, '7dd9d33c-db2b-4c2f-bdc7-b5fec56b4d6f', 31, 104, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I085RU', 20, '663f26ab-b2de-413a-b51d-00255a9bc4f6', 35, 56, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L057BI', 189, '47fef543-33f3-4de1-9bd7-b45fc82a932e', 6, 90, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R839TN', 135, 'bbc537d1-8db7-4d2f-bf53-680e366ca209', 26, 61, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P280HL', 50, 'a3b9cce7-55cc-4846-b52c-4f8a7e80157a', 43, 125, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('U030LV', 117, '2681907e-b10d-441b-bdc0-5ab68ef078b6', 49, 72, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('U603IS', 125, '1d8aba18-afe2-4812-96bc-aeffbbc3f043', 47, 63, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C118WM', 135, '5ecced89-5a14-45b2-9e8f-0c9e05faff61', 30, 11, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F044DM', 119, '8538c8d3-13a1-41fa-b504-f96f27db6533', 16, 14, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F567CE', 164, '221ea904-230e-4986-8330-ebfa5a7a2541', 45, 29, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('F611RX', 165, '08d533a4-c2e2-490e-aad4-a2d56bbcefad', 45, 12, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('C329RY', 105, '948355b2-e4f5-4c4f-8ecd-26f08c59aac1', 17, 12, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('E830EU', 124, '3651601f-6ee7-446d-aa4d-f626fd6a685d', 3, 116, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V330LE', 89, '23e51c37-5367-4a87-ae9a-2be92bb2901e', 34, 89, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('D205CQ', 62, 'fe599ab4-ab90-4146-8274-ccbd5c5d3673', 21, 32, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T554JJ', 159, '8baccf82-2e4e-420e-bc8d-afa4bb991a2e', 38, 129, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H100JX', 98, 'd2e1e4fd-9a41-48ae-8171-197830119786', 2, 5, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V379DQ', 78, '30d3872d-68f6-4488-bbd6-69879533498d', 36, 87, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('L713MA', 28, '24c8db10-eceb-4916-85d1-d981e8798773', 44, 115, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('R207ZO', 36, '3ae39b08-49e0-403e-b2c1-5c068933bb7a', 11, 22, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('D322ZA', 27, 'bf9b3a51-56a0-4f4f-9d3b-432ffdfe311e', 20, 77, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B055ED', 55, 'cd6bb4b0-87db-4f0e-9599-7043175c87b0', 33, 118, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('O198XE', 147, '847b06a9-edc2-4eb6-9334-5150a26f39c1', 8, 45, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('P724WJ', 137, '5f40d0a9-48b2-472a-85f8-09ea19030e94', 47, 93, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I509SI', 65, 'fa74bac5-6980-4324-9dc4-d3a35c4e7554', 34, 73, 3, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('G590YW', 47, 'bf25ab04-561a-49b0-98fe-de10273faa77', 25, 34, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('K633JP', 54, 'beec3218-eebc-43e4-bfa9-b02e43136575', 23, 58, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N408XT', 178, '176735ea-b7cc-4d33-ac9f-39e57d207b1f', 23, 51, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B615CM', 83, '2b8683d9-cf78-440e-a725-78ba93ad5f41', 30, 117, 4, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S375GA', 56, 'ff1d9ab8-6854-4146-badc-c715314fdae3', 24, 87, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('N206BI', 28, '8fc40f54-7a24-4b06-9fad-9af073a7af0e', 44, 38, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('Q938XI', 49, '1b22f2fc-2216-4bda-a791-bb9f77c31aa6', 17, 43, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('I857ZW', 169, '50f9affe-5f0d-4493-aeb9-ef201e79458d', 36, 23, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T202ZJ', 95, '5c5cd9c4-bc1c-441e-989f-ed298f25a60c', 40, 7, 2, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('V730RB', 106, 'e3759aa1-0006-4165-856e-5866174db85f', 24, 92, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('H054VY', 56, 'fd298df9-9f37-42aa-8dfa-eb8404948093', 36, 41, 4, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('T602DA', 183, '355fac6e-1ea4-4b4f-aadf-6df4013559e5', 1, 56, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('D854BJ', 30, '3fce43fd-7ed2-40ec-8692-4bf59c4bfe14', 44, 57, 2, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('B363VN', 44, 'ca02f3d1-31d1-4c22-bae8-c6aec2b807fd', 49, 44, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('W247LV', 100, '37a4ac50-af5a-4c26-9eb6-7c6da47856d1', 15, 58, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J454CJ', 60, '0b40acd4-02f4-487a-9d3f-e61a4792fa47', 11, 29, 1, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('S532IY', 37, '2cb60d5d-a25b-4376-8212-40ca740c07ca', 48, 4, 3, false);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('J182PB', 122, '3a606330-e7ea-4f88-b294-d125c2dc9e15', 4, 116, 1, true);
insert into vehicles (grnz, grnz_country_code, vehicle_uuid, brand_id, model_id, vehicle_classes_id,
                      active)
values ('A071XV', 107, '8554b554-84e9-4b46-8a42-6f143fe5cec6', 33, 74, 3, false);