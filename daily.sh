#!/bin/sh

# Requirements:
# - user przemien must exist
# - this script must be run as that user
# - github key has to be configured (~/.ssh/config)
# - github realname has to be configured
# - repo must be already checked out
# - two entries in ~/.ssh/config: github and www

log_init()
{
	log_file="$1/logfile.txt"
	log "Script starting"
}

log_upload()
{
	# TODO: what if file can't be copied? store it somewhere
	log "Script terminating"
	if scp "$log_file" www:www/przemienniki-status.new; then
		ssh www mv www/przemienniki-status.new www/przemienniki-status.txt
	else
		echo "Could not upload log"
	fi
}

log()
{
	echo $(date "+%Y-%m-%d %H:%M:%S") $@ | tee -a "$log_file"
}

dl()
{
	log "Downloading file: $1"
	curl "$1" > "$2" || { log "Error downloading data"; exit 1; }
	[ -s "$2" ] || { log "Downloaded empty file"; exit 1; }
}

user=przemien
git_url=github.com:przemienniki/baza-przemiennikow.git
repo_path=$HOME/baza-przemiennikow
json_link=https://przemienniki.eu/eksport-danych/json/
csv_link=https://przemienniki.eu/eksport-danych/csv/
chirp_link=https://przemienniki.eu/eksport-danych/chirp/
json_file=przemienniki-eu.json
csv_file=przemienniki-eu.csv
chirp_file=przemienniki-eu-chirp.csv

[ "$(id -un)" = "$user" ] || { echo "Must be running as user $user"; exit 1; }

tmp_dir=$(mktemp -d)
trap "log_upload; rm -rf $tmp_dir" exit
log_init "$tmp_dir"

dl "$json_link" "$tmp_dir/$json_file"
dl "$csv_link" "$tmp_dir/$csv_file"
dl "$chirp_link" "$tmp_dir/$chirp_file"

diff "$tmp_dir/$json_file" "$repo_path/$json_file" && \
diff "$tmp_dir/$csv_file" "$repo_path/$csv_file" && \
diff "$tmp_dir/$chirp_file" "$repo_path/$chirp_file" && \
{ log "No changes since last check"; exit 0; }

cp -f "$tmp_dir/$json_file" "$tmp_dir/$csv_file" "$tmp_dir/$chirp_file" "$repo_path/" || { log "Could not copy files to repository"; exit 1; }
cd "$repo_path"
git add "$json_file" "$csv_file" "$chirp_file" || { log "Could not add files"; exit 1; }
date=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "Automatyczna aktualizacja $date" || { log "Could not commit"; exit 1; }
git push || { log "Could not push"; exit 1; }
log "Everything OK"
