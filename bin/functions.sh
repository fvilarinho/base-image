function getHostname(){
   echo "$(cat /etc/hostname)"
}

function getId(){
  echo "$(cat $ETC_DIR/.release | grep BUILD_NAME | cut -d'=' -f2)"
}

function getVersion(){
  echo "$(cat $ETC_DIR/.release | grep BUILD_VERSION | cut -d'=' -f2)"
}

function getSettings(){
	SETTINGS=
	CONT=0

	while [ true ];
	do
	  HOSTNAME=$(getHostname)
		SETTINGS=`etcdctl --endpoints=$SETTINGS_URL get /$HOSTNAME | tail -n +2`
	
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