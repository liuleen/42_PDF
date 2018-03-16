#!/usr/bin/env ruby

def CorrectPath(str)

  str = str.chars

  r_count = 0
  d_count = 0

  (0...str.length).each {|x|
    if str[x] == "r" then r_count += 1 end
    if str[x] == "d" then d_count += 1 end
    if str[x] == "u" then d_count -= 1 end
    if str[x] == "l" then r_count -= 1 end
  }

  (0...str.length).each {|x|
    if str[x] == "?" and r_count < 4 and str[x-1] != "l" and str[x+1] != "l"
      str[x] = "r"
      r_count += 1
    end
    if str[x] == "?" and d_count < 4 and str[x-1] != "u" and str[x+1] != "u"
      str[x] = "d"
      d_count += 1 
    end
    if str[x] == "?" and r_count > 4 and str[x-1] != "r" and str[x+1] != "r"
      str[x] = "l"
      r_count -= 1
    end
    if str[x] == "?" and d_count > 4 and str[x-1] != "d" and str[x+1] != "d"
      str[x] = "u"
      d_count -= 1
    end
  }

  (0...str.length).each {|x|
    if str[x] == "?" and str[x-1] == "u" and str[x+1] == "r"
      str[x] = "u"
      d_count -= 1
    end
    if str[x] == "?" and d_count < 4
      str[x] = "d"
      d_count += 1
    end
  }

  (0...str.length).each {|x|
    if str[x] == "?" and str[x-1] == "r" and str[x+1] == "d"
      str[x] = "r"
      r_count -= 1
    end
    if str[x] == "?" and r_count < 4
      str[x] = "l"
      r_count += 1
    end
  }

  str.join

end
   
# keep this function call here    
puts CorrectPath(STDIN.gets)
