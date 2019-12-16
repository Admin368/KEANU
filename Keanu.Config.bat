:: FOR EACH PERSONAL PC IN KEANU NETWORK
:: Make the following Local customized configuration files in Location:
:: C:\Keanu.Config\
:: keep the files simple and just put the value of the info needed
:: 1.C:\Keanu.Config\Local_Ip.txt inside write the static ip in home network <ipaddress>
:: 2.C:\Keanu.Config\Local_name.txt inside just write <name of PC>
:: 3.C:\Keanu.Config\Local_Dir.txt inside just write <where your folde of keanu is>

:: Check in the keanu Folder Keanu\Keanu.Config\ for examples

:: if running Windows Server or Have any port blocking Antivirus,
:: Make sure you ublock all necessary port the main PC server will use

REM The Following are configuration files
@echo %Debug%
REM #Important IP_ADDRESSES
:Keanu_config
set Keanu_Name=Keanu
Set Debug=ON
:: Debug options (ON / OFF)


:Keanu_config_Auto
Set Botname=%Keanu_Name%
Set /P Debug=Debug :
echo %debug%|findstr /i "Yes"
if %errorlevel% equ 0 (set Debug=ON)
Echo %debug%|findstr /i "No"
if %errorlevel% equ 0 (set Debug=OFF)




:Main_Config
Set Home_SSID=The_Tower
Set Main_Server_IP=192.168.1.168
Set Main_Server_Dir=C:\Keanu
Set Main_Sound_IP=192.168.1.168
Set Main_Music_IP=192.168.1.168
Set Main_Alarm_IP=192.168.1.168
Set Nabu_Casa_Address=etne3i1qsy6uhdxact98x1q0vpv4c67c.ui.nabu.casa/
Set Nabu_Casa_Node_Address=
set Main_Node_IP=192.168.1.100
set Main_Node_Port=1880


Set /P Local_PC_IP=<C:\Keanu.config\Local_ip.txt
Set /P Local_PC_NAME=<C:\Keanu.config\Local_name.txt
Set /P Local_PC_Dir=<C:\Keanu.config\Local_Dir.txt
Set /P Local_PC_Heavy=<C:\Keanu.config\Local_heavy.txt
Set /P Local_PC_Projects=<C:\Keanu.config\Local_projects.txt


:Auto_Config_Main_Ip
set Main_Server=%Main_Server_IP%
Set Main_Dir=%Main_Server_Dir%
Set Main_PC=%Main_Server%
Set Main_PC_Dir=%Main_Server%
set Local_Template=%Main_dir%\Keanu.config

Set Hassio.Cloud=%Nabu_Casa_Address%
Set Hassio_Cloud=%Nabu_Casa_Address%

Set Nabu_Casa_Node=%Nabu_Casa_Node_Address%
Set Hassio_Cloud_Node=%Nabu_Casa_Node_Address%
Set Hassio_Cloud.Node=%Nabu_Casa_Node_Address%


set Main_Sound=%Main_Sound_IP%
Set Main_Music=%Main_Music_IP%
Set Main_Node=%Main_Node_IP%:%Main_Node_Port%

Set Local_PC=%Local_ip%
Set Local_Dir=%Local_PC_Dir%


:Hassio_Config
Set Hassio_IP=192.168.1.100
set Hassio_Port=8123
Set Hassio_Mqtt_Port=1883
Set Hassio_Mqtt=%Hassio_Mqtt_Port%
Set Hassio_Mqtt_Topic_General=
Set Hassio_MQTT.Topic=%Hassio_Mqtt_Topic_General%
Set Hassio_MQTT_Topic=%Hassio_Mqtt_Topic_General%

:: MAKE SURE THE INFO ABOUT PC# IS THE SAME FOR ALL CONFIGS
Set PC1_Name=192.168.1.168
Set PC1_IP=Server68
Set PC2_Name=Legend_T3
Set PC2_IP=192.168.1.
Set PC3_Name=
Set PC3_IP=Jey_PC
Set PC4_Name=
Set PC4_IP=


:Phone_Config
Set Phone_Master=
:: Phone matser as to be name of any of the below phones


Set Phone1_Name=
Set Phone1_IP=

Set Phone2_Name=
Set Phone2_IP=


Set Phone3_Name=
Set Phone3_IP=


Set Phone4_Name=
Set Phone4_IP=
Rem #WLED
Set WLED1_Name=
Set WLED1_IP=
Set WLED2_Name=
Set WLED2_IP=
Set WLED3_Name=
Set WLED#_IP=
Set WLED4_Name=
Set WLED4_IP=


Rem #MQTT_Lights
Set MQTT_Light1_Name=
Set MQTT_Light1_IP=
Set MQTT_Light2_Name=
Set MQTT_Light2_IP=
Set MQTT_Light3_Name=
Set MQTT_Light3_IP=
Set MQTT_Light4_Name=
Set MQTT_Light4_IP=


:Camera_config
:: name the cameras location of where they are to help
Set Camera1_IP=
Set Camera1_Name=
Set Camera2_IP=
Set Camera2_Name=
Set Camera2_IP=
Set Camera2_Name=
