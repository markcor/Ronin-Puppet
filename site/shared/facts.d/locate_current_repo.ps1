$local_fact_dir = $PSScriptRoot
$local_site_dir = $local_fact_dir -replace "site\\shared\\facts.d", "site"
$local_repo_dir = $local_fact_dir -replace "site\\shared\\facts.d", ""

write-host $local_fact_dir
write-host $local_site_dir
write-host $local_repo_dir
