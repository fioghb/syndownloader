function downloadFile(url, mediaType, mediaName)
    
    if url == nil or url == '' then return false end
    
    local _r = syn.request or request
    
    local function randomFileName()
        return game:GetService('Players').LocalPlayer.UserId*math.random(111111, 999999)
    end
    
    local media = _r({
        Url = url;
        Method = 'GET';
    })

    if media.Success == false then
       local box = messagebox('Invalid media URL', 'Invalid media', 6)
       while task.wait() do
          if box == 11 then break
          elseif box == 10 then downloadFile(url, mediaType, mediaName) break
          elseif box == 2 then return 'Canceled'
          end
       end
       return false 
    end
    
    if mediaName == nil or mediaName == '' and media.Body then
       writefile(game:GetService('Players').LocalPlayer.UserId*math.random(111111, 999999)..'.'..mediaType, media.Body)
       return true
    elseif mediaName ~= '' or mediaName ~= nil and media.Body then
        writefile(mediaName..'.'..mediaType, media.Body)
        return true
    end
    
    return false
end

return downloadFile
