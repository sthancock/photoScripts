#!/bin/csh -f


set list="/tmp/photList.$$.tmp"
set outDir="/Users/dill/safe/photos/iPhone"
#set outDir="/Volumes/reno/safe/photos/iPhone"


set endList="JPG MOV MP4"

foreach ending( $endList )

  ls -l *.$ending|gawk '(NF>2){print $NF,$5}' > $list
  @ nFiles=`wc -l` < $list


  @ i=1
  while( $i <= $nFiles )
    set bits=`gawk -v i=$i '{if(i==NR)for(j=1;j<=NF;j++)print $j}'` < $list

    set file="$bits[1]"
    @ size=$bits[2]
    set testFile="$outDir/$file"

    @ newSize=`ls -l $testFile|gawk '{print int($5)}'`

    if( $newSize == $size )then
      echo "$file $newSize $size"
      rm $file
    endif

    @ i++
  end


  if( -e $list )rm $list
end

