# SoalShiftSISOP20_modul1_C02
### Kelompok 
- Feinard 05111840000144
- Ryan Danu Saputra 05111840000144

## Daftar Isi
1. [Pembahasan no 1](#1-pembahasan-no-1)
    - [1.1 Shell](#11-shell)
        - [1.5.1 Special Variable](#151-special-variable)
2. [Cron](#2-cron)
    - [2.1 Membuat atau mengubah cron jobs](#21-membuat-atau-mengubah-cron-jobs)
3. [AWK](#3-awk)
    - [3.1 Menjalankan Program AWK](#31-menjalankan-program-awk)

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
awk -F'\t' 'NR>1{
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

```
Dalam awk ini kita gunakan -F atau bisa disebut FS yang digunakan untuk membagi suatu line menjadi beberapa variable, kemudian dikarenakan adanya line pertama yang berisikan nama table maka kita dapat melakukan skip line dengan menggunakan NR>1. Saat dilakukan looping maka array yang bernama *insertname* akan ditambah nilainya, jika nama *insert $13name* sama maka nilainya akan ditambah. Kemudian saat end kita akan mendefinisi hasil yang digunakan untuk parameter nilai terkecil. Di;akukan loopinf for i in array yang berfungsi untuk mengecek apakah array yang dicek sudah habis kemudia menggunakan if array[i] < hasil kita gunakan untuk mencari *$13* terkecil. Kemudian datanya disimpan di kota dan dikeluarkan saat program telah selesai membaca array.
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
}' Sample-Superstore.tsv)

awk -F'\t' -v x=$jawaban1a 'NR>1{
  if( $13 == x ){
    array[$11]+=$21
  }
}
END{
  for (i in array)
    print array[i] ":"i
}
' Sample-Superstore.tsv |LC_ALL=C sort -n| head -2 | awk -F':' '{print $2}'
```
Pada no b digunakan hasil dari no a maka digunakan -v yang digunakan untuk mengeset variable dari tempat lainnya. Akan tetapi untuk daapt menghasilkan hasil no 1a digunakan echo dari hasil pertama. Dalam program ini digunakan jawaban1a yang digunakan untuk mendapatkan hasil dari awk 1a/  kemudian dilakukan pengecekan pada *$13* apakah *x* itu yang dimaksud maka digunakan array yang bernama *$11* untuk menjumlah profit.Kemudian pada END dilakukan hal yang sama untuk pengecekan. Akan tetapi dikarenakan output yang dimaksud ada 2 maka digunakan LC_ALL=c sort -n untuk melakukan sort berdasarkan hasil dari *array[i]*. Setelah itu untuk output 2 biji digunakan head -2 kemudian dikeluarkan dengan menggunakan awk baru kembali


#### 1. C
```#!/bin/bash
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


awk -F '\t' -v x=${jawaban1b[0]} -v y={$jawaban1b[1]} -v z=$jawaban1a 'NR>1{ if($13 == z && ($11 == x || $11 == y)) array[$17]+=$21;}
END{
  for (i in array)
    print array[i] ":" i
}
' Sample-Superstore.tsv|LC_ALL=C sort -n| head -10 | awk -F':' '{print $2}'
```

Untuk 1c dikarenakan output 1b maka digunakan array untuk mengetahui hasil pertama dan kedua pada saat menggunakan -v untuk deklarasi variable. Kemudian untuk loop digunakan perbandingan variable antara state dan region. Kemudian pada End digunakan output yang nantinya akan dicek pada LC_ALL=c sort-n dengan maksimum data dengan head-10 dan dikeluarkan dengan menggunakan awk baru

## Pembahasan no 2 
#### 2. A
#### 2. B
#### 2. C
#### 2. D


## Pembahasan no 3
#### 3. A
```
# !/bin/bash
for ((num=1; num<=28; num=num+1))
do
  wget -a wget.log -O pdkt_kusuma_$num "https://loremflickr.com/320/240/cat"
done
```
Sumber : https://www.geeksforgeeks.org/wget-command-in-linux-unix/

#### 3. B
```
5 6-14 * * sun-mon /bin/bash /home/danu/soal3a.sh >> wget.log
```
Sumber : https://jaranguda.com/menjalankan-bash-script-dengan-crontab/

#### 3. C

```
```
