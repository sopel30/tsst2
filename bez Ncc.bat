@echo off

echo Wielkosc sieci:

echo ClientNode
set/p "ClientNode=>>"
echo NetworkNode
set/p "NetworkNode=>>"


START networkLibrary\Client\bin\Debug\Client.exe Config/NetworkTopology.xml
START NetworkManager\NetworkManager\bin\Debug\NetworkManager.exe Config/ManagerConfig.xml

pause
for /L %%A in (1,1,%NetworkNode%) do (
	START NetworkNode\NetworkNode\bin\Debug\NetworkNode.exe Config/Nodes/Node%%A.xml
	)
	
for /L %%A in (1,1,%ClientNode%) do (
	START ClientNode\ClientNode\bin\Debug\ClientNode.exe Config/Client/Client%%A.xml
	)