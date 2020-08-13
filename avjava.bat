::===============================================================================
:: AVJAVA is small IDE like program developed by Abhishek Vyas for helping people
:: cope with the command line operations and focus on the programming and not 
:: on path,enviornment variables,etc. of jdk or java files and compile and 
:: execute your java files without any hassel.
::
:: No rights are reserved to anyone for this program, anyone who gets a copy of
:: this program is permitted to change and distribute it in any way they see fit.
:: LOL
:: Happy coding ;)
::
:: NOTE - Dont't worry this is not a VIRUS and it's not gonna HACK your pc.
::================================================================================

@ECHO OFF
cls

REM for /f "delims=" %%a in ('cd') do @set currentPath=%%a

REM cmd /c "cd c:/ && trial && exit" > nul 2>nul
REM if %errorlevel% neq 0 set path=%path%;%currentPath%

set "_filename="
set /P _filename=Enter filename :
REM if [%1] equ [] echo How to use : trail Myfilename && cmd && goto end

if %_filename% equ abhishek goto banner

cd avjava >nul 2>nul
if %errorlevel% neq 0 mkdir avjava && cd avjava

REM storing path of avjava directory
for /f "delims=" %%b in ('cd') do @set avjavapath=%%b

REM for /F "delims=" %%a in ('where /R c:\ %_filename:.java%.java') do @set filepath=%%a
REM echo %filepath:_filename%
more %_filename:.java=%.java > nul 2>nul
if %errorlevel% neq 0 echo public class %_filename:.java=% { public static void main(String args[]){  } } >> %_filename:.java=%.java
notepad.exe %_filename:.java=%.java

REM storing path of java directory
for /F "delims=" %%a in ('where /R "C:\Program Files\java" java.exe') do @set javaPath=%%a
set javaPath=%javaPath:java.exe=%

echo.

echo [*] Compiling %_filename:.java=%.java using javac . .

REM Actul .java file compilation
"%javaPath%javac.exe" %avjavapath%/%_filename:.java=%.java 2>nul
if %errorlevel% neq 0 goto compileError


echo [*] Executing %_filename:.java=%.java using java . .
echo [!] If your program requires any user inputs, press enter . .

REM Actul .java file execution
"%javaPath%java.exe" -cp %avjavapath%\ %_filename:.java=% >nul 2>nul
if %errorlevel% neq 0 goto runtimeError

echo [#] OUTPUT - 
echo ======================================
echo.
"%javaPath%java.exe" -cp %avjavapath%\ %_filename:.java=%
echo.
echo ======================================
cd ..
goto end

REM Fromatting compilation errors
:compileError
echo [X] Compile time error -
echo ======================================
echo.
"%javaPath%javac.exe" %avjavapath%/%_filename:.java=%.java
echo.
echo ======================================
cd ..
goto end

REM Fromatting runtime errors
:runtimeError
echo [X] Runtime error -
echo ======================================
echo.
"%javaPath%java.exe" -cp %avjavapath%\ %_filename:.java=%
echo.
echo ======================================
cd ..

:: This is not how you find a easteregg , you have to put in a specific filename to see this in cmd.
:: this is simply cheating !!

:banner
echo .
echo "    _____  ___.    .__     .__         .__              __        ____   ____                        "
echo "   /  _  \ \_ |__  |  |__  |__|  ______|  |__    ____  |  | __    \   \ /   /___.__._____     ______ "
echo "  /  /_\  \ | __ \ |  |  \ |  | /  ___/|  |  \ _/ __ \ |  |/ /     \   Y   /<   |  |\__  \   /  ___/ "
echo " /    |    \| \_\ \|   Y  \|  | \___ \ |   Y  \\  ___/ |    <       \     /  \___  | / __ \_ \___ \  "
echo " \____|__  /|___  /|___|  /|__|/____  >|___|  / \___  >|__|_ \       \___/   / ____|(____  //____  > "
echo "         \/     \/      \/          \/      \/      \/      \/               \/          \/      \/  "
echo  thanks you for using avjava, as you are the first one to find this easteregg , you are the CHOOSEN ONE !
echo .

:end
pause