# reprex.sh: poor man's reprex

`reprex.sh` is a bash script that creates a [reprex](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example/16532098) from a shell script. It:

* runs R given an R script (possibly from stdin)
* outputs the R commands
* outputs the output from R after comment `#` symbols

Requires: `bash`

## Example

Given an R script file, `buf.R` that contains
```
library(terra)
v = vect("LINESTRING(0 85,1 85)") 
crs(v) = 'EPSG:4326'
v
(b = buffer(v, 10000))
```
run the script with
```bash
reprex.sh buf.R
```
to get the following output:
```r
library(terra)
# terra 1.7.35
v = vect("LINESTRING(0 85,1 85)")
crs(v) = 'EPSG:4326'
v
#  class       : SpatVector
#  geometry    : lines
#  dimensions  : 1, 0  (geometries, attributes)
#  extent      : 0, 1, 85, 85  (xmin, xmax, ymin, ymax)
#  coord. ref. : lon/lat WGS 84 (EPSG:4326)
(b = buffer(v, 10000))
#  class       : SpatVector
#  geometry    : polygons
#  dimensions  : 1, 0  (geometries, attributes)
#  extent      : -1.027163, 2.027163, 84.91046, 85.08954  (xmin, xmax, ymin, ymax)
#  coord. ref. :
```
(taken from [here](https://github.com/rspatial/terra/issues/1184))
