#!/usr/bin/env ruby



###############################################################
# PARSER FOR SIMPLE TEXT FILES CONTAINING 'key = value' PAIRS #
###############################################################
# The format should be clearly defined.                       #
# But for now we have a careless implementation.              #
#                                                             #
# For now the format is, roughly speaking:                    #
# Any line containing only whitespace is ignored              #
# Any line containing whitespace, then a hash, then anything, #
# is ignored (comment).                                       #
# The rest of the lines must be in 'key=value' form.          #
# Both key and value may be surrounded with whitespace        #
# and that whitespace will be ignored.                        #
###############################################################

module PK
module TextUtils
module Formats

class SimpleDict

  # parse the contents of a file, given as single string
  # returns a map containing the key/value pairs
  # returns nil if a parse error happens
  # if any key repeats
  # REMEMBER that this is a simple naive implementation
  def self.parseText( text )
    map = {}

    text.each_line do |line|
      line.chomp!
      if (line =~ /^\s*$/)
        # nop - empty line
      elsif (line =~ /^\s*#/)
        # nop - comment
      elsif (line =~ /(.*)=(.*)/)
        key, val = $1, $2
        key.gsub!( /^\s+/, '' ); key.gsub!( /\s+$/, '' )
        val.gsub!( /^\s+/, '' ); val.gsub!( /\s+$/, '' )
        map[key] = val
      else
        # parse error
        return nil
      end
    end

    return map
  end

  def self.parseFile( path )
    text = ''
    File.open( path, 'r' ) do |f|
      while line = f.gets
        text += line
      end
    end
    return parseText( text )
  end

  def self.printText( map )
    text = ''
    map.each_key do |key|
      val = map[key]
      text += "#{key} = #{val}\n"
    end
    return text
  end

  def self.printFile( map, path )
    File.open( path, 'w' ) do |f|
      f.write( printText( map ) )
    end
  end

end

end # module Formats
end # module TextUtils
end # module PK

