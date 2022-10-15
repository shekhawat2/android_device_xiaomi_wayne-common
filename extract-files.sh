#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libMiWatermark.so)
            grep -q "libpiex-v29.so" "${2}" || "${PATCHELF}" --add-needed "libpiex-v29.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE_COMMON=sdm660-common
export DEVICE_SPECIFIED_COMMON_DEVICE="jasmine_sprout wayne"

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
