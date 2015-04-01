@echo off
cls

IF NOT EXIST packages/FAKE/tools/Fake.exe (
	@echo "Downloading FAKE(F# Make)"
	.nuget\nuget.exe install FAKE -OutputDirectory packages -ExcludeVersion
)

packages\FAKE\tools\Fake.exe build.fsx %*
