#!/bin/bash

#GVFSMOUNT=/run/user/$UID/gvfs/smb-share\:server=veleta.grx,share=usuarios
# Eliminamos @grx del nombre de usuario si existe.
USUARIO=$(echo ${USER%@*?}) 
HOME=/home/$USUARIO
PUNTO_MONTAJE="/media/veleta"
PATH_USUARIO=""
CARPETA_USUARIO=""
BOOKMARK="$HOME/.local/share/user-places.xbel"
SERVIDOR="veleta.grx/usuarios"
KUP_CONFIG=$HOME/.config/kuprc

# Volcamos la fecha al log
date 

export DIRECTORIO_BUSQUEDA
export PUNTO_MONTAJE

function _MONTA_VELETA(){
#Comprobar si exite el punto de montaje /media/veleta
    ls /media | grep -i "veleta" > /dev/null
#Si no existe creamos el directorio /media/veleta
	if [ $? -ne 0 ];then
		mkdir /media/veleta
	fi
#Comprueba si existe la linea de montaje de veleta en /etc/fstab
	cat /etc/fstab | grep -i "veleta.grx" > /dev/null
#Si no existe insertamos la linea en /etc/fstab
	if [ $? -ne 0 ];then
		echo "//veleta.grx/usuarios /media/veleta  cifs  noauto,soft,sec=krb5,cifsacl,iocharset=utf8,file_mode=0644,dir_mode=0755,user  0 0" >> /etc/fstab
	fi
#Montamos VELETA
    mount | grep -e "//veleta.grx/usuarios" > /dev/null
    if [ $? -ne 0 ];then
        echo -n "Esperando montaje de VELETA"" ..."
        mount $PUNTO_MONTAJE 
        while [  `mount | grep -e "//veleta.grx/usuarios" > /dev/null`  ]; do
            echo -n
        done
        echo -e " [\e[0;32mok\e[0m]"
    fi
}

export _MONTA_VELETA

#Montamos smb://veleta/usuarios para realizar la busqueda

	_MONTA_VELETA
	
#Buscamos la carpeta del usuario en veleta, si está creada ...

	echo -n "Buscando carpeta de "$USUARIO" ..."
	
	CARPETA_USUARIO=$(find $PUNTO_MONTAJE -maxdepth 3 -mindepth 0 -type d -iname $USUARIO  2>/dev/null -print -quit | sed "s|"$PUNTO_MONTAJE"||")
	
	#Si el usuario posee carpeta en veleta
	if [ "$CARPETA_USUARIO" != "" ];then #Si se ha encontrado... 
		PATH_USUARIO=smb://$SERVIDOR$CARPETA_USUARIO
		echo -e " [\e[0;32mok\e[0m]"
		echo "La carpeta de usuario es: "$PATH_USUARIO

		# Modificar el bookmark en .xbel del perfil de usuario 
        awk '/'DIRECTORIO_USUARIO'/ { gsub (/'DIRECTORIO_USUARIO'/, '"\"$PATH_USUARIO\""' ) }; { print > '"\"$BOOKMARK\""' }' $BOOKMARK
		echo "Se ha creado el bookmark de la carpeta de usuario: "$PATH_USUARIO
		echo -e " [\e[0;32mok\e[0m]"

		# Crear carpeta de copias de seguridad
		ls $HOME/COPIA_SEGURIDAD > /dev/null
		#Si no existe se crea
		if [ $? -ne 0 ];then
			mkdir $HOME/COPIA_SEGURIDAD
			echo "Se ha creado la carpeta de copias de seguridad: "$HOME/COPIA_SEGURIDAD
			echo -e " [\e[0;32mok\e[0m]"
		fi
	
		ORIGEN=$HOME/COPIA_SEGURIDAD
		awk '/'DIRECTORIO_COPIA_SEGURIDAD'/ { gsub (/'DIRECTORIO_COPIA_SEGURIDAD'/, "'$ORIGEN'" ) }; { print > "'$BOOKMARK'" }' $BOOKMARK
		echo "Se ha creado el bookmark de copias de seguridad: "$ORIGEN
		echo -e " [\e[0;32mok\e[0m]"

		# Modificar el origen de las copias de seguridad
		awk '/'DIRECTORIO_COPIA_SEGURIDAD'/ { gsub (/'DIRECTORIO_COPIA_SEGURIDAD'/, "'$ORIGEN'" ) }; { print > "'$KUP_CONFIG'" }' $KUP_CONFIG
		DESTINO=$PUNTO_MONTAJE$CARPETA_USUARIO
	
		# Modificar el destino de las copias de seguridad 
		awk '/'CARPETA_VELETA'/ { gsub (/'CARPETA_VELETA'/, '"\"$DESTINO\""' ) }; { print > '"\"$KUP_CONFIG\""' }' $KUP_CONFIG

		echo "Se ha configurado el origen: "$ORIGEN" y destino: "$DESTINO" de las copias de seguridad." 
		echo -e " [\e[0;32mok\e[0m]"

	else #Si no se ha encontrado...
		echo -e " [\e[0;31mfallo\e[0m]"
		echo "El usuario "$USUARIO" no posee carpeta en el servidor de archivos"
		exit 0
	fi




exit 0
