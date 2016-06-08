bold=$(tput bold)
normal=$(tput sgr0)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color



printf "${RED}========================================================= \n"
printf "Bash Execute SQL Files \n"
printf "Author: Ef \n"
printf "Ver=0.1 \n"
printf "=========================================================${NC} \n"

FILES=sql/*


function execute {
      printf "=========================================================\n"
      printf "${GREEN}${bold}Processing $3 file...${NC} \n"
      printf "                                                          \n"
      if mysql -u$1 -p$2 $4 < $3
      then
            printf "${GREEN}DONE!${NC} \n"
      fi
      printf "========================================================= \n"
      # take action on each file. $f store current file name
}

function loopfiles {
  FILES=sql/*
    for f in $FILES
        do

         if [ "$f" != "sql/init.sql" ]
         then
           execute $1 $2 $f $3
         fi
        done
}

if [ ! -d "sqlbackups" ]; then
  mkdir "sqlbackups";
fi

current_date_time="`date +%Y%m%d%H%M%S`";
mysqldump -u$1 -p$2 $4 > "sqlbackups/$4BACKUP$current_date_time.sql";

case "$3" in

migrate-sql)
  execute $1 $2 sql/init.sql $4
  loopfiles $1 $2 $4
    ;;
init-only)
    execute $1 $2 sql/init.sql $4
    ;;
sql-commands-only)
  loopfiles $1 $2 $4
    ;;
*) printf "No Sqlcommand \n"
   ;;
esac



