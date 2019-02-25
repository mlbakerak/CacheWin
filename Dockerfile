# escape=`
FROM microsoft/iis
EXPOSE 57772 1972
WORKDIR C:\CacheKit
COPY cache-2018.1.1.312.0-win_x64.exe InstallerManifest.cls %ZSTART.mac cache.key C:\CacheKit\
RUN cache-2018.1.1.312.0-win_x64.exe /instance Cache /qn INSTALLDIR=C:\CacheSys`
 ADDLOCAL=server,documentation,cspgateway INITIALSECURITY=Normal`
 CACHEUSERPASSWORD=isc INSTALLERMANIFEST=C:\CacheKit\InstallerManifest.cls`
 && C:\CacheSys\bin\Ccontrol.exe stop Cache quietly`
 && copy C:\CacheKit\cache.key C:\CacheSys\mgr\cache.key