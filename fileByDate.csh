#!/bin/csh -f

set outDir="/Users/dougal/safe/photos"

set list=`ls *.CR2`
foreach file( $list )
  set bits=`strings $file|grep 2025`
  set dAte=`echo $bits[1]|sed -e s%\:%.%g -e s%2025%25%`

  set dir="$outDir/$dAte"
  if( ! -e $dir )mkdir $dir/

  if( ! -e $dir/$file )then
    echo "mv $file $dir/"
    mv $file $dir/
  endif
end

