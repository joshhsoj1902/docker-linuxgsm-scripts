#!/bin/bash

# TODO: Consider swapping to gomplate to allow for better templating

dest="${1:-$LGSM_HELPER_OVERLAY_DEST}"

tmpFile=/tmp/envsub.sh

cat >$tmpFile <<EOL
#!/bin/bash

src=\$1
dest=\${src//$LGSM_HELPER_TEMPLATE_EXTENSION/}

echo \$src

envsubst < \$src > \$dest
rm \$src
EOL
chmod +x $tmpFile


echo "Running envsubst"
find $dest/config-lgsm -type f -name '*'$LGSM_HELPER_TEMPLATE_EXTENSION -exec $tmpFile {} \;
find $dest/serverfiles -type f -name '*'$LGSM_HELPER_TEMPLATE_EXTENSION -exec $tmpFile {} \;
echo "Done envsubst"

# rm $tmpFile