#! /bin/bash
#
# Search index of the given name using the Scroll API.
# Documentation here: https://www.elastic.co/guide/en/elasticsearch/reference/5.4/search-request-scroll.html
#
# Required args: user, env, index, docType, query
#
# Example usage:
# ./scrollsearch --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docType "constituent" --query "search.json"
#

source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType
echo "ES search url: $searchUrl"
curl -k --user $username -X GET $searchUrl?scroll=10m -d "@$query"
