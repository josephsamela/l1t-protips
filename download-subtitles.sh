
rm urls.txt

playlists=(
	"https://www.youtube.com/watch?v=C6jCZ40TBWY&list=PL10NWKboioZT3DVUOP8O9nnFGPiGfsSxG" # 2020
	"https://www.youtube.com/watch?v=4mQVvRUTRKA&list=PL10NWKboioZRC4Xrh9-fhheqW_zIvuVOb" # Holiday Specials
	"https://www.youtube.com/watch?v=6SBdRw1Wldk&list=PL10NWKboioZRDWeHRrve_6y3zmpFn8po7" # 2019
	"https://www.youtube.com/watch?v=XbvTBfew9zE&list=PL10NWKboioZQP509jmYthRRfB1maQZo0D" # 2018
	"https://www.youtube.com/watch?v=dphGwXgyWI8&list=PL10NWKboioZSsQ1uGg3acV2W7f-Vje7uX" # 2017
	"https://www.youtube.com/watch?v=4XnSmWWqe6M&list=PL10NWKboioZSYYd_kN9zh5duMmvBNKba_" # 2016
)

# Get urls of every video
for i in "${playlists[@]}"
do
	`youtube-dl -j --flat-playlist "$i" | jq -r '.id' | sed 's_^_https://youtu.be/_' >> urls.txt`
done

# Download subtitles from every video
while read url; do
  youtube-dl --cookies="./cookies.txt" --retries 3 --write-sub --write-auto-sub --sub-lang en --skip-download $url -o "subs/%(id)s.%(ext)s"
done <urls.txt
