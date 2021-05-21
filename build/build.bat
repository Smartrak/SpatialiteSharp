msbuild ..\SpatialiteSharp.sln /t:Rebuild /p:Configuration=Release

mkdir files\x64\spatialite
mkdir files\x86\spatialite
mkdir files
mkdir lib

copy ..\SpatialiteSharp\x64\spatialite files\x64\spatialite
copy ..\SpatialiteSharp\x86\spatialite files\x86\spatialite

copy ..\SpatialiteSharp\bin\Release\SpatialiteSharp.dll lib
copy ..\SpatialiteSharp\bin\Release\SpatialiteSharp.xml lib

..\.nuget\nuget pack SpatialiteSharp.nuspec