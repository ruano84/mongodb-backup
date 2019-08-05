function azure_upload() {
  local source="$1"
  local destination="$2"
  local accountname="$3"
  local container="$4"
  local azureSAS="$5"
  echo "uploading ${source} as ${destination}"
  curl -X PUT \
  "https://${accountname}.blob.core.windows.net/${container}/${destination}?${azureSAS}" \
  -H 'Accept: Application/json' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: text/plain; charset=UTF-8' \
  -H 'cache-control: no-cache' \
  -H "x-ms-blob-content-disposition: attachment; filename=\"${destination}\"" \
  -H 'x-ms-blob-type: BlockBlob' \
  --data-binary "@${source}"
}