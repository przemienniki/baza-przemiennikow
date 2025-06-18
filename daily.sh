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
	curl "$1" > "$2" || { log "Error downloading data"; return 1; }
	[ -s "$2" ] || { log "Downloaded empty file"; return 1; }
	size=$(stat -c%s "$2")
	log "Downloaded $size bytes"
	return 0
}

# Return values of dl_* functions:
# - 0: no changes
# - 1: changes
# - 2: error

dl_przemienniki_eu()
{
	log "Downloading from przemienniki.eu"

	json_link="https://przemienniki.eu/eksport-danych/json/"
	csv_link="https://przemienniki.eu/eksport-danych/csv/"
	chirp_link="https://przemienniki.eu/eksport-danych/chirp/"

	dl "$json_link" "$tmp_dir/$eu_json_file" || return 2
	dl "$csv_link" "$tmp_dir/$eu_csv_file" || return 2
	dl "$chirp_link" "$tmp_dir/$eu_chirp_file" || return 2

	diff "$tmp_dir/$json_file" "$repo_path/$eu_json_file" && \
	diff "$tmp_dir/$csv_file" "$repo_path/$eu_csv_file" && \
	diff "$tmp_dir/$chirp_file" "$repo_path/$eu_chirp_file" && \
	{ log "No changes in przemienniki.eu since last check"; return 0; }

	cp -f "$tmp_dir/$eu_json_file" "$tmp_dir/$eu_csv_file" "$tmp_dir/$eu_chirp_file" "$repo_path/" || \
	{ log "Could not copy przemienniki.eu files to repository"; return 2; }

	log "przemienniki.eu database changed"
	return 1
}

dl_przemienniki_net()
{
	log "Downloading from przemienniki.net"

	ts_link="https://przemienniki.net/export/timestamp.xml?format=unix"
	xml_link="https://przemienniki.net/export/rxf.xml?setlang=en&country=all"
	chirp_link="https://przemienniki.net/export/chirp.csv?setlang=en&country=all"

	dl "$ts_link" "$tmp_dir/$net_ts_file" || return 2
	diff "$tmp_dir/$net_ts_file" "$repo_path/$net_ts_file" && \
	{ log "No changes in przemienniki.net since last check"; return 0; }

	log "Timestamp file for przemienniki.net changed, downloading database"
	dl "$xml_link" "$tmp_dir/$net_xml_file" || return 2
	dl "$chirp_link" "$tmp_dir/$net_chirp_file" || return 2

	cp -f "$tmp_dir/$net_ts_file" "$tmp_dir/$net_xml_file" "$tmp_dir/$net_chirp_file" "$repo_path/" || \
	{ log "Could not copy przemienniki.net files to repository"; return 2; }

	log "przemienniki.net database changed"
	return 1
}

user=przemien
git_url=github.com:przemienniki/baza-przemiennikow.git
repo_path=$HOME/baza-przemiennikow

eu_json_file=przemienniki-eu.json
eu_csv_file=przemienniki-eu.csv
eu_chirp_file=przemienniki-eu-chirp.csv

net_ts_file=przemienniki-net.timestamp
net_xml_file=przemienniki-net.xml
net_chirp_file=przemienniki-net-chirp.csv

[ "$(id -un)" = "$user" ] || { echo "Must be running as user $user"; exit 1; }

tmp_dir=$(mktemp -d)
trap "log_upload; rm -rf $tmp_dir" exit
log_init "$tmp_dir"

dl_przemienniki_eu
result_przemienniki_eu=$?

dl_przemienniki_net
result_przemienniki_net=$?

cd "$repo_path"

if [ $result_przemienniki_eu = 0 ]; then
	log "No changes in przemienniki.eu"
elif [ $result_przemienniki_eu = 1 ]; then
	log "Found changes in przemienniki.eu"
	git add "$eu_json_file" "$eu_csv_file" "$eu_chirp_file" || { log "Could not add files from przemienniki.eu"; exit 1; }
else
	log "Error downloading przemienniki.eu"
fi

if [ $result_przemienniki_net = 0 ]; then
	log "No changes in przemienniki.net"
elif [ $result_przemienniki_net = 1 ]; then
	log "Found changes in przemienniki.net"
	git add "$net_ts_file" "$net_xml_file" "$net_chirp_file" || { log "Could not add files from przemienniki.net"; exit 1; }
else
	log "Error downloading przemienniki.net"
fi

if [ $result_przemienniki_eu = 1 -o $result_przemienniki_net = 1 ]; then
	date=$(date "+%Y-%m-%d %H:%M:%S")
	git commit -m "Automatyczna aktualizacja $date" || { log "Could not commit"; exit 1; }
	git push || { log "Could not push"; exit 1; }
else
	log "Commit not needed"
fi

log "Everything OK"
