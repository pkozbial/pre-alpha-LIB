#!/usr/bin/env ruby



###############################################################
# PARSER FOR LISTS OF INTEGERS GIVEN AS TEXT (WITH RANGES)    #
###############################################################
# Things like:                                                #
# 2,4                                                         #
# 3-7,9                                                       #
# 4-9,11-13                                                   #
# always on one line, without spaces                          #
###############################################################

module PK
module TextUtils
module Formats

class IntList

 public

  class Range
    attr_accessor :from
    attr_accessor :to
  end

  # constructs and returns an IntList from text 
  def self.parseText( text )
    input = text
    out = IntList.new
    while true
      if    input =~ /\A((\d+)\-(\d+))/
        print "RANGE #{$1}\n"
        range = Range.new
        range.from = $2.to_i
        range.to   = $3.to_i
        out.addRange( range )
      elsif input =~ /\A(\d+)/
        print "NUM\n"
        range = Range.new
        range.from = $1.to_i
        range.to   = $1.to_i
        out.addRange( range )
      elsif input =~ /\A(\,)/
        print "COMMA\n"
      elsif input =~ /\A(.)/
        raise "Invalid IntList format"
      else 
        return out
      end
      input = input[$1.length, input.length-$1.length]
    end
  end

  # returns text representation
  def printText
    out = ''
    @ranges.each do |r|
      out += ',' unless out == ''
      if r.from == r.to
        out += r.from.to_s
      else
        out += "#{r.from}-#{r.to}"
      end
    end
    return out
  end

  def eachGivenRange
    @ranges.each { |r| yield r }
  end

  def eachValue
    @ranges.each do |r|
      (r.from..r.to).each { |v| yield v }
    end
  end

  def addRange(range)
    @ranges += [range]
  end

 private

  @ranges

  def initialize
    @ranges = []
  end

end

end # module Formats
end # module TextUtils
end # module PK

