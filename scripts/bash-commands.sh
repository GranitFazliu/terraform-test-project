#!/bin/bash

# Write text to file
echo -e "This is a simple text.\nThat includes dots . xyztyur and other wors like xyzab.\n I think xzy is better." > solab.log
echo "Content of solab.log:"
cat solab.log
echo -e "End of solab.log\n"
# Append text to file
echo "While this will jus keep getting reapted if called more times." >> hellocare.log
echo "Content of hellocare.log:"
cat hellocare.log
echo -e "End of hellocare.log\n"

# Copy content of one file to another
cp solab.log solab_copy.log
echo "Content of solab_copy.log:"
cat solab_copy.log
echo -e "End of solab_copy.log\n"

# Count dots in solab.log
dot_count=$(grep -o '\.' solab.log | wc -l)
echo -e "Number of dots: $dot_count\n"

# Count lines in solab.log
line_count=$(wc -l < solab.log)
echo -e "Number of lines: $line_count\n"

# Find words starting with 'xyz' in solab.log
xyz_words=$(grep -o '\bxyz\w*' solab.log)
echo "Words starting with 'xyz':"
echo "$xyz_words"
