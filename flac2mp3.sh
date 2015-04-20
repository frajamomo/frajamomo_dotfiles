# This is needed to handle spaces in file names
OLDIFS=$IFS
IFS=$(echo -en "\n\b")

# MP3 bitrate in bits
bitrate=320000
# Overwrite existing MP3 files (-y for yes, blank for no)
overwrite=-y

cd $1
# Iterate on tracks
for i in *.flac
do
  newname=`basename $i flac`mp3
  ffmpeg  $overwrite -i $i -ab $bitrate -acodec mp2 $newname >& /dev/null
  rm $i
  echo "    "$newname
done
cd ..

IFS=$OLDIFS
