#!/usr/bin/env bash

#RUN_TIME=`date +%Y-%m-%dT%I:%M:%S`
RUN_TIME="2017-06-01T12:01:01"

a-curl()
{
	URL="http://localhost:8080/fedora/objects?query=cDate%3E%3D";
	PIDS="%20pid%7Eutk.ir*";
	ARGS="&pid=true&resultFormat=xml";
	REQUEST=`curl -s ${URL}${RUN_TIME}${PIDS}${ARGS}`
	# xmlstarlet args = select text noblanks template value-of
	SESSION=`echo "$REQUEST" | xmlstarlet sel -T -B -t -v '/_:result/_:listSession/_:token'`;
	if [ -z "$SESSION" ]; then
		echo "no token";
		echo "$REQUEST" | xmlstarlet sel -T -B -t -v '//_:pid' | grep -E '[0-9]$' > /tmp/PID_LIST;
	else
		echo "token";
		echo "$REQUEST" | xmlstarlet sel -T -B -t -v '//_:pid' | grep -E '[0-9]$' > /tmp/PID_LIST;
		re-cur "$SESSION"
	fi
}

re-cur()
{
	URL="http://localhost:8080/fedora/objects?query=cDate%3E%3D";
	PIDS="%20pid%7Eutk.ir*";
	ARGS="&pid=true&resultFormat=xml&sessionToken=";
	SESSION=$1;
	REQUEST=`curl -s ${URL}${RUN_TIME}${PIDS}${ARGS}${SESSION}`
	NEW_SESSION=`echo "$REQUEST" | xmlstarlet sel -T -B -t -v '/_:result/_:listSession/_:token'`;
	if [ -z "$NEW_SESSION" ]; then
		echo "no new token";
		echo "$REQUEST" | xmlstarlet sel -T -B -t -v '//_:pid' | grep -E '[0-9]$' >> /tmp/PID_LIST;
	else
		echo "token";
		echo "$REQUEST" | xmlstarlet sel -T -B -t -v '//_:pid' | grep -E '[0-9]$' >> /tmp/PID_LIST;
		re-cur "$NEW_SESSION"
	fi
}

# Query Fedora for newly created or recently modified PIDs
echo "Querying Fedora..."
# a-curl will dump PIDs to a file (/tmp/PID_LIST)
a-curl

# Sleep for a second or two
echo "Why don't you rest for a second?"
sleep 2

# Begin updating Solr via Fedora GSearch
# The following curl command requires a username/password
echo "Updating Solr"
while read LINE;
do
	echo "i am a pid: ${LINE}"
	curl -u fedoraAdmin:fedoraAdmin -s -o /dev/null -X GET "http://localhost:8080/fedoragsearch/rest?operation=updateIndex&action=fromPid&value=$LINE";
	# curl -u fedoraAdmin:fedoraAdmin -X GET "http://localhost:8080/fedoragsest?operation=updateIndex&action=fromPid&value=utk.ir.td:100"
	# <date name="timestamp">2017-06-08T21:15:41.412Z</date>
	# <date name="timestamp">2017-06-08T21:16:41.606Z</date>
done < /tmp/PID_LIST

# Remove the temporary PID list
echo "All finished: removing the temporary PID_LIST"
rm -f /tmp/PID_LIST