ALTER TABLE "data"."Параметры помещений" ADD CONSTRAINT параметры_помещений_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Типы параметров"("Код типа параметра") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Параметры машиномест" ADD CONSTRAINT параметры_машиномест_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Типы параметров"("Код типа параметра") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Параметры квартир" ADD CONSTRAINT параметры_квартир_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Типы параметров"("Код типа параметра") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Параметры земельных участков" ADD CONSTRAINT параметры_земельных_участков_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Типы параметров"("Код типа параметра") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Параметры домов" ADD CONSTRAINT параметры_домов_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Типы параметров"("Код типа параметра") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Параметры адресных объектов" ADD CONSTRAINT параметры_адресных_объектов_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Адресообразующие элементы"("Ключ") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Параметры адр. эл. и недвижимости" ADD CONSTRAINT параметры_адр_эл_и_недвижимости_fk FOREIGN KEY ("Тип параметра") REFERENCES "data"."Типы параметров"("Код типа параметра") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."№ домов улиц населённых пунктов" ADD CONSTRAINT "_домов_улиц_населённых_пунктов_FK_1" FOREIGN KEY ("Статус действия над записью") REFERENCES "data"."Статусы действия"("Код статуса") ON DELETE RESTRICT ON UPDATE RESTRICT;
--ALTER TABLE "data"."№ домов улиц населённых пунктов" ADD CONSTRAINT "_домов_улиц_населённых_пунктов_FK_2" FOREIGN KEY ("Дополнительный тип дома 1") REFERENCES "data"."Типы домов"("Код") ON DELETE RESTRICT ON UPDATE CASCADE;
--ALTER TABLE "data"."№ домов улиц населённых пунктов" ADD CONSTRAINT "_домов_улиц_населённых_пунктов_FK_3" FOREIGN KEY ("Дополнительный тип дома 2") REFERENCES "data"."Типы домов"("Код") ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE "data"."Иерархия муниципальная" ADD CONSTRAINT иерархия_муниципальная_fk FOREIGN KEY ("Код адр. об.") REFERENCES "data"."Адресообразующие элементы"("Ключ") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "data"."Иерархия муниципальная" ADD CONSTRAINT иерархия_муниципальная_fk_1 FOREIGN KEY ("Код родительского объекта") REFERENCES "data"."Адресообразующие элементы"("Ключ") ON DELETE RESTRICT ON UPDATE RESTRICT;




