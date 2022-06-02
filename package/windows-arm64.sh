#!/bin/bash

set -e

cmake . -B build/ \
	-DCMAKE_BUILD_TYPE="Release" \
	-DCMAKE_INTERPROCEDURAL_OPTIMIZATION:BOOL="ON" \
	-DCMAKE_C_COMPILER="aarch64-w64-mingw32-clang" \
	-DCMAKE_C_FLAGS="-static -s" \
	-DCMAKE_CXX_COMPILER="aarch64-w64-mingw32-clang++" \
	-DCMAKE_CXX_FLAGS="-static -s"
cmake --build build/ -j$(nproc)

source build/config/config.sh
VERSION=$VERSION-windows-arm64

source package/common.sh

export _platform="windows"
export _archive="7z"
export _url_extension="url"
export _binary_suffix=".exe"

_Dist="字体合并补全工具-压缩字库-$VERSION" \
_dist="WarFontMerger-XS-$VERSION" \
_cjk="WFM-Sans-CJK-XS-Regular" \
_latin="WFM-Sans-LCG-Apache-Regular" \
package_sc

_Dist="字体合并补全工具-简体中文-$VERSION" \
_dist="WarFontMerger-SC-$VERSION" \
_cjk="WFM-Sans-CJK-SC-Medium" \
_latin="WFM-Sans-LCG-Medium" \
package_sc

_Dist="字型合併補全工具-傳統字形-$VERSION" \
_dist="WarFontMerger-CL-$VERSION" \
_cjk="WFM-Sans-CJK-CL-Medium" \
_latin="WFM-Sans-LCG-Medium" \
package_tc
