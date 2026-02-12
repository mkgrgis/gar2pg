CREATE SCHEMA "data";
-- AS_ADDR_OBJ_2_251_01_04_01_01.xsd
CREATE TABLE "data"."Адресообразующие элементы" (
    "Ключ" bigint not null,
    "Код адр. об. типа INTEGER" bigint not null,
    "Код адр. об. типа UUID" uuid not null,
    "ID изменившей транзакции" bigint not null,
    "Наим." varchar not null,
    "Краткое наим. типа объекта" varchar not null,
    "Уровень адр. об." varchar not null,
    "Статус действия над записью" int not null,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус актуальности адр. об. ФИАС" boolean not null,
    "Признак действующего адр. об." boolean not null
);
-- AS_ADDR_OBJ_TYPES_2_251_03_04_01_01.xsd
CREATE TABLE "data"."Типы адресных объектов" (
    "Код записи" int not null,
    "Уровень адр. об." int not null,
    "Краткое наим. типа объекта" varchar not null,
    "Полное наим. типа объекта" varchar not null,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_APARTMENTS_2_251_05_04_01_01.xsd
CREATE TABLE "data"."Помещения" (
    "Ключ" bigint not null,
    "Код объекта типа INTEGER" bigint not null,
    "Код адр. об. типа UUID" uuid not null,
    "ID изменившей транзакции" bigint not null,
    "№ комнаты" varchar not null,
    "Тип комнаты" smallint not null,
    "Статус действия над записью" smallint not null,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус актуальности адр. об. ФИАС" boolean not null,
    "Признак действующего адр. об." boolean not null
);
-- AS_APARTMENT_TYPES_2_251_07_04_01_01.xsd
CREATE TABLE "data"."Типы помещений" (
    "Код типа" int not null,
    "Наим." varchar not null,
    "Краткое наим." varchar ,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_CARPLACES_2_251_06_04_01_01.xsd
CREATE TABLE "data"."Машино-места" (
    "Ключ" bigint not null,
    "Код объекта типа INTEGER" bigint not null,
    "Код адр. об. типа UUID" uuid not null,
    "ID изменившей транзакции" bigint not null,
    "№ машиноместа" varchar not null,
    "Статус действия над записью" int not null,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус актуальности адр. об. ФИАС" boolean not null,
    "Признак действующего адр. об." boolean not null
);
-- AS_HOUSES_2_251_08_04_01_01.xsd
CREATE TABLE "data"."№ домов улиц населённых пунктов" (
    "Ключ" bigint not null,
    "Код объекта типа INTEGER" bigint not null,
    "Код адр. об. типа UUID" uuid not null,
    "ID изменившей транзакции" bigint not null,
    "Основной № дома" varchar ,
    "Дополнительный № дома 1" varchar ,
    "Дополнительный № дома 2" varchar ,
    "Основной тип дома" int ,
    "Дополнительный тип дома 1" int ,
    "Дополнительный тип дома 2" int ,
    "Статус действия над записью" int not null,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус актуальности адр. об. ФИАС" boolean not null,
    "Признак действующего адр. об." boolean not null
);
-- AS_HOUSE_TYPES_2_251_13_04_01_01.xsd
CREATE TABLE "data"."Добавочные параметры домов" (
    "Код" int not null,
    "Наим." varchar not null,
    "Краткое наим." varchar ,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_HOUSE_TYPES_2_251_13_04_01_01.xsd
CREATE TABLE "data"."Типы домов" (
    "Код" int not null,
    "Наим." varchar not null,
    "Краткое наим." varchar ,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_ADDR_OBJ_DIVISION_2_251_19_04_01_01.xsd
CREATE TABLE "data"."Операции переподчинения" (
    "Ключ" bigint not null,
    "Родительский ID" bigint not null,
    "Дочерний ID" bigint not null,
    "ID изменившей транзакции" bigint not null
);
-- AS_ADM_HIERARCHY_2_251_04_04_01_01.xsd
CREATE TABLE "data"."Иерархия административная" (
    "Ключ" bigint not null,
    "Код объекта" bigint not null,
    "Код родительского объекта" bigint ,
    "ID изменившей транзакции" bigint not null,
    "Код региона" varchar ,
    "Код района" varchar ,
    "Код города" varchar ,
    "Код населенного пункта" varchar ,
    "Код ЭПС" varchar ,
    "Код улицы" varchar ,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Признак действующего адр. об." boolean not null,
    "Материализованный путь к объекту" varchar not null
);
-- AS_CHANGE_HISTORY_251_21_04_01_01.xsd
CREATE TABLE "data"."История изменений" (
    "ID изменившей транзакции" bigint not null,
    "Уник. ID объекта" bigint not null,
    "Уник. ID изменившей транзакции" uuid not null,
    "Тип операции" int not null,
    "ID д-та" bigint ,
    "Дата изменения" date not null
);
-- AS_MUN_HIERARCHY_2_251_10_04_01_01.xsd
CREATE TABLE "data"."Иерархия муниципальная" (
    "Ключ" bigint not null,
    "Код адр. об." bigint not null,
    "Код родительского объекта" bigint ,
    "ID изменившей транзакции" bigint not null,
    "Код ОКТМО" varchar ,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Признак действующего адр. об." boolean not null,
    "Материализованный путь к объекту" varchar not null
);


-- AS_NORMATIVE_DOCS_2_251_11_04_01_01.xsd
CREATE TABLE "data"."Документы обоснования адресации" (
    "Уник. идентификатор д-та" bigint not null,
    "Наим. д-та" varchar not null,
    "Дата д-та" date not null,
    "№ д-та" varchar not null,
    "Тип д-та" int not null,
    "Вид д-та" int not null,
    "Дата обновления" date not null,
    "Наим. органа создвшего нор-ый д-т" varchar ,
    "№ государственной регистрации" varchar ,
    "Дата государственной регистрации" date ,
    "Дата вступления в силу нор-ого д-та" date ,
    "Комментарий" varchar 
);
-- AS_OBJECT_LEVELS_2_251_12_04_01_01.xsd
CREATE TABLE "data"."Уровни адресных объектов" (
    "Ключ. № уровня объекта" smallint not null,
    "Наим." varchar not null,
    "Краткое наим." varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Признак действующего адр. об." boolean not null
);
-- AS_OPERATION_TYPES_2_251_14_04_01_01.xsd
CREATE TABLE "data"."Статусы действия" (
    "Код статуса" int not null,
    "Наим." varchar not null,
    "Краткое наим." varchar ,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры адресных объектов" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры квартир" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры машиномест" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры домов" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры адр. эл. и недвижимости" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры помещений" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_2_251_02_04_01_01.xsd
CREATE TABLE "data"."Параметры земельных участков" (
    "Код записи" bigint not null,
    "Код адр. об." bigint not null,
    "ID изменившей транзакции" bigint ,
    "ID завершившей транзакции" bigint not null,
    "Тип параметра" int not null,
    "Значение параметра" varchar not null,
    "Дата внесения" date not null,
    "Дата начала действия записи" date not null,
    "Дата окончания действия записи" date not null
);
-- AS_PARAM_TYPES_2_251_20_04_01_01.xsd
CREATE TABLE "data"."Типы параметров" (
    "Код типа параметра" smallint not null,
    "Наим." varchar not null,
    "Краткое наим." varchar not null,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_REESTR_OBJECTS_2_251_22_04_01_01.xsd
CREATE TABLE "data"."Коды адресных элементов" (
    "Уник. идентификатор объекта" bigint not null,
    "Дата создания" date not null,
    "ID изменившей транзакции" bigint not null,
    "Уровень объекта" int not null,
    "Дата обновления" date not null,
    "GUID объекта" uuid not null,
    "Признак действующего объекта" boolean not null
);
-- AS_ROOMS_2_251_15_04_01_01.xsd
CREATE TABLE "data"."Комнаты" (
    "Ключ" bigint not null,
    "Код объекта типа INTEGER" bigint not null,
    "Код адр. об. типа UUID" uuid not null,
    "ID изменившей транзакции" bigint not null,
    "№ комнаты или офиса" varchar not null,
    "Тип комнаты или офиса" int not null,
    "Статус действия над записью" int not null,
    "Код с предыдущей истор. зап." bigint ,
    "Код с последующей истор. зап." bigint ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус актуальности адр. об. ФИАС" boolean not null,
    "Признак действующего адр. об." boolean not null
);
-- AS_ROOM_TYPES_2_251_17_04_01_01.xsd
CREATE TABLE "data"."Типы комнат" (
    "Код типа" int not null,
    "Наим." varchar not null,
    "Краткое наим." varchar ,
    "Описание" varchar ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус активности" boolean not null
);
-- AS_STEADS_2_251_18_04_01_01.xsd
CREATE TABLE "data"."Земельные участки" (
    "Ключ" int not null,
    "Код объекта типа INTEGER" int not null,
    "Код адр. об. типа UUID" uuid not null,
    "ID изменившей транзакции" int not null,
    "№ земельного участка" varchar not null,
    "Статус действия над записью" varchar not null,
    "Код с предыдущей истор. зап." int ,
    "Код с последующей истор. зап." int ,
    "Дата внесения" date not null,
    "Начало действия записи" date not null,
    "Окончание действия записи" date not null,
    "Статус актуальности адр. об. ФИАС" boolean not null,
    "Признак действующего адр. об." boolean not null
);


