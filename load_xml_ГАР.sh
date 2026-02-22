#!/bin/sh

absolute_path=$(readlink -f "$1");
fn=$(basename "$absolute_path");
crt=$(echo "select * from xsd.program_call_parameters where xml_file_prefix = ((regexp_match('$fn', '(?<=(^|/)AS_)\D+(?=_\d)'))[1])" | psql -tA);
tc=$(echo "$crt" | cut -f 1 -d '|');
txml=$(echo "$crt" | cut -f 2 -d '|');
tpar=$(echo "$crt" | cut -f 3 -d '|');

echo -e "Загрузка данных XML Государственного Адресного Реестра в PostgreSQL
   в таблицу        :\x1b[33m\"$tc\"\x1b[39m
   префикс файла    :\x1b[33m'$txml'\x1b[39m
   параметры вызова :\x1b[33m$tpar\x1b[39m
   файла            :\x1b[33m'$absolute_path'\x1b[39m
XML ГАР -> PostgreSQL ... ";
sh -c "./гар_xml2pg -x '$1' $tpar -l ГАР_SQL.log";
