@echo off
set SVN_BINDIR="D:\Program Files\VisualSVN Server\bin"
setlocal
set REPOS=%1
set TXN=%2
rem check that logmessage contains at least 3 characters
%SVN_BINDIR%\svnlook log "%REPOS%" -t "%TXN%" | findstr "..." > nul
if %errorlevel% gtr 0 goto err
exit 0
:err
echo Log message must be more than 3 characters. Commit aborted! 1>&2
exit 1