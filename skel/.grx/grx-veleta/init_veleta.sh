#!/bin/bash

HOME=/home/$USER
GVFSMOUNT=/run/user/$UID/gvfs/smb-share\:server=veleta.grx,share=usuarios
CARPETA_USUARIO=""
PUNTO_MONTAJE="smb://veleta.grx/usuarios"
BOOKMARK="./user-places.xbel"

export GVFSMOUNT
export DIRECTORIO_BUSQUEDA
export PUNTO_MONTAJE

function _MONTA_GVFS(){
	if [ ! -d "$GVFSMOUNT" ];then
		gvfs-mount $PUNTO_MONTAJE
		if [ $? -ne 0 ];then
			echo "No se puede montar la carpeta remota..."
			exit 0 
		fi
	fi
	echo -n "Esperando montaje "$PUNTO_MONTAJE" ..."
	while [  ! -d "$GVFSMOUNT"  ]; do
		echo -n
    done
	echo " [ok]"
}

function _DESMONTA_GVFS(){
	if [ -d "$GVFSMOUNT" ];then
		gvfs-mount -u $PUNTO_MONTAJE
		if [ $? -ne 0 ];then
			echo "Fallo al desmontar carpeta remota $PUNTO_MONTAJE"
			exit 0 
		fi
	fi

	echo -n "Esperando desmontaje "$PUNTO_MONTAJE" ..."
	while [ -d "$GVFSMOUNT"  ]; do
		echo -n
    done
	echo " [ok]"
}

export _MONTA_GVFS
export _DESMONTA_GVFS

#Montamos smb://veleta/usuarios para realizar la busqueda

	_MONTA_GVFS
	
#Buscamos la carpeta del usuario en veleta, si está creada ...

	echo -n "Buscando carpeta de "$USER" ..."
	CARPETA_USUARIO=$(find /run/user/$UID/gvfs/smb-share\:server\=veleta.grx\,share\=usuarios/ -maxdepth 3 -mindepth 2 -type d -iname $USER 2>/dev/null -print -quit | sed "s|"$GVFSMOUNT"||")
	echo " [ok]"

# #Desmontamos smb://veleta/usuarios
	
	if [ "$CARPETA_USUARIO" != "" ];then #Si se ha encontrado... 
		_DESMONTA_GVFS
		PUNTO_MONTAJE=smb://veleta.grx/usuarios$CARPETA_USUARIO
		echo "La carpeta de usuario es: "$PUNTO_MONTAJE
	else #Si no se ha encontrado...
		echo "El usuario "$USER" no posee carpeta en el servidor de archivos"
		exit 0
	fi
	
# Insertamos el bookmark en .xbel del skel y sustituimos 

    awk '/'DIRECTORIO_USUARIO'/ { gsub (/'DIRECTORIO_USUARIO'/, "'$PUNTO_MONTAJE'" ) }; { print > "'$BOOKMARK'" }' $BOOKMARK
    
    cp $BOOKMARK  /home/$USER/.local/share/

#Crear .desktop VELETA
#/home/si_alej/.local/share/remoteview/VELETA.desktop

#	[Desktop Entry]
#    Charset=
#    Icon=folder-remote
#    Name=VELETA
#    Type=Link
#    URL=smb://veleta.grx/usuarios

#/home/si_alej/.local/share/user-places.xbel
#  <bookmark href="smb://veleta.grx">
#  <title>VELETA</title>
#  <info>
#   <metadata owner="http://freedesktop.org">
#    <bookmark:icon name="folder-remote-symbolic"/>
#   </metadata>
#   <metadata owner="http://www.kde.org">
#    <ID>1495632700/2 (V2)</ID>
#    <IsHidden>false</IsHidden>
#   </metadata>
#  </info>
# </bookmark>


    
exit 0
