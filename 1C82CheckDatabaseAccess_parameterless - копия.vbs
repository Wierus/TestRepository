' Visual Basic ������ �1C82CheckDatabaseAccess_parameterless.vbs� ��������� ����������� ���� ������ �� ������� ���������� 1� 8.2 ����� ������� ����������� � ����.
' ������ ������������ ��� ������ � �������� ����������������� ������� PRTG.
' ��������� ���������� ������������ � ����������� ����� ������ � �������, ��������� ��� ����������������� ������� PRTG.
' ��� �������� ������������� ������� ��� ����������������� ������� PRTG.

' ������ �������: 0.1

' ��� ��� IP-����� ������� ���������� 1�
serverName = "server"
' ��� ���� ������ �� ������� ���������� 1�
databaseName = "database"

On Error Resume Next

Set connector = CreateObject("V82.ComConnector")
connector.connect("Srvr=""" & serverName & """;Ref=""" & databaseName & """;")

WScript.Echo Err.Description

If (InStr(Err.Description, "������������� ������������ �� ���������") <> 0) Then
	' "������������� ���� ������ ��������"
	WScript.Echo "0:Database available"
	' OK
	WScript.Quit 0
ElseIf (InStr(Err.Description, "������ ������ � �������������� ����� ���������") <> 0) Then
	' "������������� ���� ������ �������������"
	WScript.Echo "1:Database blocked"
	' Warning
	WScript.Quit 1
ElseIf (InStr(Err.Description, "�������������� ���� �� ����������") <> 0) Then
	' "��������� ��� ������������� ���� ������"
	WScript.Echo "2:Database not found"
	' System Error
	WScript.Quit 2
ElseIf (InStr(Err.Description, "������ 1�:����������� �� ���������") <> 0) Then
	' "��������� ��� ������� ���������� 1�"
	WScript.Echo "3:Server name cannot be resolved"
	' System Error
	WScript.Quit 2
ElseIf (InStr(Err.Description, "������ ��� ���������� �������� � �������������� �����") <> 0) Then
	' "��������� ��� ��� IP-����� ������� ���������� 1�"
	WScript.Echo "4:Server not found"
	' System Error
	WScript.Quit 2
ElseIf (InStr(Err.Description, "��������� ������") <> 0) Then
	' "�� ������� ��������� ��� COM"
	WScript.Echo "8:COM error loading"
	' System Error
	WScript.Quit 2
Else
	' "����������� ������"
	WScript.Echo "-1:Unknown error"
	' System Error
	WScript.Quit 2
End If
