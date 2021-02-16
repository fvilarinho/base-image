function getEnv {
   KEY=$1
   VALUE=`cat $ETC_DIR/.env | grep "$KEY" | cut -d'=' -f2`
   
   echo "$VALUE"
}

function getSettings(){
	SETTINGS=
	CONT=0

	while [ true ];
	do
	    BUILD_NAME=$(getEnv "BUILD_NAME")
		SETTINGS=`etcdctl --endpoints=$SETTINGS_URL get $BUILD_NAME | tail -n +2`
	
		if [ -z "$SETTINGS" ]; then
			sleep 1	
		
			if [ $CONT == 0 ]; then
				CONT=1
			fi
		else
			break
		fi
	done

	echo "$SETTINGS"
}