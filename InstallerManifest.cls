Include %occInclude

/// Set Up Cache
Class VA.Installer
{
XData VAManifest [XMLNamespace = INSTALLER ]
{
<Manifest>
  <Namespace Name="%SYS" Create="no" >
    <Invoke Class="VA.Installer" Method="SetParams" CheckStatus="0" />
	<Invoke Class="VA.Installer" Method="ImportZSTART" CheckStatus="0" />
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal]
{
	Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "VAManifest")
}

ClassMethod SetParams() As %Status
{
	Set Status=$$$OK
	Set Obj=##class(Config.config).Open()
	Set Obj.MaxServers=30
	Set Obj.MaxServerConn=30
	//Set Obj.routines=1023
	//Set Obj.globals8kb=128000
	//Set Obj.bbsiz=544288
	//Set Obj.gmheap=2184000
	// Obj.locksiz=235929600
	Set Status=Obj.%Save()
	Quit Status
}

ClassMethod ImportZSTART() As %Status
{
	Set Status=$$$OK
	Do $system.OBJ.Load("C:\CacheKit\%ZSTART.mac","ck")
	Quit Status
}
}