#!/bin/bash

HOME=/home/$USER
#GVFSMOUNT=/run/user/$UID/gvfs/smb-share\:server=veleta.grx,share=usuarios
PUNTO_MONTAJE="/media/veleta"
PATH_USUARIO=""
CARPETA_USUARIO=""
BOOKMARK="$HOME/.local/share/user-places.xbel"
SERVIDOR="veleta.grx/usuarios"
KUP_CONFIG=$HOME/.config/kuprc
EXCLUSIONES=""

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

	echo -n "Buscando carpeta de "$USER" ..."
	
	CARPETA_USUARIO=$(find $PUNTO_MONTAJE -maxdepth 3 -mindepth 0 -type d \( -path '/media/veleta/AAM' -o -path '/media/veleta/AB' -o -path '/media/veleta/ACTAS.R.CORP.AREA' -o -path '/media/veleta/ADMINISTRACION ELECTRONICA' -o -path '/media/veleta/Aplicaciones' -o -path '/media/veleta/CCSS DIPUTACION' -o -path '/media/veleta/CD' -o -path '/media/veleta/CEL' -o -path '/media/veleta/Centro de la Mujer' -o -path '/media/veleta/CIE' -o -path '/media/veleta/DatFich' -o -path '/media/veleta/DATOS' -o -path '/media/veleta/Deportes' -o -path '/media/veleta/Dipuutil' -o -path '/media/veleta/Dossier prensa' -o -path '/media/veleta/EIEL' -o -path '/media/veleta/FPRESUP' -o -path '/media/veleta/General_Todos_Uso_Compartido' -o -path '/media/veleta/GranadaEnRed' -o -path '/media/veleta/HuescarBackup' -o -path '/media/veleta/INFOLEX' -o -path '/media/veleta/Juventud' -o -path '/media/veleta/Metrop' -o -path '/media/veleta/OBRAS' -o -path '/media/veleta/OBRAS17' -prune -o -path '/media/veleta/OBRAS-GENERAL' -o -path '/media/veleta/OBRASYSERVICIOS' -o -path '/media/veleta/Parque Movil' -o -path '/media/veleta/Patronato Garcia Lorca' -o -path '/media/veleta/Patronato Rodriguez Penalva' -o -path '/media/veleta/Residencia Penalva' -o -path '/media/veleta/Resoluciones' -o -path '/media/veleta/RRHH-CCSS' -o -path '/media/veleta/RRHH-SI' -o -path '/media/veleta/SAGE' -o -path '/media/veleta/Sindicatos' -o -path '/media/veleta/Sistemas' -o -path '/media/veleta/Turismo' -o -path '/media/veleta/usr' -o -path '/media/veleta/VIGILANTES' -o -path '/media/veleta/VISOGSA' \) -prune -o -iname $USER  2>/dev/null -print0 -quit | sed "s|"$PUNTO_MONTAJE"||")
	
	echo -e " [\e[0;32mok\e[0m]"
	
	echo $CARPETA_USUARIO
	
	#Si el usuario posee carpeta en veleta
	if [ "$CARPETA_USUARIO" != "" ];then #Si se ha encontrado... 
		PATH_USUARIO=smb://$SERVIDOR$CARPETA_USUARIO
		echo "La carpeta de usuario es: "$PATH_USUARIO
# Modificar el bookmark en .xbel del del perfil de usuario 
        awk '/'DIRECTORIO_USUARIO'/ { gsub (/'DIRECTORIO_USUARIO'/, "'$PATH_USUARIO'" ) }; { print > "'$BOOKMARK'" }' $BOOKMARK
	else #Si no se ha encontrado...
		echo "El usuario "$USER" no posee carpeta en el servidor de archivos o se encuentra dentro de la lista de excepciones"
		exit 0
	fi

# Modificar el destino de las copias de seguridad 
		awk '/'CARPETA_VELETA'/ { gsub (/'CARPETA_VELETA'/, "'$PUNTO_MONTAJE$CARPETA_USUARIO'" ) }; { print > "'$KUP_CONFIG'" }' $KUP_CONFIG


exit 0
