#! /bin/bash

# Checkout searxng, filter all engines into a separate file
# to make it easy to paste the result in a host config

git clone https://github.com/searxng/searxng.git
mv searxng/searx/settings.yml ./searx-settings.yml
grep "^  - name:" searx-settings.yml | sed 's/name: //' > ./searx-engines-only.yml

echo "Edit searx-engines-only.yml"
echo "Paste the result in host file, beneath var searxng_engines_restrict:"
echo "If items in the result need to be kept, set searxng_engines_restrict_keep to true"
