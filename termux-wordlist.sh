#!/bin/bash
clear
kucukad=$(sed -n 1p README.md)
buyukad=$(sed -n 2p README.md)
#################### GÜNCELLEME TARİHİ EKLEME ####################
if [[ $1 == güncelle || $1 == güncelleme ]];then
	echo
	echo
	echo
	printf "\e[33mSON GÜNCELLEME TARİHİ \e[31m>\e[0m $(sed -n 3p README.md |tr -d \"Güncelleme\")"
	echo
	echo
	echo
	history -s $(date +%d.%m.%G)
	history -s $(sed -n 3p README.md |tr -d "Güncelleme")
	read -e -p $'\e[32mTARİH GİRİNİZ \e[31m>\e[0m ' tarih
	echo
	echo
	songuncelleme=$(sed -n 3p README.md |tr -d "Güncelleme ")
	sed -ie "s/$songuncelleme/$tarih/g" $kucukad.sh
	songuncelleme2=$(sed -n 3p README.md |tr -d "Güncelleme ")
	sed -ie "s/$songuncelleme2/$tarih/g" README.md
	echo
	echo
	echo
	printf "\e[32m[*]\e[0m TARİH GÜNCELLENDİ "
	echo
	echo
	if [[ -a $kucukad.she ]];then
		rm $kucukad.she
	fi
	if [[ -a README.mde ]];then
		rm README.mde
	fi
	exit

fi
#################### OTOMATİK GÜNCEKLEME ####################

guncelleme=$(curl -s "https://github.com/termux-egitim/$buyukad" |grep -o 16.09.2020)
readme=$(sed -n 3p README.md |tr -d "Güncelleme ")
if [ "$guncelleme" = "$readme" ];then
	echo
else
	kontrol=$(curl -s https://github.com/termux-egitim/$kucukad |grep -o not-found |wc -w)
	if [[ $kontrol == 0 ]];then
		echo
	else
		echo
		echo
		echo
		printf "\e[31m[!]\e[0m$buyukad GÜNCELLEME YAPILAMIYOR \e[31m!!!\e[0m"
		echo
		echo
		echo
		echo
		sleep 2
		printf "\e[31m[!]\e[0m $buyukad DEPOSU BULUNAMADI \e[31m!!!\e[0m"
		echo
		echo
		exit
	fi

	echo
	echo
	echo
	printf "\e[32m[*]\e[0m $buyukad GÜNCELLENİYOR "
	echo
	echo
	echo
	sleep 2
	rm -rf *
	rm -rf .git
	git clone https://github.com/termux-egitim/$kucukad
	cd $kucukad
	mv * ../
	mv .git ../
	cd ..
	rm -rf $kucukad
	bash $kucukad.sh
fi
cd files
bash banner.sh
if [[ -a ../wordlist.txt ]];then
	echo
	echo
	echo
	printf "\e[33m[*] \e[0mKAYITLI WORDLİST.TXT BULUNDU"
	echo
	echo
	echo
	read -e -p $'KAYITLI WORDLİST.TXT SİLİNSİN Mİ \e[33m[\e[32m EVET\e[33m/\e[31mHAYIR\e[33m ] \e[31m>> \e[0m' sec
	echo
	echo
	echo
	if [[ $sec == e || $sec == E || $sec == evet || $sec == EVET ]];then
		rm ../wordlist.txt
		echo
		echo
		echo
		printf "\e[32m[*]\e[0m KAYITLI WORDLİST.TXT SİLİNDİ"
		echo
		echo
		echo
		sleep 1
		printf "\e[32m[*]\e[0m YENİ WORDLİST.TXT OLUŞTURULUYOR"
		echo
		echo
		echo
	elif [[ $sec == h || $sec == H || $sec == hayır || $sec == HAYIR ]];then
		echo
		echo
		echo
		printf "\e[31m[*]\e[0m KAYITLI WORDLİST.TXT SİLİNMEDİ"
		echo
		echo
		echo
		sleep 1
		printf "\e[31m[*]\e[0m ÇIKIŞ YAPILDI"
		echo
		echo
		echo
		exit
	else
		echo
		echo
		echo
		printf "\e[31m[!]\e[0m HATALI SEÇİM \e[31m!!!\e[0m"
		echo
		echo
		echo
		sleep 2
		bash termux-wordlist.sh
	fi
fi
read -e -p $'\e[0m AD \e[31m>>\e[92m ' ad
echo
printf "\e[32m[*]\e[0m $ad"
echo
echo
read -e -p $' SOYAD \e[31m>>\e[92m ' soyad
echo
printf "\e[32m[*]\e[0m $soyad"
echo
echo
read -e -p $' ŞEHİR \e[31m>> \e[92m' sehir
echo
printf "\e[32m[*]\e[0m $sehir"
echo
echo
read -e -p $' MEMLEKET \e[31m>> \e[92m' memleket
echo
printf "\e[32m[*]\e[0m $memleket"
echo
echo
read -e -p $' ŞEHİR PLAKA \e[31m>> \e[92m' splaka
echo
printf "\e[32m[*]\e[0m $splaka"
echo
echo
read -e -p $' MEMLEKET PLAKA \e[31m>> \e[92m' mplaka
echo
printf "\e[32m[*]\e[0m $mplaka"
echo
echo
read -e -p $' YIL \e[31m>> \e[92m' yil
echo
printf "\e[32m[*]\e[0m $yil"
echo
echo
read -e -p $' DOĞUM YIL \e[31m>> \e[92m' dogumyil
echo
printf "\e[32m[*]\e[0m $dogumyil"
echo
echo
read -e -p $' DOĞUM AY \e[31m>> \e[92m' dogumay
echo
printf "\e[32m[*]\e[0m $dogumay"
echo
echo
read -e -p $' DOĞUM GUN \e[31m>> \e[92m' dogumgun
echo
printf "\e[32m[*]\e[0m $dogumgun"
echo
echo
read -e -p $' TUTTUĞU TAKIM \e[31m>> \e[92m' takim
echo
printf "\e[32m[*]\e[0m $takim"
echo
echo
read -e -p $' KISALTILMIŞ TUTTUĞU TAKIM ADI\e[31m >> \e[92m' ktakim
echo
printf "\e[32m[*]\e[0m $ktakim"
echo
echo
read -e -p $' TAKIM YIL \e[31m>>\e[92m ' tyil
echo
printf "\e[32m[*]\e[0m $tyil"
echo
echo
printf "
ad=$ad
soyad=$soyad
sehir=$sehir
memleket=$memleket
splaka=$splaka
mplaka=$mplaka
yil=$yil
dogumyil=$dogumyil
dogumay=$dogumay
dogumgun=$dogumgun
takim=$takim
ktakim=$ktakim
tyil=$tyil
" > output.txt
bash ad.sh
bash soyad.sh
bash sehir.sh
bash memleket.sh
bash splaka.sh
bash mplaka.sh
bash yil.sh
bash dogumyil.sh
bash dogumay.sh
bash dogumgun.sh
bash takim.sh
bash ktakim.sh
bash tyil.sh
cd ..
cat wordlistt.txt |grep -o [A-Z.a-z.-sh.-ı-]\* > wordlist.txt
rm wordlistt.txt
printf "\e[32m
[✓] \e[33m$(cat wordlist.txt |wc -l) \e[0mADET ŞİFRELİ WORDLİST.TXT OLUŞTURULDU"
echo
echo
echo
