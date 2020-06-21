


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$VMnator                         = New-Object system.Windows.Forms.Form
$VMnator.ClientSize              = '400,233'
$VMnator.text                    = "VMNator"
$VMnator.TopMost                 = $false

$go                              = New-Object system.Windows.Forms.Button
$go.text                         = "Go!"
$go.width                        = 60
$go.height                       = 30
$go.location                     = New-Object System.Drawing.Point(314,172)
$go.Font                         = 'Microsoft Sans Serif,10'

$nameField                       = New-Object system.Windows.Forms.TextBox
$nameField.multiline             = $false
$nameField.width                 = 267
$nameField.height                = 20
$nameField.location              = New-Object System.Drawing.Point(83,53)
$nameField.Font                  = 'Microsoft Sans Serif,10'

$Name                            = New-Object system.Windows.Forms.Label
$Name.text                       = "Name"
$Name.AutoSize                   = $true
$Name.width                      = 25
$Name.height                     = 10
$Name.location                   = New-Object System.Drawing.Point(32,58)
$Name.Font                       = 'Microsoft Sans Serif,10'

$modul                           = New-Object system.Windows.Forms.Label
$modul.text                      = "Modul"
$modul.AutoSize                  = $true
$modul.width                     = 25
$modul.height                    = 10
$modul.location                  = New-Object System.Drawing.Point(31,89)
$modul.Font                      = 'Microsoft Sans Serif,10'

$modulList                       = New-Object system.Windows.Forms.ComboBox
$modulList.text                  = ""
$modulList.width                 = 268
$modulList.height                = 28
$modulList.location              = New-Object System.Drawing.Point(83,84)
$modulList.Font                  = 'Microsoft Sans Serif,10'

$VMnator.controls.AddRange(@($go,$nameField,$Name,$modul,$modulList))

$go.Add_Click({ startScript })

$gitURL = "https://api.github.com/repos/vmnator/configs/contents"

$files = Invoke-RestMethod -Uri $gitURL
foreach ($file in $files) {
    $modulList.Items.Add($file.name)
} 

function startScript(){
    $name = $nameField.Text
    $modul = $modulList.Text

    Write-Host $name
    Write-Host $modul
    
    $VMnator.close()
}

[void]$VMnator.ShowDialog()