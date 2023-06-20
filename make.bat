@echo off
if "%1" == "tll" goto make_toplib
if "%1" == "a" goto make_toplib
goto make_main

REM TOP LEVEL "LIBRARYS"
:make_toplib
D:\programmiersprachen\C\run\bin\gcc.exe -S g_socket.c -lwsock32 -o build\g_socket.s
echo.
echo g_socket: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe -S linked.c -o build\linked.s
echo.
echo linked: %errorlevel%
D:\programmiersprachen\C\run\bin\gcc.exe -S crypt.c -o build\crypt.s
echo.
echo crypt: %errorlevel% ----

if "%1" == "a" goto next
goto make_main

:next

REM THE MAIN LOOP
:make_main
D:\programmiersprachen\C\run\bin\gcc.exe main.c game.c build\linked.s build\crypt.s build\g_socket.s -lwsock32 -o main.exe
echo.
echo main: %errorlevel% ----