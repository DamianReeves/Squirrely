@echo off
cls

.paket\paket.bootstrapper.exe
if errorlevel 1 (
  exit /b %errorlevel%
)

if EXIST paket.dependencies (
	.paket\paket.exe restore
	if errorlevel 1 (
	  exit /b %errorlevel%
	)
)

IF NOT EXIST packages/FAKE/tools/Fake.exe (
	@echo "Downloading FAKE(F# Make)"
	.nuget\nuget.exe install FAKE -OutputDirectory packages -ExcludeVersion
)

packages\FAKE\tools\Fake.exe build.fsx %*
