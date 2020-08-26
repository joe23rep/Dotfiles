words = {"One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine "}
levels = {"thousand ", "million ", "billion ", "trillion ", "quadrillion ", "quintillion ", "sextillion ", "septillion ", "octillion ", [0] = ""}
iwords = {"Ten ", "Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety "}
twords = {"Eleven ", "Twelve ", "Thirteen ", "Fourteen ", "Fifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen "}

function digits(n)
  local i, ret = -1
  return function()
    i, ret = i + 1, n % 10
    if n > 0 then
      n = math.floor(n / 10)
      return i, ret
    end
  end
end

level = false
function getname(pos, dig)
  level = level or pos % 3 == 0
  if(dig == 0) then return "" end
  local name = (pos % 3 == 1 and iwords[dig] or words[dig]) .. (pos % 3 == 2 and "hundred " or "")
  if(level) then name, level = name .. levels[math.floor(pos / 3)], false end
  return name
end

function numberToWord(number)
    if(number == 0) then return "Zero " end
    vword = ""
    for i, v in digits(number) do
      vword = getname(i, v) .. vword
    end

    for i, v in ipairs(words) do
    
      vword = vword:gsub("Ten " .. v, twords[i])
      vword = vword:gsub("ty " .. v, "ty " .. v)
    end
    return vword
end

function conky_boringTime()
    hour = os.date("%H") + 0
    minute = os.date("%M") + 0
    return numberToWord(hour) .. numberToWord(minute)
end

function conky_awesomeTime()
    hour = os.date("%H") + 0
    minute = os.date("%M") + 0
    hour = hour % 12
    if(hour == 0) then 
        hour, nextHourWord = 12, "one " 
    else
        nextHourWord = numberToWord(hour+1)
    end
    hourWord = numberToWord(hour)
    if(minute == 0 ) then 
        return hourWord .. "o'clock"
    elseif(minute == 30) then
        return "half past " .. hourWord
    elseif(minute == 15) then
        return "a quarter past " .. hourWord 
    elseif(minute == 45) then
        return "a quarter to " .. nextHourWord 
    else
        if(minute < 30) then
            return numberToWord(minute) .. "past " .. hourWord
        else
            return numberToWord(60-minute) .. "to " .. nextHourWord
        end
    end
end

function conky_getHourWord()
    return numberToWord(os.date("%I") + 0)
end

function conky_getMinuteWord()
    return numberToWord(os.date("%M") + 0)
end