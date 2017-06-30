 #!/bin/bash
 
 #Insertamos una línea en /etc/fstab para que se realice el montaje /$HOME/.veleta al iniciar sesión.
    if [ ! -d /media/veleta ]; then
        mkdir /media/veleta 
	fi
	
	grep "veleta.grx" /etc/fstab
	
	if [ $? -ne 0 ];then
        echo "//veleta.grx/usuarios /media/veleta cifs noauto,soft,sec=krb5,cifsacl,iocharset=utf8,dir_mode=0755,user 0       0" >> /etc/fstab
    fi
