#!/bin/bash

# My first script


while true; do
    chmod 777 ArangoDB/createJSON.js
    read -p "do you wish to create the JSON files?" yn
    case $yn in
        [Yy]* ) echo "This may take a moment";
        node ArangoDB/createJSON.js;
        tput setaf 2;
        echo "ALL JSON FILES UPDATED";
        tput sgr0;
        break;;
        [Nn]* ) tput setaf 1; echo "im sorry to hear that"; tput sgr0; break;;
        * ) tput setaf 1; echo "Please answer yes or no."; tput sgr0 ;;
    esac
done

while true; do
    read -p "do you wish to seed your Database?" yn
    case $yn in
        [Yy]* ) echo "please enter your password";
        read pswd;
        echo "please enter the DATABASE you wish to create"
        read db
        echo "please enter the COLLECTION you wish to populate";
        read collection;
        echo "please enter the number of threads you with to use";
        read threads;
        echo "BEGINNING TO SEED DB";
        arangoimport --file "/Users/blake/Desktop/SDC/Main-Gallery/ArangoDB/z_json/listings.json" --type json --server.database ${db} --collection ${collection} --threads ${threads} --server.password ${pswd} --overwrite true --create-collection true --create-database true;
        tput setaf 2;
        echo "-------------SEEDING COMPLETE!!!---------------";
        tput sgr0; break;;
        [Nn]* ) tput setaf 1; echo "nay you say"; tput sgr0; exit;;
        * ) tput setaf 1; echo "Please answer yes or no."; tput sgr0 ;;
    esac
done

# javascript.endpoints-blacklist
# echo "please enter your password";read pswd;echo "please enter the collection you wish to populate";read collection; echo "please enter the db you wish to populate"; read db; echo "BEGINNING TO SCURB DB";