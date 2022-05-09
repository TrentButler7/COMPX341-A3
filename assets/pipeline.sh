if [ "$#" -ne 1 ]; then
    echo "Enter the commit message"
fi

npm install

if npm run build; then
	echo "Build Successful, Proceding to Commit/Push"
	git add *
	git commit -m $1
	git push origin master
	echo "Pushed Changes"
else
	echo "Build Failed, Exiting pipeline (5 seconds)"
	sleep 5
	exit
fi

npm run start
