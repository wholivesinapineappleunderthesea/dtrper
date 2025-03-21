#pragma D option destructive
#pragma D option quiet

pid$target:GameTest_relx64:oxygen*:entry
{
	/*
	printf("%s %llx\n", probefunc, timestamp);
	*/
	self->functime[probefunc] = timestamp;
}

pid$target:GameTest_relx64:oxygen*:return
{

	this->ts = timestamp - self->functime[probefunc];

/*
	printf("%s %llx\n", probefunc, timestamp);

	printf("%s took %llx\n", probefunc, this->ts);
	*/

	
	
	/* CHROMIUM TRACE EXAMPLE

	{ "pid":1, "tid":1, "ts":546867, "dur":121564, "ph":"X", "name":"DoThings", "args":{ "ns":121.6 } }



	NOTE: 
	
	maybe only the return probe is present, then self->functime[probefunc] is 0, so thats why the duration is in months lmao


	hrmmmmmmmmmm


	can i do if statementss here

	also maybe BEGIN and END probes to finish the json



	*/

	printf("{\"pid\":%d,\"tid\":%d,\"ts\":%llu,\"dur\":%d,\"ph\":\"X\",\"name\":\"%s\",\"args\":{\"ns\":%llu}},\n", pid, tid, timestamp 
	, this->ts, probefunc, this->ts );
}