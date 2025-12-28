#!/bin/csh -f

set endingList="JPG HEIC JPEG jpeg"
set startingList="IMG_"

foreach starter( $startingList )
  foreach ending( $endingList )

    set list=`ls $starter????.$ending $starter?????.$ending`
    foreach file( $list )
      set dateLine=`strings $file|gawk -F: '(NF==5){if($1!="=")print $0}'`
      set dAte=`echo $dateLine[1]|sed -e s%\:%.%g -e s%20%%`
      set newName="$dAte.$file"

      if( ! -e $newName )then
        echo "$newName"
        mv $file $newName
      else
        echo "$newName already ehere"
      endif
    end
  end
end



#set endingList="MOV"
#set startingList="IMG_"
#
#foreach starter( $startingList )
#  foreach ending( $endingList )
#
#    set list=`ls $starter????.$ending`
#    foreach file( $list )
#      set dateLine=`strings $file| gawk -F- '(NF==3){print $0}' | gawk -F: '(NF==3){print $0}'`
#      set dAte=`echo $dateLine[1]|sed -e s%\:%.%g -e s%20%%`
#      set newName="vid.$dAte.$file"
#
#      if( ! -e $newName )then
#        echo "$newName"
#        mv $file $newName
#      else
#        echo "$newName already ehere"
#      endif
#    end
#  end
#end

