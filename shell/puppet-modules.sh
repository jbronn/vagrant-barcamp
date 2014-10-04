#!/bin/bash
set -e

PUPPET_MODULES="garethr-docker"
MODULEPATH=/vagrant/modules

# Install prerequisite Puppet modules in $MODULEPATH,
# if they aren't already using the `puppet module` tool.
for module in $PUPPET_MODULES
do
    # Test for existence of module (portion of module name after '-')
    # before trying to run `puppet module install`.
    test -d $MODULEPATH/${module#*-} || puppet module install --modulepath $MODULEPATH $module
done
