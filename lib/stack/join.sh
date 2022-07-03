#!/bin/bash


function joinArray {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

OPTS=()
OPTS+=(fileseries)
OPTS+=(width=5)
OPTS+=(height=15)
OPTS+=(pixel_size=0.1507)
OPTS+=(overlap=0.1)
OPTS+=(layout=snake)
OPTS+=(direction=vertical)

MORE_OPTS=()
MORE_OPTS+=(--pyramid)
MORE_OPTS+=(--flip-y)
MORE_OPTS+=(--maximum-shift 30)
MORE_OPTS+=(--filter-sigma 2)
MORE_OPTS+=(--align-channel 4)
MORE_OPTS+=(-o /a/b/c/sample.ome.tiff)


for i in 1 3 5 7
do
    ROOT_DIR=a/b/c/abcd_"$i"_123/
    FILENAME_HEADER=a_b_c_40X_${i}_F{series}.ome.tiff
    OPTS+=($ROOT_DIR)
    OPTS+=(pattern=${FILENAME_HEADER})
    #export c"$i"="fileseries|""$ROOT_DIR""|pattern=""$FILENAME_HEADER"""$i"_F{series}.ome.tiff|width=""$WIDTH""|height=""$HEIGHT""|pixel_size=""$PIXEL_SIZE""|overlap=""$OVERLAP""|layout=""$LAYOUT""|direction=""$DIRECTION"
done

echo ashlar $(joinArray "|" "${OPTS[@]}") "${MORE_OPTS[@]}"
#ashlar $c1 $c3 $c5 $c7 --flip-y --pyramid --maximum-shift $MAX_SHIFT --filter-sigma $SIGMA --align-channel $ALIGN_CHANNEL -o $OUTPUT_DIR