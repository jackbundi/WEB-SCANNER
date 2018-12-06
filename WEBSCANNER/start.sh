#!/bin/bash

# version: 1.3.0
# usage: ./webscanner.sh


report_file="Report/webscan.md"

## Function fo handling error messages
function exception_handler {
  if [ $1 != 0 ]; then
    whiptail --msgbox "$2" 10 50
    exit $1
  fi
}


## Create Report/webscan.report file
function create_init(){

    if [ -e "Report/webscan.report" ]
    then 
        rm Report/webscan.report
    fi
        
    
    # Enter Server URL Address
    URL=$(whiptail --title "Website Scan Details" \
    --inputbox "ENTER URL : " 10 60 "https://web-to-scan/" 3>&1 1>&2 2>&3)
    exitstatus=$?
    exception_handler $exitstatus "[!] Canceled"
    
    # Enter Server IP Address
    DESCRIPTION=$(whiptail --title "Website Scan Details" \
    --inputbox "SCAN DESCRIPTION : " 10 60 "Website Scan Details" 3>&1 1>&2 2>&3)
    exitstatus=$?
    exception_handler $exitstatus "[!] Canceled"
    
    # Enter Server IP Address
    AUTHOR=$(whiptail --title "Website Scan Details" \
    --inputbox "ANALYST NAME : " 10 60 "JACK BUNDI" 3>&1 1>&2 2>&3)
    exitstatus=$?
    exception_handler $exitstatus "[!] Canceled"
    
    # Enter Server IP Address
    AUTHOR_EMAIL=$(whiptail --title "Website Scan Details" \
    --inputbox "ANALYST'S EMAIL : " 10 60 "exe@comapny.com" 3>&1 1>&2 2>&3)
    exitstatus=$?
    exception_handler $exitstatus "[!] Canceled"
    
    # Enter Server IP Address
    NAME=$(whiptail --title "Website Scan Details" \
    --inputbox "WEB APP NAME" 10 60 "Exe Name" 3>&1 1>&2 2>&3)
    exitstatus=$?
    exception_handler $exitstatus "[!] Canceled"

	## Wait
	{
	for ((i=0; i<=100; i+=20)); do
		sleep 1
		echo $i
	done
	} | whiptail --gauge "Please wait while preparing scan engine..." 6 60 0
  

    touch $report_file
	cat <<< '
# Strathmore WEB Scanner for Developers:

Website Vulnerability Scanner Report

Finds common vulnerabilities which affect web applications: SQL injection, XSS, OS Comand Injection, Directory Traversal and others. 

            '> $report_file
        
        echo "URL = $URL" >> $report_file
        echo "DESCRIPTION = $DESCRIPTION" >> $report_file
        echo "AUTHOR = $AUTHOR" >> $report_file
        echo "AUTHOR_EMAIL = $AUTHOR_EMAIL" >> $report_file
        echo "============================================================" >> $report_file
    
    }

### Start Scans
function webscanner(){

			
			# Shellshock Test
			{
			for ((i=0; i<=100; i+=10)); do
				sleep 1
				echo $i
			done
			} | whiptail --gauge "Starting Security Tests" 6 60 0



			echo "[+] Testing for Shellshock Vulnerability"

			cat templates/shellshock.md >> $report_file
			python library/shellshock.py $URL | tee -a $report_file
			echo ''
			echo ''

			echo "[+] Testing for Security Headers"

			cat templates/headers.md >> $report_file
			python library/test_headers.py $URL | tee -a $report_file
			echo ''
			echo ''

			echo "[+] Testing for SQL Injection Vulnerability"

			cat templates/sql.md >> $report_file
			python library/sqltest.py $URL | tee -a $report_file
			echo ''
			echo ''

			echo "[+] Testing for XSS"

			cat templates/xss.md >> $report_file
			python library/xss.py $URL | tee -a $report_file
			echo ''
			echo ''

			whiptail --title "Done" --msgbox "Scanner is done running the tests. Check Report file for details!." 8 78
	
}



function main(){

	OPTIONS=$(whiptail --title "Strathmore WEB Scanner for Developers." --menu "Select Option.." 20 60 8 \
	"1" "Start Scanner" \
	"2" "Clean Workspace" \
	"3" "Update Tool" \
	"4" "Exit" 3>&1 1>&2 2>&3)

	exitstatus=$?
	exception_handler $exitstatus "[!] Failed To Start Menu"

	if [ $OPTIONS = 1 ]; then
		create_init
		webscanner
	
		exitstatus=$?
	    exception_handler $exitstatus "[!] Failed To Start Scanner File"


	elif [ $OPTIONS = 3 ]; then
		{
			for ((i=0; i<=100; i+=20)); do
				sleep 1
				echo $i
			done
			} | whiptail --gauge "Please wait while checking for Update..." 6 60 0

		whiptail --title "Updates" --msgbox "You are using the current version. No new updates available." 8 78

	
		exitstatus=$?
	    exception_handler $exitstatus "[!] Failed To Start Scanner File"

	    
	elif [ $OPTIONS = 2 ]; then

	    if (whiptail --title "Clean Workspace" --yes-button "Continue" --no-button "Abort" \
	    --yesno "This is going to wipe all your generated reports and previous configs.." 10 60) then
		    rm -f Report/*
	    else
		    exit
	    fi

	    
	else
		exit
	fi
}


main