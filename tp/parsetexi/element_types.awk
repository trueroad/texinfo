# Copyright 2014, 2015 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

BEGIN {
  print "/* This file automatically generated by element_types.awk */"
  print "enum element_type {"
  print "ET_NONE,"
}

!/^$/ && !/^#/ {
    print "ET_" $1 ","
    array = array "\"" $1 "\",\n"
}

END {
  print "};"
  print
  print "extern char *element_type_names[];"
  print "char *element_type_names[] = {" > "element_types.c"
  print "0," > "element_types.c"
  print array > "element_types.c"
  print "};" > "element_types.c"
}

function output_array (string)
{
    print string > "element_types.c"
}