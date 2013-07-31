#######################
### Skrypt stworzony na podstawie pracy użytkownia @mickey z forum.xunil.pl
#######################
### Plik generuje skrypt do kopiowania pikon ze zmianą nazwy
### na refernece zgodną z naszą listą kanałów.
### Źródłowe nazwy pikon generowane są na podstawie nazw kanałów w generowanym bukiecie,
### w związku z tym mogą niekiedy wymagać drobnych korekt.
### Po wygenerowaniu najlepiej sprawdzić sobie plik kopiuj_picony.sh
### i ewentualnie poprawić błędne nazwy plików źródłowych (logos/costam.png)
#######################


#!/bin/bash

### Ścieżka do bukietu (zwykle /etc/enigma2/userbouquet.moj_ulubione_kanaly.tv) ###
bouquet=/etc/enigma2/userbouquet.wszystkie_kanaly__tv_.tv

### Ścieżka do pliku lamedb (zwykle /etc/enigma2/lamedb) ###
lamebase=/etc/enigma2/lamedb

### Ścieżka do pliku generowanego skryptu ###
cp=/tmp/kopiuj_picony.sh

rm $cp

while read -r line; do           
    #echo "$line" 
    first_bk=`echo "$line" | awk '{ print $1 }'`
    #echo "$first_bk"
    if [ "$first_bk" = "#SERVICE" ] 
    then
      second_bk=`echo $line | awk '{ print $2 }' | sed 's/:/ /g'`
      picon_name=`echo "$second_bk" | awk '{ printf("%s_%s_%s_%s_%s_%s_%s_%s_%s_%s.png",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10) }'`
      service_info=`echo "$second_bk" | awk '{ printf("%s_%s_%s_%s_%s_%s_%s_%s_%s_%s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10) }'`
      lame_name=`echo "$second_bk" | awk '{ printf("%4s:%8s:%4s:%4s:", tolower($4), tolower($7), tolower($5), tolower($6)) }' | sed 's/ /0/g'`
      channel_name=`cat $lamebase | grep -A 1 $lame_name | tail -n 1`
      alt_name=`echo "$line" | sed 's/:/ /g' | awk '{ if (NF>11) print substr($0, index($0,$12)) }'` 
      channel_name_logo=`echo $channel_name | sed 's/ //g'`
      channel_name_logo_male=`echo $channel_name_logo | tr A-Z a-z`
      echo "cp logos/$channel_name_logo_male.png picon/$picon_name" >> $cp
    fi
done < $bouquet