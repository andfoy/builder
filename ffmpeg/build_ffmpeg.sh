#!/usr/bin/env bash

set -eou pipefail

if [[ "$OSTYPE" == "msys" ]]; then
    FFMPEG_SHA=""
    # FFMPEG_TARBALL=$(find tmp -type f -name *.tar.gz)
    for FFMPEG_TARBALL in tmp/*.tar.gz; do
        echo $FFMPEG_TARBALL
        FFMPEG_SHA=$(sha256sum $FFMPEG_TARBALL)
        echo $FFMPEG_SHA
    done

fi

conda install -yq conda-build conda-verify
(
    set -x
    conda build --output-folder ffmpeg/output "ffmpeg/recipe"
)
