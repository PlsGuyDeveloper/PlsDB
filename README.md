# PlsDB (For Roblox Other Languages will be supported soon!)

The `PlsDB` module is a Lua library designed for interacting with the PlsDB API, allowing you to create databases, add columns, generate keys, and connect to databases.

## Functions

### PlsDB.createDatabase(dbName)
Creates a new database with the given name.

**Parameters:**
- `dbName` (string): The name of the database to be created.

**Returns:**
- `success` (boolean): Whether the database creation was successful.
- `message` (string): A message indicating the result of the operation.

### PlsDB.addColumn(dbName, columnName)
Adds a new column to an existing database.

**Parameters:**
- `dbName` (string): The name of the database where the column will be added.
- `columnName` (string): The name of the column to be added.

**Returns:**
- `success` (boolean): Whether the column addition was successful.
- `message` (string): A message indicating the result of the operation.

### PlsDB.generateKey(dbName, columnName, username, password)
Generates and adds a random key to a specified column in a database.

**Parameters:**
- `dbName` (string): The name of the database containing the column.
- `columnName` (string): The name of the column to which the key will be added.
- `username` (string): The username for authentication.
- `password` (string): The password for authentication.

**Returns:**
- `success` (boolean): Whether the key generation and addition were successful.
- `message` (string): A message indicating the result of the operation.

### PlsDB.connectToDatabase(dbName)
Connects to a database and retrieves its JSON data.

**Parameters:**
- `dbName` (string): The name of the database to connect to.

**Returns:**
- `success` (boolean): Whether the connection was successful.
- `data` (table): The JSON data retrieved from the database.

## Usage Example

```lua
local PlsDB = require(workspace.PlsDB)

local success, message = PlsDB.createDatabase("mydatabase")
print(message)

success, message = PlsDB.addColumn("mydatabase", "mycolumn")
print(message)

success, message = PlsDB.generateKey("mydatabase", "mycolumn", "myusername", "mypassword")
print(message)

-- Connect to the database and retrieve JSON data
success, data = PlsDB.connectToDatabase("mydatabase")
if success then
    print("Connected to database. Data:")
    for key, value in pairs(data) do
        print(key, value)
    end
else
    print("Failed to connect to database")
end
