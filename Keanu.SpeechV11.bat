<html><head><title>Message Speaker - TKF</title><HTA:APPLICATION
APPLICATIONNAME="Message Speaker - TKF"
ID="Mesage Speaker - TKF"
VERSION="1.0"
MAXIMIZEBUTTON="no"
SCROLL="no"/></head>
<style> td { color: Black; }
caption { color: Black; }
body { font-family: Arial; background-color: #388A9F; color: #808080; }
input { background-color: #202020; color: #808080; }
textarea { background-color: #22374B; color: #D6E1EC; font-style:bold; }
</style>
<script language="VBScript"> 
Sub Window_OnLoad
Dim width,height
width=470
height=400
self.ResizeTo width,height
End Sub
Function Listen
Dim message
message = tamsg.value 
If (message = null) Then
X = MsgBox("Enter your message", 48, "Error Message")
Else
Set sapi=CreateObject("sapi.spvoice") 
sapi.Speak message
End If
End Function
</script>
<body bgcolor="white">
<span title="Visit our blog for more http://www.TheKnowledgeFactory.in"> <marquee color="white" bgcolor="black" style="font-family= Book Antiqua;">This code is uploaded on <font color="cyan">http://www.TheKnowledgeFactory.in</font></marquee> 
</span> <table align="center" width="400"> <caption style="font-family:Book Antiqua; font-size:20;"><hr color="black"><b>Message Speaker</b><hr color="black"></caption>
<tr> <td align="center"> <span title="Enter your Full message here"><textarea id="tamsg" cols="50" rows="10"></textarea></span> </td> </tr>
<td align="right" color="black" style="font-family: Book Antiqua; font-size:18;"> <hr color="black"> <span title="Click here to listen your message"> 
<input style="width: 130px; height:25px; color: white; background-color: #203040; font-family:Book Antiqua; font-size:15;" type="button" Value="Listen" id="btnsp" onClick="Listen()" onmouseover="btnsp.style.background='#102030'" onmouseout="btnsp.style.background='#203040'"> </span> </td> </tr> <tr> 
<td align="right"><hr color="black"> <span title="All rights reserved by Attract Tech" style="font-size: 13px; font-family:Book Antiqua;">&copy; 2013 Attract Tech - All rights reserved.</span> </td> </tr> </table> </body> </html>