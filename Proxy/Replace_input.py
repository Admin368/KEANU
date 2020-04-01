import os
import winreg
import re 

print('welcome to proxy input replace')
#os.system('msg /W * import')
os.system('pause')

proxy_Config = winreg.OpenKey(winreg.HKEY_CURRENT_USER,r'Software\Microsoft\Windows\CurrentVersion\Internet Settings',0, winreg.KEY_ALL_ACCESS)
proxy_setting = winreg.QueryValueEx(proxy_Config, "ProxyServer")
print (proxy_setting)
os.system('pause')
ip_adress = input('please enter ip of this pc')
custom_proxy = proxy_setting.remove('127.0.0.1')
print(custom_proxy)
os.system('pause')





#print ('removing brackets')
#bad_chars = [":", "*"]
#for i in bad_chars :
#    proxy_setting = proxy_setting.replace(i, '')
#print (new_proxy)
