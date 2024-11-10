#==============================================================#
# File      :   Makefile
# Desc      :   pgsty/pgsql-rpm repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

DEVEL_PATH = sv:/data/image


###############################################################
#                        2. Syncing                           #
###############################################################
# push/pull project to/from building host
push:
	rsync -avc ./ $(DEVEL_PATH)/
pushd:
	rsync -avc --delete ./ $(DEVEL_PATH)/
pull:
	rsync -avc $(DEVEL_PATH)/ ./
pulld:
	rsync -avc --delete $(DEVEL_PATH)/ ./


###############################################################
#                         Inventory                           #
###############################################################
.PHONY: push pushd pull pulld push7 push8 push9 push-el pushss