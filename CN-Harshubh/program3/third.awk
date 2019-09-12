BEGIN{
	TCPSent = 0;
	TCPRecieved = 0;
	TCPLost = 0;
	UDPSent = 0;	
	UDPRecieved = 0;
	UDPLost = 0;
	totalSent = 0;
	totalRecieved = 0;
	totalSent = 0;
}
{
	packetType = $5;
	event = $1;
	if(packetType == "tcp")
	{
		if(event == "+")
			TCPSent++;
		else if(event == "r")
			TCPRecieved++;
		else if(event == "d")
			TCPLost++;
	}
	else if(packetType == "cbr")
	{
		if(event == "+")
			UDPSent++;
		else if(event == "r")
			UDPRecieved++;
		else if(event == "d")
			UDPLost++;
	}
}
END{
	totalSent = TCPSent + UDPSent;
	totalLost = TCPLost + UDPLost;
	printf("TCP Packets sent: %d\n",TCPSent);
	printf("TCP Packets recieved: %d\n",TCPRecieved);
	printf("TCP Packets dropped: %d\n",TCPLost);
	printf("UDP Packets sent: %d\n",UDPSent);
	printf("UDP Packets recieved: %d\n",UDPRecieved);
	printf("UDP Packets dropped: %d\n",UDPLost);
	printf("Total Packets sent: %d\n",totalSent);
	printf("Total Packets recieved: %d\n",totalSent-totalLost);
	printf("Total Packets dropped: %d\n",totalLost);
}
	
	
	
	
