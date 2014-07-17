msbuild ..\SpatialiteSharp.sln /t:Rebuild /p:Configuration=Release

mkdir content\x64\spatialite
mkdir content\x86\spatialite
mkdir content
mkdir lib

copy ..\SpatialiteSharp\x64\spatialite content\x64\spatialite
copy ..\SpatialiteSharp\x86\spatialite content\x86\spatialite

copy ..\SpatialiteSharp\bin\Release\SpatialiteSharp.dll lib
copy ..\SpatialiteSharp\bin\Release\SpatialiteSharp.xml lib

..\.nuget\nuget pack SpatialiteSharp.nuspec