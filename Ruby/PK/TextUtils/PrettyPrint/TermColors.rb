#!/usr/bin/env ruby

module PK
module TextUtils
module PrettyPrint

class TermColors
  def self.reset
    return "\e[0m"
  end
  def self.bold
    return "\e[1m"
  end
  def self.halfBright
    return "\e[2m"
  end
  def self.normal
    return "\e[22m"
  end
  def self.underscore
    return "\e[4m"
  end
  def self.underscoreOff
    return "\e[24m"
  end
  def self.blink
    return "\e[4m"
  end
  def self.blinkOff
    return "\e[25m"
  end
  def self.reverse
    return "\e[7m"
  end
  def self.reverseOff
    return "\e[27m"
  end
  def self.fgBlack
    return "\e[30m"
  end
  def self.fgRed
    return "\e[31m"
  end
  def self.fgGreen
    return "\e[32m"
  end
  def self.fgBrown
    return "\e[33m"
  end
  def self.fgBlue
    return "\e[34m"
  end
  def self.fgMagenta
    return "\e[35m"
  end
  def self.fgCyan
    return "\e[36m"
  end
  def self.fgWhite
    return "\e[37m"
  end
  def self.bgBlack
    return "\e[40m"
  end
  def self.bgRed
    return "\e[41m"
  end
  def self.bgGreen
    return "\e[42m"
  end
  def self.bgBrown
    return "\e[43m"
  end
  def self.bgBlue
    return "\e[44m"
  end
  def self.bgMagenta
    return "\e[45m"
  end
  def self.bgCyan
    return "\e[46m"
  end
  def self.bgWhite
    return "\e[47m"
  end
end

end
end
end

