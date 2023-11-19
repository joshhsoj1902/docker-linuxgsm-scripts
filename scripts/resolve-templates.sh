#!/bin/bash

dest="${1:-$LGSM_HELPER_OVERLAY_DEST}"

# Setup envsub file
envsubFile=/tmp/envsub.sh
cat >$envsubFile <<EOL
#!/bin/bash

src=\$1
dest=\${src//$LGSM_HELPER_TEMPLATE_EXTENSION/}

echo \$src

envsubst < \$src > \$dest
rm \$src
EOL
chmod +x $envsubFile

#Setup gomplate file
gomplateFile=/tmp/gomplate.sh
cat >$gomplateFile <<EOL
#!/bin/bash

src=\$1
dest=\${src//$LGSM_HELPER_GOMPLATE_EXTENSION/}

echo \$src

gomplate -f \$src -o \$dest
rm \$src
EOL
chmod +x $gomplateFile


echo "Running envsubst"
find "$dest"/config-lgsm -type f -name "*$LGSM_HELPER_TEMPLATE_EXTENSION" -exec $envsubFile {} \;
find "$dest"/serverfiles -type f -name "*$LGSM_HELPER_TEMPLATE_EXTENSION" -exec $envsubFile {} \;
echo "Done envsubst"

echo "Running gomplate"
find "$dest" -type f -name "*$LGSM_HELPER_GOMPLATE_EXTENSION" -exec $gomplateFile {} \;
echo "Done gomplate"

rm $envsubFile
rm $gomplateFile
