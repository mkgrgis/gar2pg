
# $1 - URL для скачки архива с XSD публикуемых данных Государственного Адресного Реестра
# $2 - название схемя для разворачивания принимающих таблиц

# Пример загрузки скрипта SQL создающего схему и струтуру для метаданных
cat sql/xsd.sql | psql;
# Пример запуска первой сессии загрузки метаданных, можно передать иной адре источника XSD чем по умолчанию из ФНС
./load_xsd.sh "$1";

ddf='sql/ГАР_pgDDL.sql';
echo "select 'CREATE SCHEMA \"' || set_config('ГАР.схема', '$2', false) ||'\";'; select ddl from xsd.table_ddl;" | psql -Atq > "$ddf";
# Прочитать сгенерированное
echo "Автоматический скрипт, расшифровка загруженных XSD
----------------------------------------------------------------------------"
cat "$ddf";

mkdir test/result;

echo -n "ФАЙЛЫ ГАР  - ";
echo 'select "№", xsd_id, loading_session_id, xsd_filename, xml_file_prefix, table_name, root_node, singular_transport_node, xsd_descr_general, xsd_descr_singular
from xsd.transport_files;' | psql > test/result/xml_files.out;
diff test/expected/xml_files.out test/result/xml_files.out > test/xml_files.diff;
diff test/expected/xml_files.out test/result/xml_files.out || r="$?";
echo "$r";

echo -n "АТРИБУТЫ ГАР - ";
echo 'select xsd_id, loading_session_id, xsd_filename, root_node, "№", transport_attribute, column_name, xsd_dt, "usage", "not null", "type", "cardinality", "length", name0, table_name, xml_file_prefix
from xsd.transport_attributes;' | psql > test/result/xml_att.out;
diff test/expected/xml_att.out test/result/xml_att.out > test/xml_att.diff;
diff test/expected/xml_att.out test/result/xml_att.out || r="$?";
echo "$r";

echo -n "DDL - "
ddf='sql/ГАР_pgDDL.sql';
cat "$ddf" | psql -e > test/result/ddl.out || true;
diff test/expected/ddl.out test/result/ddl.out > test/ddl.diff;
diff test/expected/ddl.out test/result/ddl.out || r="$?";
echo "$r";

echo -n "Сопоставление словарей PostgreSQL и xsd - "
dct='sql/dict_xml_pg.sql';
cat "$dct" | psql --set=схема_разворачивания_ГАР="$2" -e > test/result/dict_xml_pg.out || true;
diff test/expected/dict_xml_pg.out test/result/dict_xml_pg.out > test/dict_xml_pg.diff;
diff test/expected/dict_xml_pg.out test/result/dict_xml_pg.out || r="$?";
echo "$r";

[ "$r" != "" ] && exit 100;
exit 0;
