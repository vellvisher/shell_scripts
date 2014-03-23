#/bin/sh
soc_username=vaarnan

if [[ -z "$1" ]] || [[ -z "$2" ]]; then
        echo "Usage: (file) (printer) [page-range]"
        exit 1;
fi

file_name="\""$(basename "$1" 2>&1)"\""
ps_file_name="\""$(basename "$1" .pdf 2>&1).'ps'"\""
page_ranges=""

if [ -n "$3" ]
  then
    page_ranges=" -o page-ranges=$3"
fi

convert_command="pdftops "$file_name

# Normal printing mode
print_command="lpr -P $2 $page_ranges "$ps_file_name""

# Lecture notes
# print_command="lpr -o number-up=4 -o number-up-layout=btlr -o sides=two-sided-short-edge -P $2 $ps_file_name"

# print_command="lpr -P -o sides=two-sided-short-edge $2 $ps_file_name"

clean_up="rm $file_name $ps_file_name"
convert_print_cleanup_command="$convert_command && $print_command && $clean_up"

# No soc defined
scp "$1" $soc_username@sunfire.comp.nus.edu.sg:
ssh $soc_username@sunfire.comp.nus.edu.sg $convert_print_cleanup_command
