#!bin/bash

keyDe=$(date -r "$1" "+%H")
v="$1"
tempFile_name=${v::-4}
case "$keyDe" in
  "0")
 nameFile=$(echo $tempFile_name | tr   )
  ;;
  "1")
 nameFile=$(echo $tempFile_name | tr '[b-zaB-ZA]''[a-zA-Z]')
  ;;
  "2")
 nameFile=$(echo $tempFile_name | tr '[c-za-bC-ZA-B]''[a-zA-Z]')
  ;;
  "3")
 nameFile=$(echo $tempFile_name | tr '[d-za-cD-ZA-C]''[a-zA-Z]')
  ;;
  "4")
 nameFile=$(echo $tempFile_name | tr '[e-za-dE-ZA-D]''[a-zA-Z]')
  ;;
  "5")
 nameFile=$(echo $tempFile_name | tr '[f-za-eF-ZA-E]''[a-zA-Z]')
  ;;
  "6")
 nameFile=$(echo $tempFile_name | tr '[g-za-fG-ZA-F]''[a-zA-Z]')
  ;;
  "7")
 nameFile=$(echo $tempFile_name | tr '[h-za-gH-ZA-G]''[a-zA-Z]')
  ;;
  "8")
 nameFile=$(echo $tempFile_name | tr '[i-za-hI-ZA-H]''[a-zA-Z]')
  ;;
  "9")
 nameFile=$(echo $tempFile_name | tr '[j-za-iJ-ZA-I]''[a-zA-Z]')
  ;;
  "10")
 nameFile=$(echo $tempFile_name | tr '[k-za-jK-ZA-J]''[a-zA-Z]')
  ;;
  "11")
 nameFile=$(echo $tempFile_name | tr '[l-za-kL-ZA-K]''[a-zA-Z]')
  ;;
  "12")
 nameFile=$(echo $tempFile_name | tr '[m-za-lM-ZA-L]''[a-zA-Z]')
  ;;
  "13")
 nameFile=$(echo $tempFile_name | tr '[n-za-mN-ZA-M''[a-zA-Z]')
  ;;
  "14")
 nameFile=$(echo $tempFile_name | tr '[o-za-nO-ZA-N]''[a-zA-Z]')
  ;;
  "15")
 nameFile=$(echo $tempFile_name | tr '[p-za-oP-ZA-O]''[a-zA-Z]')
  ;;
  "16")
 nameFile=$(echo $tempFile_name | tr '[q-za-pQ-ZA-P]''[a-zA-Z]')
  ;;
  "17")
 nameFile=$(echo $tempFile_name | tr '[r-za-qR-ZA-Q]''[a-zA-Z]')
  ;;
  "18")
 nameFile=$(echo $tempFile_name | tr '[s-za-rS-ZA-R]''[a-zA-Z]')
  ;;
  "19")
 nameFile=$(echo $tempFile_name | tr '[t-za-sT-ZA-S]''[a-zA-Z]')
  ;;
  "20")
 nameFile=$(echo $tempFile_name | tr '[u-za-tU-ZA-T]''[a-zA-Z]')
  ;;
  "21")
 nameFile=$(echo $tempFile_name | tr '[v-za-uV-ZA-U]''[a-zA-Z]')
  ;;
  "22")
 nameFile=$(echo $tempFile_name | tr '[w-za-vW-ZA-V]''[a-zA-Z]')
  ;;
  "23")
 nameFile=$(echo $tempFile_name | tr   '[x-za-wX-ZA-W]' '[a-zA-Z]')
  ;;
esac
mv $1 $nameFile.txt
