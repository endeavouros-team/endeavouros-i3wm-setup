#!/usr/bin/env bash

# Copyright (C) 2025 Johannes Kamprad
# SPDX-License-Identifier: GPL-3.0-or-later

# empty_workspace - open a new workspace automatically named with next number on i3


MAX_DESKTOPS=20

WORKSPACES=$(seq -s '\n' 1 1 ${MAX_DESKTOPS})

EMPTY_WORKSPACE=$( (i3-msg -t get_workspaces | tr ',' '\n' | grep num | awk -F:  '{print int($2)}' ; \
            echo -e ${WORKSPACES} ) | sort -n | uniq -u | head -n 1)

i3-msg workspace ${EMPTY_WORKSPACE}
