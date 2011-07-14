#!/usr/bin/env ruby


module PK
module DateTime
module DateUtils

require 'date'

class DateParser
  def self.parseSimple( txt )
    txt.gsub!( /^\s+/, '' )
    txt.gsub!( /\s+$/, '' )
    if txt =~ /^(\d\d\d\d)\-(\d\d)\-(\d\d)$/
      return Date.civil( $1.to_i, $2.to_i, $3.to_i )
    else
      return nil
    end
  end
end

class DateCalculator
  def self.tomorrow
    return Date.today+1
  end
  def self.yesterday
    return Date.today-1
  end

  def self.isMonday?( date )
    return date.cwday == 1
  end
  def self.isTuesday?( date )
    return date.cwday == 2
  end
  def self.isWednesday?( date )
    return date.cwday == 3
  end
  def self.isThursday?( date )
    return date.cwday == 4
  end
  def self.isFriday?( date )
    return date.cwday == 5
  end
  def self.isSaturday?( date )
    return date.cwday == 6
  end
  def self.isSunday?( date )
    return date.cwday == 7
  end

  def self.nearestMonday
    date = Date.today
    until self.isMonday?( date )
      date = date+1
    end
    return date
  end
  
  def self.nearestWeekday( weekday )
    date = Date.today
    until date.cwday == weekday
      date = date+1
    end
    return date
  end
  def self.lastWeekday( weekday )
    date = Date.today
    until date.cwday == weekday
      date = date-1
    end
    return date
  end

  def self.nextWeekday( weekday )
    date = Date.today+1
    until date.cwday == weekday
      date = date+1
    end
    return date
  end
  def self.prevWeekday( weekday )
    date = Date.today-1
    until date.cwday == weekday
      date = date-1
    end
    return date
  end

end

class DatePrinter
  def self.today
    return self.print( Date.today )
  end
  def self.print( date )
    return sprintf "%04d-%02d-%02d", date.year, date.mon, date.day
  end
  def self.shortWeekday( date )
    wd = date.cwday
    return "Mon" if wd == 1
    return "Tue" if wd == 2
    return "Wed" if wd == 3
    return "Thu" if wd == 4
    return "Fri" if wd == 5
    return "Sat" if wd == 6
    return "Sun" if wd == 7
    return "???"
  end
  def self.descriptive( date )
    diff = date - Date.today
    if diff == 0
      return "today"
    elsif diff == 1
      return "tomorrow"
    elsif diff == -1
      return "yesterday"
    elsif 1 < diff and diff <= 7
      return "next " + self.shortWeekday( date )
    elsif -7 <= diff and diff < -1
      return "last " + self.shortWeekday( date )
    else
      return ""
    end
  end
  def self.fullDesc( d )
    return "#{self.print(d)} #{self.shortWeekday(d)} "+
          "(#{self.diffDesc(Date.today, d)}) #{self.descriptive(d)}"
  end
  def self.diffDesc( date1, date2 )
    diff = date2 - date1
    pref = ''
    suff = ''
    if diff < 0
      diff = -diff
      suff = ' ago'
    else
      pref = 'in '
    end
    weeks = (diff/7).to_i
    if weeks > 0
      days = diff - (weeks*7)
      return pref + "#{weeks} weeks #{days} days" + suff
    else
      return pref + "#{diff} days" + suff
    end
  end
end

end
end
end

