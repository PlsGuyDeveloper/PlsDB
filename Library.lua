local PlsDB = {}

-- Function to create a database
function PlsDB.createDatabase(dbName)
    local url = "https://plsdb.itspls.repl.co/create/database/" .. dbName
    local response = game:GetService("HttpService"):PostAsync(url, "", Enum.HttpContentType.ApplicationUrlEncoded)
    
    local success = response == "true"
    local message = success and ("Database " .. dbName .. " created successfully") or "Failed to create database"
    
    return success, message
end

-- Function to add a column to a database
function PlsDB.addColumn(dbName, columnName)
    local url = "https://plsdb.itspls.repl.co/edit/" .. dbName .. "/" .. columnName
    local response = game:GetService("HttpService"):RequestAsync({
        Url = url,
        Method = "PUT"
    })
    
    local success = response.Success
    local message = success and ("Column " .. columnName .. " added to " .. dbName .. " successfully") or "Failed to add column"
    
    return success, message
end

-- Function to generate a key in a column
function PlsDB.generateKey(dbName, columnName, username, password)
    local url = "https://plsdb.itspls.repl.co/" .. dbName .. "/" .. columnName .. "/keygen"
    local payload = {
        credentials = { username = username, password = password }
    }
    local response = game:GetService("HttpService"):PostAsync(url, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
    
    local success = response == "true"
    local message = success and "Key generated and added successfully" or "Failed to generate key"
    
    return success, message
end

-- Function to connect to a database and retrieve its JSON data
function PlsDB.connectToDatabase(dbName)
    local url = "https://plsdb.itspls.repl.co/connect/" .. dbName
    local response = game:GetService("HttpService"):GetAsync(url)
    
    local success = response ~= nil
    local data = success and game:GetService("HttpService"):JSONDecode(response) or {}
    
    return success, data
end

return PlsDB
