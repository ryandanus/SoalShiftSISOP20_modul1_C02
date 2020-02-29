# SoalShiftSISOP20_modul1_C02
# Jawaban Telah Direvisi
### Kelompok 
- Feinard             05111840000081
- Ryan Danu Saputra   05111840000144

## Soal 1
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
sedikit berdasarkan hasil poin a
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
sedikit berdasarkan 2 negara bagian (state) hasil poin b

## Soal 2
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
tersebut cepat diselesaikan. Idenya adalah kalian 
(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka. 
(b) Password acak tersebut disimpan pada file berekstensi.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:
password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt
dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28,
maka akan menjadi huruf b.) dan 
(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

## Soal 3
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati
kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang
sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma,
kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing.

[a] Maka dari
itu, kalian mencoba membuat script untuk mendownload 28 gambar dari
"https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file
dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2,
pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam
sebuah file "wget.log".

Karena kalian gak suka ribet, kalian membuat penjadwalan untuk
menjalankan script download gambar tersebut. Namun, script download tersebut hanya
berjalan

[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu

Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan
gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma
sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar
identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda
antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke
Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan
selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan
kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. 

[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan
gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka
sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate
dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201).
Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan
dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253).
Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi
ekstensi ".log.bak". Hint : Gunakan wget.log untuk membuat location.log yang isinya
merupakan hasil dari grep "Location".


## Pembahasan no 1 
#### 1. A
```
#!/bin/bash
jawaban1a=$( awk -F'\t' 'NR>1{
  array[$13]+=$21
}
END{
  Hasil = 60000000
  for (i in array){
      if ( array[i] < Hasil ){
          Hasil = array[i]
          Kota = i
    }
  }
  print Kota
}' Sample-Superstore.tsv
)

echo $jawaban1a

jawaban1b=($( awk -F'\t' -v x=$jawaban1a 'NR>1{
  if( $13 == x ){
    array[$11]+=$21
  }
}
END{
  for (i in array)
    print array[i] ":"i
}
' Sample-Superstore.tsv |LC_ALL=C sort -n| head -2 | awk -F':' '{print $2}' ))

echo "${jawaban1b[0]}"
echo "${jawaban1b[1]}"

awk -F '\t' -v x=${jawaban1b[0]} -v y=${jawaban1b[1]} -v z=$jawaban1a 'NR>1{ if($13 == z && ($11 == x || $11 == y)) array[$17]+=$21;}
END{
  for (i in array)
    print array[i] ":" i
}
' Sample-Superstore.tsv|LC_ALL=C sort -n| head -10 | awk -F':' '{print $1 " " $2}'


```
Dalam awk ini kita gunakan -F atau bisa disebut FS yang digunakan untuk membagi suatu line menjadi beberapa variable,dikarenakan adanya line pertama yang berisikan nama table maka kita dapat melakukan skip line dengan menggunakan NR>1.
```
awk -F'\t' 'NR>1
```
 Saat dilakukan looping maka array yang bernama *insertname* akan ditambah nilainya, jika nama *insert $13name* sama maka nilainya akan ditambah.
 ```
 array[$13]+=$21
 ```
 
 Kemudian saat end kita akan mendefinisi hasil yang digunakan untuk parameter nilai terkecil.
 (disini dimisalkan nilai tersebut adalah 60000000)
```
 Hasil = 60000000
```
  
 Dilakukan looping for i in array yang berfungsi untuk mengecek apakah array yang dicek sudah habis kemudian menggunakan 
```
   for (i in array){
      if ( array[i] < Hasil ){
          Hasil = array[i]
          Kota = i
    }
```
untuk mencari *$13* terkecil. Kemudian datanya disimpan di kota dan dikeluarkan dengan 'print Kota' saat program telah selesai membaca array.

#### 1. B
```
#!/bin/bash
jawaban1a=$( awk -F'\t' 'NR>1{
  array[$13]+=$21
}
END{
  Hasil = 60000000
  for (i in array){
      if ( array[i] < Hasil ){
          Hasil = array[i]
          Kota = i
    }
  }
  print Kota
}' Sample-Superstore.tsv
)

echo $jawaban1a

jawaban1b=($( awk -F'\t' -v x=$jawaban1a 'NR>1{
  if( $13 == x ){
    array[$11]+=$21
  }
}
END{
  for (i in array)
    print array[i] ":"i
}
' Sample-Superstore.tsv |LC_ALL=C sort -n| head -2 | awk -F':' '{print $2}' ))

echo "${jawaban1b[0]}"
echo "${jawaban1b[1]}"

awk -F '\t' -v x=${jawaban1b[0]} -v y=${jawaban1b[1]} -v z=$jawaban1a 'NR>1{ if($13 == z && ($11 == x || $11 == y)) array[$17]+=$21;}
END{
  for (i in array)
    print array[i] ":" i
}
' Sample-Superstore.tsv|LC_ALL=C sort -n| head -10 | awk -F':' '{print $1 " " $2}'

```
Pada no 1 b digunakan hasil dari no a maka digunakan -v yang digunakan untuk mengeset variable dari tempat lainnya

Akan tetapi untuk dapat menghasilkan hasil no 1a digunakan echo dari hasil pertama. Dalam program ini, digunakan jawaban dari soal 1a untuk mendapatkan hasil dari awk 1a.
```
awk -F'\t' -v x=$jawaban1a 'NR>1
```

kemudian dilakukan pengecekan pada *$13* apakah *x* itu yang dimaksud maka digunakan array yang bernama *$11* untuk menjumlah profit.
```
 if( $13 == x ){
    array[$11]+=$21
  }
}
```
Kemudian pada End digunakan output yang nantinya akan dicek pada 
LC_ALL=c sort-n dengan maksimum data dengan head-2
```
|LC_ALL=C sort -n| head -10
```
dan dikeluarkan dengan menggunakan awk baru
```
awk -F':' '{print $2}'
```
#### 1. C
```
#!/bin/bash
jawaban1a=$( awk -F'\t' 'NR>1{
  array[$13]+=$21
}
END{
  Hasil = 60000000
  for (i in array){
      if ( array[i] < Hasil ){
          Hasil = array[i]
          Kota = i
    }
  }
  print Kota
}' Sample-Superstore.tsv
)

echo $jawaban1a

jawaban1b=($( awk -F'\t' -v x=$jawaban1a 'NR>1{
  if( $13 == x ){
    array[$11]+=$21
  }
}
END{
  for (i in array)
    print array[i] ":"i
}
' Sample-Superstore.tsv |LC_ALL=C sort -n| head -2 | awk -F':' '{print $2}' ))

echo "${jawaban1b[0]}"
echo "${jawaban1b[1]}"

awk -F '\t' -v x=${jawaban1b[0]} -v y=${jawaban1b[1]} -v z=$jawaban1a 'NR>1{ if($13 == z && ($11 == x || $11 == y)) array[$17]+=$21;}
END{
  for (i in array)
    print array[i] ":" i
}
' Sample-Superstore.tsv|LC_ALL=C sort -n| head -10 | awk -F':' '{print $1 " " $2}'
```

Untuk 1c, dikarenakan output 1b maka digunakan array untuk mengetahui hasil pertama dan kedua pada saat menggunakan -v untuk deklarasi variable.
```
awk -F '\t' -v x=${jawaban1b[0]} -v y=${jawaban1b[1]} -v z=$jawaban1a 'NR>1{ if($13 == z && ($11 == x || $11 == y)) array[$17]+=$21;}
```

Kemudian untuk loop digunakan perbandingan variable antara state dan region. 
```
  for (i in array)
    print array[i] ":" i
```
Kemudian pada End digunakan output yang nantinya akan dicek pada 
LC_ALL=c sort-n dengan maksimum data dengan head-10
```
|LC_ALL=C sort -n| head -10 
```
dan dikeluarkan dengan menggunakan awk baru

```
awk -F':' '{print $1 " " $2}'
```
Berikut adalah hasil dari ketiga soal yang dimaksud:
![Screenshot from 2020-02-29 19-38-11](https://user-images.githubusercontent.com/58687783/75607574-19099080-5b2b-11ea-8f09-ee670812dc9c.png)


## Pembahasan no 2 
#### 2.

```
#!bin/bash

Password=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
v="$1"
tempFile_name=${v::-4}
if [[ $tempFile_name =~ [0-9] ]]
  then
  fixFile_name=${tempFile_name//[0-9]/}
else
  fixFile_name=$tempFile_name
fi
now=`date +"%H"`;
case "$now" in
  "0")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[a-zA-Z]')
  ;;
  "1")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[b-zaB-ZA]')
  ;;
  "2")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[c-za-bC-ZA-B]')
  ;;
  "3")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[d-za-cD-ZA-C]')
  ;;
  "4")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[e-za-dE-ZA-D]')
  ;;
  "5")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[f-za-eF-ZA-E]')
  ;;
  "6")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[g-za-fG-ZA-F]')
  ;;
  "7")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[h-za-gH-ZA-G]')
  ;;
  "8")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[i-za-hI-ZA-H]')
  ;;
  "9")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[j-za-iJ-ZA-I]')
  ;;
  "10")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[k-za-jK-ZA-J]')
  ;;
  "11")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[l-za-kL-ZA-K]')
  ;;
  "12")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[m-za-lM-ZA-L]')
  ;;
  "13")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[n-za-mN-ZA-M')
  ;;
  "14")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[o-za-nO-ZA-N]')
  ;;
  "15")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[p-za-oP-ZA-O]')
  ;;
  "16")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[q-za-pQ-ZA-P]')
  ;;
  "17")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[r-za-qR-ZA-Q]')
  ;;
  "18")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[s-za-rS-ZA-R]')
  ;;
  "19")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[t-za-sT-ZA-S]')
  ;;
  "20")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[u-za-tU-ZA-T]')
  ;;
  "21")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[v-za-uV-ZA-U]')
  ;;
  "22")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[w-za-vW-ZA-V]')
  ;;
  "23")
    nameFile=$(echo $fixFile_name | tr '[a-zA-Z]' '[x-za-wX-ZA-W]')
  ;;
esac
echo $Password > $nameFile.txt
echo "Real Name is: $fixFile_name" >> $nameFile.txt
echo "Build in: " $(date +"%H:%M") >> $nameFile.txt
```

untuk no 2, digunakan 2 aplikasi untuk melakukan encoding dan melakukan decoding (permintaan soal no 2d).
Pada soal encoding pertama dilakukan randomizer 28 huruf besar,kecil,dan angka. Maka variable Password digunakan untuk melakukan randomizer. pada linux terdapat modul yang dapat digunakan untuk randomizer yaitu \
```
/dev/urandom.
```
```
Password=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
```
Kemudian digunakan tr-dc yang digunakan untuk pembagi ascii yang akan dipakai. Pada program ini digunakan huruf besar kecil dan angka maka digunakan *azA-Z0_9* sebagai deklarasi randomizernya. Setelah itu digunakan fold -w yang digunakan untuk membatasi char yang dipakai. Dan head yang digunakan untuk output satu 28char sebagai password. Jika ingin 2 password maka tinggal diganti headnya.
Kemudian digunakan variable untuk menyimpas *$1* dikarenakan adanya .txt pada *$1*.

```
v="$1"
```
Sehingga dilakukan penghapusan .txt pada tempFile_name dengan *codetemptfileline5* dengan ::-4 sebagai penghapus .txt yang ada.
```
tempFile_name=${v::-4}
```
Kemudian dilakukan pengecekan jika  terdapat angka ada, maka dihapus angka yang ada. Jika tidak, maka dilanjutkan programnya. 
```
if [[ $tempFile_name =~ [0-9] ]]
  then
  fixFile_name=${tempFile_name//[0-9]/}
else
  fixFile_name=$tempFile_name
fi
```
Kemudian diambil jam yang ada didalam sistem,dengan menggunakan 

```
now=`date +"%H"`;
```

Setelah itu digunakan jamnya untuk melakukan encoding namafilenya. Sebenarnya ada cara yang lebih simple untuk melakukan encoding, akan tetapi program ini menggunakan case tertentu karena hanya 24 jam,sehingga mudah dilakukan case tanpa perlu looping/program advance lainnya. Dilakukanlah pengecekan time case jika 1 maka a menjadi b,b menjadi c, dan seterusnya. 

Oleh karena itu dapat digunakan tr yang digunakan untuk mengubah a menjadi paramater yang diinginkan.
Pada program

```
tr'[a-zA-Z]' '[b-zaB-ZA]' 
```

digunakan untuk membuat a menjadi b dan seterusnya. akan tetapi ada program bisa dilihat bahwa ketika mencapai x yaitu z,maka z harus kembali ke a. Sehingga pada 2nd parameter saat ingin mendapatkan hasil z digunakan b-za yang berfungsi untuk mengembalikan z menjadi a. sehingga, jika jam adalah 2 ketika kita ingin mendapatkan hasil encoding z maka yang didapat adalah b. Didalam paramater ini juga dapat digunakan huruf besar sehingga langsung diberikan disamping a-z menjadi a-zA-Z.

Setelah case selesai maka dikeluarkan echo password, nama aslinya(optional) ,dan tanggalnya(opsional) kedalam namafile.ext yang telah diencode
```
esac
echo $Password > $nameFile.txt
echo "Real Name is: $fixFile_name" >> $nameFile.txt
echo "Build in: " $(date +"%H:%M") >> $nameFile.txt
```

Maka contoh hasil output dari file yang dimaksud adalah:
![Screenshot from 2020-02-29 19-42-54](https://user-images.githubusercontent.com/58687783/75607631-c5e40d80-5b2b-11ea-8dc8-a21f6880241f.png)

#### 2. D
```
#!bin/bash

#!bin/bash
keyDe=$(date -r "$1" "+%H")
v="$1"
tempFile_name=${v::-4}
case "$keyDe" in
  "0")
 nameFile=$(echo $tempFile_name | tr  '[a-zA-Z]' '[a-zA-Z]' )
  ;;
  "1")
 nameFile=$(echo $tempFile_name | tr '[b-zaB-ZA]' '[a-zA-Z]')
  ;;
  "2")
 nameFile=$(echo $tempFile_name | tr '[c-za-bC-ZA-B]' '[a-zA-Z]')
  ;;
  "3")
 nameFile=$(echo $tempFile_name | tr '[d-za-cD-ZA-C]' '[a-zA-Z]')
  ;;
  "4")
 nameFile=$(echo $tempFile_name | tr '[e-za-dE-ZA-D]' '[a-zA-Z]')
  ;;
  "5")
 nameFile=$(echo $tempFile_name | tr '[f-za-eF-ZA-E]' '[a-zA-Z]')
  ;;
  "6")
 nameFile=$(echo $tempFile_name | tr '[g-za-fG-ZA-F]' '[a-zA-Z]')
  ;;
  "7")
 nameFile=$(echo $tempFile_name | tr '[h-za-gH-ZA-G]' '[a-zA-Z]')
  ;;
  "8")
 nameFile=$(echo $tempFile_name | tr '[i-za-hI-ZA-H]' '[a-zA-Z]')
  ;;
  "9")
 nameFile=$(echo $tempFile_name | tr '[j-za-iJ-ZA-I]' '[a-zA-Z]')
  ;;
  "10")
 nameFile=$(echo $tempFile_name | tr '[k-za-jK-ZA-J]' '[a-zA-Z]')
  ;;
  "11")
 nameFile=$(echo $tempFile_name | tr '[l-za-kL-ZA-K]' '[a-zA-Z]')
  ;;
  "12")
 nameFile=$(echo $tempFile_name | tr '[m-za-lM-ZA-L]' '[a-zA-Z]')
  ;;
  "13")
 nameFile=$(echo $tempFile_name | tr '[n-za-mN-ZA-M]' '[a-zA-Z]')
  ;;
  "14")
 nameFile=$(echo $tempFile_name | tr '[o-za-nO-ZA-N]' '[a-zA-Z]')
  ;;
  "15")
 nameFile=$(echo $tempFile_name | tr '[p-za-oP-ZA-O]' '[a-zA-Z]')
  ;;
  "16")
 nameFile=$(echo $tempFile_name | tr '[q-za-pQ-ZA-P]' '[a-zA-Z]')
  ;;
  "17")
 nameFile=$(echo $tempFile_name | tr '[r-za-qR-ZA-Q]' '[a-zA-Z]')
  ;;
  "18")
 nameFile=$(echo $tempFile_name | tr '[s-za-rS-ZA-R]' '[a-zA-Z]')
  ;;
  "19")
 nameFile=$(echo $tempFile_name | tr '[t-za-sT-ZA-S]' '[a-zA-Z]')
  ;;
  "20")
 nameFile=$(echo $tempFile_name | tr '[u-za-tU-ZA-T]' '[a-zA-Z]')
  ;;
  "21")
 nameFile=$(echo $tempFile_name | tr '[v-za-uV-ZA-U]' '[a-zA-Z]')
  ;;
  "22")
 nameFile=$(echo $tempFile_name | tr '[w-za-vW-ZA-V]' '[a-zA-Z]')
  ;;
  "23")
 nameFile=$(echo $tempFile_name | tr '[x-za-wX-ZA-W]' '[a-zA-Z]')
  ;;
esac
mv $1 $nameFile.txt

```
untuk decode digunakan algo yang mirip dengan encode. Pertama dengan cara membaca tanggal dibuatnya file itu, hal itu dapat digunakan dengan date -r namafile fungsi . Sehingga didapatkan jam pada saat file dibuat
```
keyDe=$(date -r "$1" "+%H")
```
Kemudian diambil kembali pembacaan nama file yang dimaksud dan dibuang ekstensinya(.txt)
```

v="$1"
tempFile_name=${v::-4}
```

kemudian dengan time yang ada digunakan case untuk decrypt data 

```
case "$keyDe" in
```
tetapi untuk melakukan decrypt saat digunakan tr, dari char a-z diganti dengan variable enkripsi. Misalkan jika jam adalah 1 maka char a-z diganti dengan b-za
``` 
nameFile=$(echo $tempFile_name | tr '[b-zaB-ZA]' '[a-zA-Z]')
```
kemudian outputnya namefile digunakan untuk menggunakan command linux mv untuk mengganti nama yang diencrypt menjadi nama asalnya

```
mv $1 $nameFile.txt
```
Maka file akan kembali seperti ini:
![Screenshot from 2020-02-29 19-45-22](https://user-images.githubusercontent.com/58687783/75607663-16f40180-5b2c-11ea-873c-b42d650b6bd8.png)

## Pembahasan no 3
#### 3. A
```
# !/bin/bash
for ((num=1; num<=28; num=num+1))
do
  wget -a wget.log -O pdkt_kusuma_$num "https://loremflickr.com/320/240/cat"
done
```
Fungsi wget diatas berfungsi untuk mendownload sebuah weppage

-a wget.log 
Opsi ini digunakan untuk mengarahkan semua pesan yang dihasilkan oleh sistem ke file log yang ditentukan oleh opsi dan ketika proses selesai semua pesan yang dihasilkan tersedia dalam file log. Jika tidak ada file log yang ditentukan, maka pesan output akan dialihkan ke file log default yaitu wget -log

-O pdkt_kusuma_$num "https://loremflickr.com/320/240/cat"
untuk mengganti nama menjadi nama file menjadi "pdkt_kusuma_NO"

untuk mendapatkan ke 28 gambar dilooping sebanyak 28 kali menggunakan perulangan for
Sumber : https://www.geeksforgeeks.org/wget-command-in-linux-unix/

Contoh Hasil dari wget ini:


![Screenshot from 2020-02-29 19-47-58](https://user-images.githubusercontent.com/58687783/75607701-7ce08900-5b2c-11ea-87d5-622685b227b3.png)

#### 3. B
```
5 6-23/8 * * 1-5,7 /bin/bash /home/danu/praktikum1-3a.sh >> wget.log
```
“At minute 5 past every 8th hour from 6 through 23 on every day-of-week from Monday through Friday and Sunday.”

Sumber : https://jaranguda.com/menjalankan-bash-script-dengan-crontab/

#### 3. C

```
#!/bash/bin

ls -v > temp.log
grep -r "Location" wget.log >> location.log
grep -r "pdkt" temp.log >> name.log
readarray line < location.log
readarray filename < name.log
for ((i=0;i<28;i++))
  do
    a=${line[$i]}
    array[$i]=$a
    flag=0
    for ((j=0;j<i;j++))
    do
      if [[ "${array[$j]}" = "${array[$i]}" ]]
      then
        let flag++
      fi
    done
    if [[ "$flag" -gt 0 ]]
    then
      cd /home/feinard/Praktikum/.duplicate
      temp=1
      if [[ -e "duplicate_$temp" ]]
      then
        while [[ -e "duplicate_$temp" ]] ;
          do
            let  temp++
          done
          name=duplicate_$temp
      else
        name="duplicate_1"
      fi
      echo "$name"
      cd -
      a="${filename[$i]}"
      a="${a//[$'\n\r ']}"
      echo $a
      mv $a $name
      echo "MOVING DUPLICATE"
      mv "$name" /home/feinard/Praktikum/.duplicate
    elif [[ "$flag" -eq 0 ]]
    then
      cd /home/feinard/Praktikum/.kenangan
      temp=1
      if [[ -e "kenangan_$temp" ]]
        then
          while [[ -e "kenangan_$temp" ]] ;
            do
              let  temp++
            done
          name="kenangan_$temp"
      else
        name="kenangan_1"
      fi
      echo "$name"
      cd -
      b="${filename[$i]}"
      b="${b//[$s'\n\r ']}"
      echo $b
      mv $b $name
      echo "MOVING KENANGAN"
      mv "$name" /home/feinard/Praktikum/.kenangan
    fi
  done
cat location.log >> backup.log.bak
cat wget.log >> backup.log.bak
rm name.log
rm temp.log
rm wget.log
rm location.log
```
Dalam program ini digunakan pembacaan file yang ada dikarenakan diketahui bahwa pdkt berurutan sehingga saat dibentuk dilakukan secara berurutan (hal ini sama dengan wget.log)
```
ls -v > temp.log
```
kemudian diperlukan pembagian data dikarenakan data yang dikeluarkan pada saat menggunakan wget -a ini berupa hasi dari proses wget. Oleh karena itu diperlukan pembagian untuk membaca location data. Dengan grep -r kita dapat membagi hasil bedasarkan string yang mirip dalam line wget. Setelah itu dimasukan datanya kedalam locationlog(nama filenya bebas)
```
grep -r "Location" wget.log >> location.log
```
kemudian untuk memastikan nama file yang ada pada folder foto hanya pdkt saja dilakukan grep yang sama
```
grep -r "pdkt" temp.log >> name.log
```
Setelah itu digunakan readarray yang berfungsi untuk membaca setiap line dalam file menjadi array
```
readarray line < location.log
readarray filename < name.log
```
dikarenakan Filenya hanya 28, dilakukan looping. Apabila file lebih dari 28 maka dapat dilakukan read dan dibuat constrain sesuai input yang dimaksud
Setelah itu dilakukan deklarasi array dengan a dan array. a disini dimaksud untuk menyimpan isi dari line location yang di interasi. Sedangkan array dengan iterasi (contohnya array pertama) diberi isi a atau iterasi dari line location
```
 a=${line[$i]}
 array[$i]=$a
```
Kemudian dilakukan loop untuk mengecek apakah array yang sudah ada memiliki link yang sama dengan array link baru.
Didalam code ini digunakan flag yang bertujuan untuk pengecekan apakah array iterasi yang berisi line location sama dengan array baru yang berisi line location yang sedang diiterasi
 ```
 for ((j=0;j<i;j++))
 do
  if [[ "${array[$j]}" = "${array[$i]}" ]]
  then
  let flag++
 done
 ```
 Jika ditemukan file foto yang sama maka flag akan lebih dari satu. 
 Oleh karena itu dimasukan kedalam duplicate
 ketika program ini berjalan kita harus mengecek apakah directori ./duplicate berisi foto atau tidak
 ```
 if [[ "$flag" -gt 0 ]]
    then
      cd /home/feinard/Praktikum/.duplicate
 ```
 kemudian dilakukan iterasi untuk pengecekan angka file berikutnya
 ```
 temp=1
      if [[ -e "duplicate_$temp" ]]
      then
        while [[ -e "duplicate_$temp" ]] ;
          do
            let  temp++
          done
          name=duplicate_$temp
      else
        name="duplicate_1"
      fi
 ```
 
 setelah itu jika terdapat file yang sama file tersebut akan dipindah kedalam file duplicate
 ```
 cd -
      a="${filename[$i]}"
      a="${a//[$'\n\r ']}"
      mv $a $name
      echo "MOVING DUPLICATE"
      mv "$name" /home/feinard/Praktikum/.duplicate
```
karena file yang sama sudah dipindah dan tersisa hanya file-file berbeda yang disimpan setiap 28 foto maka file itu dipindah kedalam folder .kenangan
```
elif [[ "$flag" -eq 0 ]]
    then
      cd /home/feinard/Praktikum/.kenangan
      temp=1
      if [[ -e "kenangan_$temp" ]]
        then
          while [[ -e "kenangan_$temp" ]] ;
            do
              let  temp++
            done
          name="kenangan_$temp"
      else
        name="kenangan_1"
      fi
      cd -
      b="${filename[$i]}"
      b="${b//[$s'\n\r ']}"
      mv $b $name
      echo "MOVING KENANGAN"
      mv "$name" /home/feinard/Praktikum/.kenangan
    fi
```
selesai , namun karena name.log dan temp.log , location.log sudah tidak digunakan dan tidak perlu kita simpan kita hapus file tersebut dengan menggunakan rm

```
rm name.log
rm temp.log
rm wget.log
rm location.log
```


