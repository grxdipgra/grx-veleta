Criterio: 
	1.- instalacion:
		desmontar veleta y montar la carpeta de usuario.
		hacer la búsqueda de la carpeta y componer el usuario
		Si no existe insertar el punto de montaje de veleta en fstab (/veleta/usuarios)
		Copiar script montar veleta y buscar carpeta usuario en .profile
	3.- Inicio de sesión
	4.- Copia de seguridad
		Comprobar si esta montada la carpeta de usuario y si no montarla.
		Realizar la copia con rsync. 
		* Siempre que se haga un backup logear fecha hora y estado.
	4.- Poner un boton para hacer backup e indicador de ultima copia.

Archivos:
	postinst.sh : Archivo de preparacion del paquete
	init_veleta.sh : script de inicio de sesión

 Busqueda de la carpeta del usuario -> find /media/veleta -maxdepth 3 -mindepth 2 -type d -iname $USER 2>/dev/null -print -quit | sed 's/\/media\/veleta\///'

Montaje de la carpeta del usuario -> //veleta.grx/usuarios /media/veleta  cifs  noauto,soft,sec=krb5,cifsacl,iocharset=utf8,file_mode=0644,dir_mode=0755,user  0 0

Se ha modificado el montaje para no incluir las acl pues no las reconoce:

//veleta.grx/usuarios /media/veleta  cifs  noauto,soft,sec=krb5,iocharset=utf8,user  0 0

En el .profile hay que poner el script de montaje .... 

Lineas script:

ls /media | grep -i "veleta"

	if [ $? -ne 0 ];then
		mkdir /media/veleta
	fi

cat /etc/fstab | grep -i "veleta.grx"

	if [ $? -ne 0 ];then
		echo "//veleta.grx/usuarios /media/veleta  cifs  noauto,soft,sec=krb5,cifsacl,iocharset=utf8,file_mode=0644,dir_mode=0755,user  0 0" >> /etc/fstab
	fi
		

carpeta_usuario=find /media/veleta -maxdepth 3 -type d -inmae $USER 2>/dev/null | sed 's/\/media\/veleta\///'

dir_usuario=/veleta.grx/usuarios/$carpeta_usuario

umount /media/veleta

##### Kup
Se va ha usar el sistema de backup Kup.
Se instala desde .deb y despues se sustituyen los archivos modificados y compilados :
    /usr/lib/libkdeinit5_kup-daemon.so
    /usr/bin/kup-daemon

    Directorios de instalacion:

    Install the project...
-- Install configuration: "release"
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/contents
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/contents/ui
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/contents/ui/Main.qml
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/contents/ui/FullRepresentation.qml
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/metadata.desktop.template
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/metadata.desktop
-- Up-to-date: /usr/share/plasma/plasmoids/org.kde.kupapplet/metadata.json
-- Up-to-date: /usr/share/metainfo/org.kde.kupapplet.appdata.xml
-- Up-to-date: /usr/share/kservices5/plasma-applet-org.kde.kupapplet.desktop
-- Up-to-date: /usr/lib/libgit24kup.so.0.19.0
-- Up-to-date: /usr/lib/libgit24kup.so.0
-- Up-to-date: /usr/lib/libgit24kup.so
-- Up-to-date: /usr/bin/kup-daemon
-- Installing: /usr/lib/libkdeinit5_kup-daemon.so
-- Up-to-date: /etc/xdg/autostart/kup-daemon.desktop
-- Up-to-date: /usr/share/knotifications5/kupdaemon.notifyrc
-- Up-to-date: /usr/lib/x86_64-linux-gnu/qt5/plugins/plasma/dataengine/plasma_engine_kup.so
-- Up-to-date: /usr/share/kservices5/plasma-dataengine-kup.desktop
-- Up-to-date: /usr/share/plasma/services/kupservice.operations
-- Up-to-date: /usr/share/icons/hicolor/scalable/apps/kup.svgz
-- Up-to-date: /usr/bin/kup-filedigger
-- Up-to-date: /usr/lib/x86_64-linux-gnu/qt5/plugins/kcm_kup.so
-- Up-to-date: /usr/share/kservices5/kcm_kup.desktop
-- Up-to-date: /usr/lib/x86_64-linux-gnu/qt5/plugins/kio_bup.so
-- Up-to-date: /usr/share/kservices5/bup.protocol
-- Installing: /usr/share/locale/pt_BR/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/tl/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/bs_BA/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/pl/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/sv/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/zh_TW/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/lt_LT/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/it/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/da/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/fr_FR/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/de/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/ru/LC_MESSAGES/kup.mo
-- Installing: /usr/share/locale/es/LC_MESSAGES/kup.mo

archivo configuracion en perfil:

    /home/si_alej/.config/kuprc
    
archivo log:

    /home/si_alej/.cache/kup/kup_plan1.log
    
el intervalo de backup se cuenta en periodos de medio minuto 

Archivo $USER/.config/kuprc

[Kup settings]
Backups enabled=true
Number of backups=1

[Plan/1]
Accumulated usage time=960
Backup type=1 -> Esta línea indica backup rsync si no aparece es backup bup
Description=Veleta
Destination type=0
Filesystem destination path=file:///media/veleta
Last available space=886459523072
Last backup size=1606676
Last complete backup=2017,6,30,9,25,58
Paths excluded=
Paths included=/home/si_alej/Documentos
Schedule interval unit=2
Schedule type=0
Usage limit=1


Instalación del paquete compilado y del cliente

Para crear el .deb del kup hay que situarse en la carpeta build y ejecutar la utilidad chekinstall.
Una vez creado el paquete se mueve al equipo a instalar.

El paquete kup-client se instala con apt pues está en los repositorios.


Creación del directorio de usuario.

Hay que modificar /etc/pam.d/common-session

insertar la linea: session required pam_systemd.so skel=/etc/skel/ umask=0022
					session required pam_mkhomedir.so skel=/etc/skel/ umask=0022

Reiniciar el sistema.
