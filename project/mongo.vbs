Dim connString, database, username, password, authDatabase
Dim conn, db, collection

' MongoDB connection details
connString = "mongodb://localhost:27017"
database = "uipath"
username = "root"
password = "root"
authDatabase = "admin"

' Create MongoDB connection
Set conn = CreateObject("MongoDB.Driver.MongoClient")
conn.ConnectionString = connString

' Connect to the MongoDB instance with authentication
conn.Connect username, password, authDatabase