cd /github/autoUpdateMyPublicIP
echo "@$(TZ=Asia/Shanghai date "+%Y-%m-%d %H:%M:%S"): Updating My Public IP Address\n" > mypublicip.log
curl cip.cc >> mypublicip.log
echo "MyPublicIp: http://"$(head -n 3 mypublicip.log | awk '{for(i=1;i<=NF;i++) if($i~/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/) print $i}')":80  " > README.md

git config --global user.email "{Your Email Address}" >> mypublicip.log
git config --global user.name "{Your Github User Name}" >> mypublicip.log
git add README.md mypublicip.log >> mypublicip.log
git commit -m "Automatic push @$(TZ=Asia/Shanghai date "+%Y-%m-%d %H:%M:%S")" >> mypublicip.log
git fetch origin main >> mypublicip.log
git merge origin/main >> mypublicip.log
git push https://{Your Github Key}@github.com/{Your Github Account}/{Your Github Respository Name}.git main >> mypublicip.log
