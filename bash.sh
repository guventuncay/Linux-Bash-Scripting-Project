#!/bin/sh
while [ 1 ]
do
var=$(zenity --list \
--height=250 \
--title="Guvenx Bash App" \
--text="Yapmak istediğiniz işlem türünü seçiniz.." \
--column="İşlem Adı" --column="Açıklama" \
Ekle "Yeni bir kullanıcı ekle." \
Ara "Bir kullanıcı ara." \
Listele "Tüm kullanıcıları listele." \
Sil "Bir kullanıcıyı sil." \
Çıkış "Programı sonlandır.")

echo "var = $var"

if [ $var == "Ekle" ]
then
	input=$(zenity --entry --title="Yeni kullanıcı ekle." --text="Yeni kullanıcı adını giriniz.")
	echo $input >> users.txt
	zenity --info --width=400 --height=200 --text="$input adlı kullanıcı eklendi."
elif [ $var == "Ara" ]
then
	input=$(zenity --entry --title="Bir kullanıcı ara." --text="Aramak istediğiniz kullanıcı adını giriniz.")
	res=$(cat users.txt | grep -w $input)
	if [ ! -z "$res" ]
	then
	zenity --info --width=400 --height=200 --text "$input adlı kullanıcı mevcut."
	else
	zenity --info --width=400 --height=200 --text "$input adlı kullanıcı mevcut değil."
	fi
elif [ $var == "Listele" ]
then
	list=$(cat users.txt)
        zenity --text-info --filename=users.txt
elif [ $var == "Sil" ]
then
        input=$(zenity --entry --title="Bir Kullanıcı sil" --text="Silmek istediğiniz kullanıcı adını giriniz.")

        res=$(cat users.txt | grep -w $input)
        while [ -z "$res" ]
        do
        	input=$(zenity --entry --title="Bir Kullanıcı sil" --text="Mevcut bir kullanıcı adı giriniz.")
        done
	sed -i "/$input/d" users.txt
	zenity --info --width=400 --height=200 --text="$input adlı kullanıcı silindi."
elif [ $var == "Çıkış" ]
then
	echo "ÇIKIŞ"
break
fi
done
