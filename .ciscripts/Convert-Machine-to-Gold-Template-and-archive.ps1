######## Variables you need to fill out ########

$vCenter_IP = '172.16.10.217'
$vCenter_HOSTNAME = 'asgharlabs-vc.asgharlabs.io'
$vCenter_LOGIN = 'administrator@vsphere.local'
$vCenter_PASSWORD = '6OzDKO!LSrR$j0u'
$vCenter_CLUSTER = 'asghar'
$vCenter_DATASTORE = 'vsanDatastore'

$vm_gold = 'debian-gold'
$epoch = (New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds
$archive_tag = Get-Date -Format "yyyy-MM-dd-$epoch"
$vm_gold_archive = $("debian-gold-" + $archive_tag)
$vm_success_built = 'debian-success'


################################################

#echo "$vCenter_IP   $vCenter_HOSTNAME" >> /etc/hosts
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-VIServer -Server $vCenter_IP -User $vCenter_LOGIN -Password $vCenter_PASSWORD

Set-VM $vm_success_built -ToTemplate -Confirm:$False
Set-Template $vm_gold -name $vm_gold_archive -Confirm:$False
Set-Template $vm_success_built -name $vm_gold -Confirm:$False
