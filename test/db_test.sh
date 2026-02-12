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
cat "$dct" | psql -e > test/result/dict_xml_pg.out || true;
diff test/expected/dict_xml_pg.out test/result/dict_xml_pg.out > test/dict_xml_pg.diff;
diff test/expected/dict_xml_pg.out test/result/dict_xml_pg.out || r="$?";
echo "$r";

# Пример прогрузки местных данных
xmldatadir='test/ГАР XML/09';
ls -1 "$xmldatadir" | while read f; do ./load_xml_ГАР.sh "$xmldatadir/$f"; done;
# Пример прогрузки обобщённых данных для всех регионов
xmldatadir='test/ГАР XML';
ls -1 "$xmldatadir" | while read f; do ./load_xml_ГАР.sh "$xmldatadir/$f"; done;

echo -n "Итоговая прогрузка - "
tf='test/final.sql';
cat "$tf" | psql -e > test/result/final.out || true;
diff test/expected/final.out test/result/final.out > test/final.diff;
diff test/expected/final.out test/result/final.out || r="$?";
echo "$r";

[ "$r" != "" ] && exit 100;
exit 0;
