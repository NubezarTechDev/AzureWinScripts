
$connectTestResult = Test-NetConnection -ComputerName storagerdpnubezartech1.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Guardar la contraseña para que la unidad persista al reiniciar
    cmd.exe /C "cmdkey /add:`"storagerdpnubezartech1.file.core.windows.net`" /user:`"localhost\storagerdpnubezartech1`" /pass:`"4h75g9M601UwhExFpizbzIPqYjRP/WfC5NHxvYxsne/jn3LbVIxR58YlxId+sskbytT/mOkdCeYe+AStJWsHoQ==`""
    # Montar la unidad
    New-PSDrive -Name K -PSProvider FileSystem -Root "\\storagerdpnubezartech1.file.core.windows.net\corp-programs-shared-files" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}