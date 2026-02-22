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
