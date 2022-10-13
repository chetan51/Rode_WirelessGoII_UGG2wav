for i in *.wav;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  cDate="$(GetFileInfo -d "${name}.UGG")"
  echo "Created: $cDate"
  mDate="$(GetFileInfo -m "${name}.UGG")"
  echo "Modified: $mDate"
  ffmpeg -i "${i}" -ab 320k -map_metadata 0 -id3v2_version 3 "${name}".mp3;
  touch -r "${name}".UGG "${name}".mp3;
  SetFile -d "$cDate" -m "$mDate" "${name}.mp3"
done
