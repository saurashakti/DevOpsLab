$netMaskIP=[IPAddress]'255.255.255.0'

$binaryString=[String]::Empty
$netMaskIP.GetAddressBytes() | Foreach {
  # combine each
  $binaryString+=[Convert]::ToString($_, 2)
}

# remove the trailing 0s since we only care about the 1s, and get the length
Write-Output $binaryString.TrimEnd('0').Length