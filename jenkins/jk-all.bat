@echo off

echo Execution started: %date% %time%

rem ---Compiler------------------------------------------------------
rem if "%COMPILER%" == "" (
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat" (
  call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat" x86
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat" (
  call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat" x86
)
rem ) else (
rem   if %COMPILER% == vc9   call "%VS90COMNTOOLS%vsvars32.bat"
rem   if %COMPILER% == vc10  call "%VS100COMNTOOLS%vsvars32.bat"
rem   if %COMPILER% == vc11  call "%VS110COMNTOOLS%vsvars32.bat"
rem   if %COMPILER% == vc12  call "%VS120COMNTOOLS%vsvars32.bat"
rem   if %COMPILER% == vc13  call "%VS130COMNTOOLS%vsvars32.bat"
rem   if %COMPILER% == vc15  call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat"
rem   if %COMPILER% == native call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat" x86
rem )

echo Dumping the full environment ---------------------------------------------------------
set
echo --------------------------------------------------------------------------------------

rem ---Run the CTest script depending on the compiler------------------------------------------
set THIS=%~d0%~p0
ctest -VV -S %THIS%/root-build.cmake
if %ERRORLEVEL% neq 0 (
  exit /B %ERRORLEVEL%
)
rem if not "%COMPILER%" == "" (
rem   if not %COMPILER% == vc15 (
rem     if not %COMPILER% == native (
rem       ctest -V -S %THIS%/root-test.cmake
rem     )
rem   )
rem )

exit /B %ERRORLEVEL%

