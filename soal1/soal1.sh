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

awk -F '\t' -v x=${jawaban1b[0]} -v y={$jawaban1b[1]} -v z=$jawaban1a 'NR>1{ if($13 == z && ($11 == x || $11 == y)) array[$17]+=$21;}
END{
  for (i in array)
    print array[i] ":" i
}
' Sample-Superstore.tsv|LC_ALL=C sort -n| head -10 | awk -F':' '{print $1 " " $2}'
