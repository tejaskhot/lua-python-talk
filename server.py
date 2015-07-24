#!/usr/bin/python           # This is server.py file

import socket               # Import socket module

s = socket.socket()         # Create a socket object
host = socket.gethostname() # Get local machine name
port = 12345                # Reserve a port for your service.
s.bind((host, port))        # Bind to the port
RECV_BUFFER = 4096 # Advisable to keep it as an exponent of 2

print "Server started. Listening on port ", port
s.listen(5)                 # Now wait for client connection.
while True:
   c, addr = s.accept()     # Establish connection with client.
   print 'Got connection from', addr
   c.send('Thank you for connecting')
   while 1:
	   data = c.recv(RECV_BUFFER)
	   print data
	   if data=='exit':
		   c.close()                # Close the connection