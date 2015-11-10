copy "%systemdrive%\vagrant\shell\BoxstarterGist.txt" "%temp%\BoxstarterGist.txt"
@powershell -NoProfile -ExecutionPolicy Bypass -Command "Install-BoxStarterPackage -PackageName %temp%\\BoxstarterGist.txt -DisableReboots"
