#!/bin/csh -f

set list="/tmp/copyList.$$.dat"
set endings="JPG HEIC"


foreach ending( $endings )
  ls -l IMG_????\ 2.$ending|gawk ending="$ending" '{x=split();if($NF==ending)printf() $i}' > $list

  @ nFiles=`wc -l` < $list
  @ i=1
  while( $i <= $nFiles )
    set file=`gawk -v i=$i '{if(i==NR)print $1}'` < $list

    set subList=`ls "$file:r\ *.$ending"`

    foreach sub( $subList )
      echo $sub
    end

    @ i++
  end
end

