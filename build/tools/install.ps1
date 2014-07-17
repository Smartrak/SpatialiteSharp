###############################################################################
#
# install.ps1 --
#
# Written by Joe Mistachkin.
# Released to the public domain, use at your own risk!
#
###############################################################################

param($installPath, $toolsPath, $package, $project)

$platformNames = "x86", "x64"
$fileNames = "libfreexl-1.dll", "libgcc_s_dw2-1.dll", "libgcc_s_seh_64-1.dll", "libgeos-3-4-2.dll", "libgeos_c-1.dll", "libiconv-2.dll", "liblzma-5.dll", "libproj-0.dll", "libstdc++-6.dll", "libstdc++_64-6.dll", "libxml2-2.dll", "mod_spatialite.dll", "zlib1.dll"
$propertyName = "CopyToOutputDirectory"

foreach($platformName in $platformNames) {
  foreach($fileName in $fileNames) {
    $folder = $project.ProjectItems.Item($platformName)
  
    if ($folder -eq $null) {
      continue
    }
  
    $folder = $folder.ProjectItems.Item("spatialite")
  
    if ($folder -eq $null) {
      continue
    }

    $item = $folder.ProjectItems.Item($fileName)
  
    if ($item -eq $null) {
      continue
    }
  
    $property = $item.Properties.Item($propertyName)
  
    if ($property -eq $null) {
      continue
    }
  
    $property.Value = 1
  }
}