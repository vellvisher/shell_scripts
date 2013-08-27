#/bin/sh
soc_username=vaarnan

file_name=$(basename "$1" 2>&1)
ps_file_name=$(basename "$1" .pdf 2>&1).'ps'
page_ranges=""

if [ -n "$3" ]
  then
    page_ranges=" -o page-ranges=$3"
fi

convert_command="pdftops $file_name"
print_command="lpr -P $page_ranges $2 $ps_file_name"
#print_command="lpr -P -o sides=two-sided-long-edge $2 $ps_file_name"
clean_up="rm $file_name $ps_file_name"
convert_print_cleanup_command="$convert_command && $print_command && $clean_up"

# No soc defined
scp $1 $soc_username@sunfire.comp.nus.edu.sg:
ssh $soc_username@sunfire.comp.nus.edu.sg $convert_print_cleanup_command
