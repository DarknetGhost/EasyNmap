clear
echo """
Cual es tu dispositivo?

1.- Linux
2.- Termux
"""
read -p "[+]Ingresa la opcion: " opcion

if [[ $opcion -eq 1 ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo "Este script debe ser ejecutado como usuario root"
        exit 1
    fi  
    
    clear
    echo "Vamos a instalar lo necesario por ti"
    sudo apt-get update -y && sudo apt-get upgrade -y
    sudo apt-get install nmap


elif [[ $opcion -eq 2 ]]; then
    echo "Vamos a instalar lo necesario"
    pkg update -y && pkg upgrade -y
    pkg install nmap
fi
clear
echo """
--------------------------------------------------------------------------

███████╗ █████╗ ███████╗██╗   ██╗    ███╗   ██╗███╗   ███╗ █████╗ ██████╗ 
██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝    ████╗  ██║████╗ ████║██╔══██╗██╔══██╗
█████╗  ███████║███████╗ ╚████╔╝     ██╔██╗ ██║██╔████╔██║███████║██████╔╝
██╔══╝  ██╔══██║╚════██║  ╚██╔╝      ██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ 
███████╗██║  ██║███████║   ██║       ██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     
                                                                          
--------------------------------------------------------------------------
                    Creada por DarknetGhos                
Recuerda antes de hacer escaneos ruidosos, conocer un poco la estructura de la red

1.- Escaneo simple (nmap <ip>)
2.- Escaneo de sistema operativo (nmap -O <ip>)
3.- Escaneo de todos los puertos (nmap -p- <ip>)
4.- Escaneo completo ruidoso (nmap --min-rate 5000 -sCV <ip> )
5.- Escaneo agresivo (nmap -A <ip>)
6.- Escaneo de Vulnerabilidades (nmap --min-rate 5000 --script vuln <ip>)
7.- Escaneo silencioso (nmap -sS <ip>)
8.- Escaneo a puerto especifico (nmap -p xx -sCV <ip>)
"""
read -p "[+]Elige el tipo de escaneo: " escaneo
read -p "[+]Ingresa la direccion IP o el Dominio: " ip
if [[ $escaneo -eq 1 ]]; then
    nmap $ip

elif [[ $escaneo -eq 2 ]]; then
    nmap -O $ip

elif [[ $escaneo -eq 3 ]]; then
    nmap --min-rate 3000 -p- $ip

elif [[ $escaneo -eq 4 ]]; then
    nmap --min-rate 5000 -sCV $ip

elif [[ $escaneo -eq 5 ]]; then
    nmap -A $ip

elif [[ $escaneo -eq 6 ]]; then
    nmap --min-rate 5000 --script vuln $ip

elif [[ $escaneo -eq 7 ]]; then
    nmap -sS $ip

elif [[ $escaneo -eq 8 ]]; then
    read -p "Ingresa el puerto: " puerto
    nmap -p $puerto -sCV $ip

else: 
    echo "Opcion no valida"
    exit

fi












