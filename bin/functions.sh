function getSettings(){
	SETTINGS=
	CONT=0

	while [ true ];
	do
		SETTINGS=`etcdctl --endpoints=$SETTINGS_URL get $APP_NAME | tail -n +2`
	
		if [ -z "$SETTINGS" ]; then
			sleep 1	
		
			if [ $CONT == 0 ]; then
				CONT=1
			fi
		else
			break
		fi
	done

	echo $SETTINGS
}