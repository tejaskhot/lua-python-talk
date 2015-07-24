local socket = require("socket")
host = host or "Tejas"
port = port or 12345
print(host, port)
if arg then
	host = arg[1] or host
	port = arg[2] or port
end
print("Attempting connection to host '" ..host.. "' and port " ..port.. "...")
conn=socket.tcp()
c = assert(conn.connect(host, port))
print("Connected! Please type stuff (empty line to stop):")

-- prepare some data to send
-- We first make sure the random seed is the same for everyone
torch.manualSeed(1234)
-- choose a dimension
N = 5
-- create a random NxN matrix
A = torch.rand(N, N)

assert(c:send(A))
-- l = io.read()
-- while l and l ~= "" and not e do
-- 	assert(c:send(l .. "\n"))
-- 	l = io.read()
-- end