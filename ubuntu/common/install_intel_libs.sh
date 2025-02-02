#!/bin/bash
set -ex

# Intel® oneAPI Math Kernel Library
case ${DISTRIBUTION} in
    "ubuntu18.04") INTEL_MKL_VERSION="2023.1.0.46342";
        RELEASE_VERSION="cd17b7fe-500e-4305-a89b-bd5b42bfd9f8";
        CHECKSUM="cc28c94cab23c185520b93c5a04f3979d8da6b4c90cee8c0681dd89819d76167";; 
    "ubuntu20.04") INTEL_MKL_VERSION="2023.1.0.46342";
        RELEASE_VERSION="cd17b7fe-500e-4305-a89b-bd5b42bfd9f8";
        CHECKSUM="cc28c94cab23c185520b93c5a04f3979d8da6b4c90cee8c0681dd89819d76167";;
    "ubuntu22.04") INTEL_MKL_VERSION="2023.1.0.46342";
        RELEASE_VERSION="cd17b7fe-500e-4305-a89b-bd5b42bfd9f8";
        CHECKSUM="cc28c94cab23c185520b93c5a04f3979d8da6b4c90cee8c0681dd89819d76167";;
    *) ;;
esac

ONE_MKL_DOWNLOAD_URL=https://registrationcenter-download.intel.com/akdlm/IRC_NAS/${RELEASE_VERSION}/l_onemkl_p_${INTEL_MKL_VERSION}_offline.sh
$COMMON_DIR/write_component_version.sh "INTEL_ONE_MKL" ${INTEL_MKL_VERSION}
$COMMON_DIR/download_and_verify.sh ${ONE_MKL_DOWNLOAD_URL} ${CHECKSUM}
sh ./l_onemkl_p_${INTEL_MKL_VERSION}_offline.sh -s -a -s --eula accept
