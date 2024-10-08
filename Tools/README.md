# Usage

## Get the latest API

```
curl -s https://api.github.com/repos/openfoodfacts/openfoodfacts-server/contents/docs/api/ref | jq -r '.[].download_url' > file_urls.txt
```

## Adapt openapi yaml to Apple's openapi generator

In Tools folder there's a python script to adapt openapi spect to OFF 

## Generate clients and types

In Tools folder there's a shell script to regenerate Client and Types