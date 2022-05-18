if [ "$#" -ne 1 ]; then
    echo "Enter the commit message"
fi

find .. -type f -name '*.ts' -exec sed -i '/** Trent Butler 1522993 /d' {} \;
find .. -type f -name '*.ts' -exec sed -i '1i /** Trent Butler 1522993 */' {} \;

npm install

if npm run build; then
	echo "Build Successful, Proceding to Commit/Push"
	git add *
	git commit -m "$1"
	if git push origin master; then
		echo "Pushed Changes"
	fi
else
	echo "Build Failed, Exiting pipeline (5 seconds)"
	sleep 5
	exit
fi

npm run start