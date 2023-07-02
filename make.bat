@echo off
if "%1" == "tll" goto make_toplib
if "%1" == "a" goto make_toplib
if "%1" == "test" goto test
goto make_main

REM TOP LEVEL "LIBRARYS"
:make_toplib
D:\programmiersprachen\C\run\bin\gcc.exe -S lib\c_socket.c -lwsock32 -o build\c_socket.s
echo.
echo c_socket: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe -S lib\s_socket.c -lwsock32 -o build\s_socket.s
echo.
echo s_socket: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe -S lib\linked.c -o build\linked.s
echo.
echo linked: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe -S lib\crypt.c -o build\crypt.s
echo.
echo crypt: %errorlevel% ----

if "%1" == "a" goto next
goto make_main

:next

REM THE MAIN LOOP
:make_main
D:\programmiersprachen\C\run\bin\gcc.exe -mwindows client.c build\linked.s build\crypt.s build\c_socket.s -lwsock32 "D:\programmiersprachen\C\dark_game\SDL2.dll" -o client.exe
echo.
echo client: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe -mwindows server.c build\linked.s build\crypt.s build\s_socket.s -lwsock32 -o server.exe
echo.
echo server: %errorlevel% ----
goto exit
:test
D:\programmiersprachen\C\run\bin\gcc.exe test/c.c -lwsock32 -o c.exe
echo.
echo client: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe test/s.c -lwsock32 -o s.exe
echo.
echo server: %errorlevel% ----
:exit