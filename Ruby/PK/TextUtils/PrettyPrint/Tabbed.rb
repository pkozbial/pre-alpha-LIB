#!/usr/bin/env ruby

module PK
module TextUtils
module PrettyPrint

class Tabbed
  # SL = String List
  def self.renderFromSL( list )
    max = []
    list.each do |line|
      col = 0
      line.each do |elem|
        w = elem.length
        max[col] = w if max[col] == nil or w > max[col]
        col += 1	
      end
    end
    out = []
    (0..max.length-1).each do |col|
      (0..list.length-1).each do |ln|
        line = list[ln]
        elem = line[col]
        elem = '' if elem == nil
        elem = elem.ljust( max[col], ' ' )
        o = out[ln]
        if o == nil
          out[ln] = elem
        else
          out[ln] += elem
        end
      end
    end
    return out
  end

  def self.renderFromTS( list )
    return renderFromSL( listTStoSL( list ) )
  end

  # convert list from tabbed strings to string lists
  def self.listTStoSL( lts )
    return lts.map { |ts| TStoSL( ts ) }
  end

  def self.TStoSL( ts )
    return ts.split( "\t", -1 )
  end

end

end
end
end

