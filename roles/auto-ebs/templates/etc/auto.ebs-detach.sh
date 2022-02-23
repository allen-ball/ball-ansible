#!/bin/bash
# ----------------------------------------------------------------------------
# $Id$
# ----------------------------------------------------------------------------
#
# exec 1> >(logger -s -t $(basename $0)) 2>&1
. /etc/aws.rc

# detach-volume-if-not-mounted key(volume)
detach-volume-if-not-mounted() {
    local key="$1"
    local instance="$(ec2-get-volume-attachment-instance ${key})"
    local state="$(ec2-get-volume-attachment-state ${key})"

    if [ "${instance}" == "${INSTANCE}" -a "${state}" == "attached" ]; then
        local device="$(ec2-get-volume-attachment-device ${key})"

        if [ "$(metadata block-device-mapping/ami)" != "${device}" ]; then
            local mntpt=$(lsblk -no MOUNTPOINT ${device})

            if [ "${mntpt}" == "" ]; then
                ec2-detach-volume ${key}
            fi
        fi
    fi
}

for volume in $(list-attached-volumes); do
    detach-volume-if-not-mounted ${volume}
done

exit 0
