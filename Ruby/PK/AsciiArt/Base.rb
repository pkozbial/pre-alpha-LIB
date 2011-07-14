#!/usr/bin/env ruby


module PK
module AsciiArt
module Base

# DEVEL HELPER - UNICODE FRAMES

#   ╶      ╺
#   ─      ━      ═
#   ╴      ╸
#
#  ╷│╵    ╻┃╹     ║ 
#
# ┌ ┬ ┐  ┏ ┳ ┓  ╔ ╦ ╗
#
# ├ ┼ ┤  ┣ ╋ ┫  ╠ ╬ ╣
#
# └ ┴ ┘  ┗ ┻ ┛  ╚ ╩ ╝
#

# FRAME CONVERSIONS

def self.framesToBold( str )
  s = String.new( str )
  s.gsub!( /╶/, '╺' )
  s.gsub!( /─/, '━' )
  s.gsub!( /╴/, '╸' )
  s.gsub!( /╷/, '╻' )
  s.gsub!( /│/, '┃' )
  s.gsub!( /╵/, '╹' )
  s.gsub!( /┌/, '┏' )
  s.gsub!( /┬/, '┳' )
  s.gsub!( /┐/, '┓' )
  s.gsub!( /├/, '┣' )
  s.gsub!( /┼/, '╋' )
  s.gsub!( /┤/, '┫' )
  s.gsub!( /└/, '┗' )
  s.gsub!( /┴/, '┻' )
  s.gsub!( /┘/, '┛' )
  return s
end

def self.framesToCalligraphy( str )
  s = String.new( str )
  # no change for '╶'
  # no change for '─'
  # no change for '╴'
  s.gsub!( /╷/, '╻' )
  s.gsub!( /│/, '┃' )
  s.gsub!( /╵/, '╹' )
  s.gsub!( /┌/, '┎' )
  s.gsub!( /┬/, '┰' )
  s.gsub!( /┐/, '┒' )
  s.gsub!( /├/, '┠' )
  s.gsub!( /┼/, '╂' )
  s.gsub!( /┤/, '┨' )
  s.gsub!( /└/, '┖' )
  s.gsub!( /┴/, '┸' )
  s.gsub!( /┘/, '┚' )
  return s
end

def self.framesToRound( str )
  s = String.new( str )
  s.gsub!( /┌/, '╭' )
  s.gsub!( /┐/, '╮' )
  s.gsub!( /└/, '╰' )
  s.gsub!( /┘/, '╯' )
  return s
end

# FONTS

FONT_3x3 = 
{
  ' ' =>
  [
    ' ',
    ' ',
    ' ',
  ],
  ':' =>
  [
    '╷',
    ' ',
    '╵',
  ],
  '-' =>
  [
    ' ',
    '─',
    ' ',
  ],
  '0' =>
  [
    '┌─┐',
    '│ │',
    '└─┘',
  ],
  '1' =>
  [
    '  ╷',
    '  │',
    '  ╵',
  ],
  '2' =>
  [
    '╶─┐',
    '┌─┘',
    '└─╴',
  ],
  '3' =>
  [
    '╶─┐',
    ' ─┤',
    '╶─┘',
  ],
  '4' =>
  [
    '╷ ╷',
    '└─┤',
    '  ╵',
  ],
  '5' =>
  [
    '┌─╴',
    '└─┐',
    '╶─┘',
  ],
  '6' =>
  [
    '┌─╴',
    '├─┐',
    '└─┘',
  ],
  '7' =>
  [
    '╶─┐',
    '  │',
    '  ╵',
  ],
  '8' =>
  [
    '┌─┐',
    '├─┤',
    '└─┘',
  ],
  '9' =>
  [
    '┌─┐',
    '└─┤',
    '╶─┘',
  ],
}

FONT_3x3_bold = {}
FONT_3x3.each_key do |char|
  FONT_3x3_bold[char] = FONT_3x3[char].map { |str| framesToBold( str ) }
end

FONT_7x7 =
{
  ' ' =>
  [
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
  ],
  ':' =>
  [
    ' ',
    '@',
    ' ',
    ' ',
    ' ',
    '@',
    ' ',
  ],
  '0' =>
  [
    ' @@@@@ ',
    '@     @',
    '@     @',
    '@     @',
    '@     @',
    '@     @',
    ' @@@@@ ',
  ],
  '1' =>
  [
    '    @  ',
    '   @@  ',
    '  @ @  ',
    ' @  @  ',
    '    @  ',
    '    @  ',
    '  @@@@@',
  ],
  '2' =>
  [
    ' @@@@@ ',
    '@     @',
    '      @',
    ' @@@@@ ',
    '@      ',
    '@      ',
    '@@@@@@@',
  ],
  '3' =>
  [
    ' @@@@@ ',
    '@     @',
    '      @',
    '   @@@ ',
    '      @',
    '@     @',
    ' @@@@@ ',
  ],
  '4' =>
  [
    '   @@  ',
    '  @ @  ',
    ' @  @  ',
    '@   @  ',
    '@@@@@@@',
    '    @  ',
    '    @  ',
  ],
  '5' =>
  [
    '@@@@@@@',
    '@      ',
    '@      ',
    ' @@@@@ ',
    '      @',
    '@     @',
    ' @@@@@ ',
  ],
  '6' =>
  [
    '   @@@@',
    ' @@    ',
    '@      ',
    '@@@@@@ ',
    '@     @',
    '@     @',
    ' @@@@@ ',
  ],
  '7' =>
  [
    '@@@@@@@',
    '      @',
    '     @ ',
    '    @  ',
    '   @   ',
    '   @   ',
    '   @   ',
  ],
  '8' =>
  [
    ' @@@@@ ',
    '@     @',
    '@     @',
    ' @@@@@ ',
    '@     @',
    '@     @',
    ' @@@@@ ',
  ],
  '9' =>
  [
    ' @@@@@ ',
    '@     @',
    '@     @',
    ' @@@@@@',
    '      @',
    '    @@ ',
    '@@@@   ',
  ],

}

FONT_7x7_straight =
{
  ' ' =>
  [
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
  ],
  ':' =>
  [
    ' ',
    '@',
    ' ',
    ' ',
    ' ',
    '@',
    ' ',
  ],
  '0' =>
  [
    '@@@@@@@',
    '@     @',
    '@     @',
    '@     @',
    '@     @',
    '@     @',
    '@@@@@@@',
  ],
  '1' =>
  [
    '      @',
    '      @',
    '      @',
    '      @',
    '      @',
    '      @',
    '      @',
  ],
  '2' =>
  [
    '@@@@@@@',
    '      @',
    '      @',
    '@@@@@@@',
    '@      ',
    '@      ',
    '@@@@@@@',
  ],
  '3' =>
  [
    '@@@@@@@',
    '      @',
    '      @',
    '   @@@@',
    '      @',
    '      @',
    '@@@@@@@',
  ],
  '4' =>
  [
    '@     @',
    '@     @',
    '@     @',
    '@@@@@@@',
    '      @',
    '      @',
    '      @',
  ],
  '5' =>
  [
    '@@@@@@@',
    '@      ',
    '@      ',
    '@@@@@@@',
    '      @',
    '      @',
    '@@@@@@@',
  ],
  '6' =>
  [
    '@@@@@@@',
    '@      ',
    '@      ',
    '@@@@@@@',
    '@     @',
    '@     @',
    '@@@@@@@',
  ],
  '7' =>
  [
    '@@@@@@@',
    '      @',
    '      @',
    '      @',
    '      @',
    '      @',
    '      @',
  ],
  '8' =>
  [
    '@@@@@@@',
    '@     @',
    '@     @',
    '@@@@@@@',
    '@     @',
    '@     @',
    '@@@@@@@',
  ],
  '9' =>
  [
    '@@@@@@@',
    '@     @',
    '@     @',
    '@@@@@@@',
    '      @',
    '      @',
    '@@@@@@@',
  ],

}

FONT_5x5 =
{
  ' ' =>
  [
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
  ],
  ':' =>
  [
    ' ',
    '@',
    ' ',
    '@',
    ' ',
  ],
  '0' =>
  [
    ' @@@ ',
    '@   @',
    '@   @',
    '@   @',
    ' @@@ ',
  ],
  '1' =>
  [
    '   @ ',
    '  @@ ',
    ' @ @ ',
    '   @ ',
    '  @@@',
  ],
  '2' =>
  [
    '@@@@ ',
    '    @',
    ' @@@ ',
    '@    ',
    '@@@@@',
  ],
  '3' =>
  [
    '@@@@ ',
    '    @',
    '  @@ ',
    '    @',
    '@@@@ ',
  ],
  '4' =>
  [
    '  @  ',
    ' @   ',
    '@  @ ',
    '@@@@@',
    '   @ ',
  ],
  '5' =>
  [
    '@@@@@',
    '@    ',
    '@@@@ ',
    '    @',
    '@@@@ ',
  ],
  '6' =>
  [
    ' @@@@',
    '@    ',
    '@@@@ ',
    '@   @',
    ' @@@ ',
  ],
  '7' =>
  [
    '@@@@@',
    '    @',
    '   @ ',
    '  @  ',
    '  @  ',
  ],
  '8' =>
  [
    ' @@@ ',
    '@   @',
    ' @@@ ',
    '@   @',
    ' @@@ ',
  ],
  '9' =>
  [
    ' @@@ ',
    '@   @',
    ' @@@@',
    '    @',
    ' @@@ ',
  ],

}

# MAIN ASCII ART CLASS

class AsciiArt
  public
    def self.createText( text, spacingText, fontTable, charSubst=nil )
      
      picture = AsciiArt.new
      
      sp = AsciiArt.new
      spacingText.each_char do |char|
        bitmap = fontTable[ char ];
        unless bitmap == nil
          a = AsciiArt.new
          if charSubst == nil
            a.setFromTable( bitmap )
          else
            a.setFromTable(
              bitmap.map { |row| row.gsub( /[^ ]/, charSubst ) }
            )
          end
          sp.addToRightBottom( a )
        end
      end
        
      first = true
      text.each_char do |char|
        bitmap = fontTable[ char ];
        unless bitmap == nil
          if first
            first = false
          else
            picture.addToRightTop( sp )
          end
          a = AsciiArt.new
          if charSubst == nil
            a.setFromTable( bitmap )
          else
            a.setFromTable(
              bitmap.map { |row| row.gsub( /[^ ]/, charSubst ) }
            )
          end
          picture.addToRightTop( a )
        end
      end
    
      return picture
    end

    def self.createFromTable( table )
      aa = AsciiArt.new
      aa.setFromTable( table )
      return aa
    end

  public
    def render
      return @data.map { |row| row.pack( "U*" ) }
    end
    def renderU
      return @data
    end
    def setFromTable( table )
      @data = table.map { |row| row.unpack( "U*" ) }
      normalizeWidth
    end
    def addToRightTop( other )
      o = other.renderU
      if @data.size < o.size
        (@data.size..o.size-1).each { |x| @data += [''.unpack( "U*" )] }
      end
      normalizeWidth
      (0..o.length-1).each do |rowNum|
        if @data[rowNum] == nil
          @data[rowNum] = ''.unpack( "U*" )
        end
        @data[rowNum] += o[rowNum]
      end
      normalizeWidth
    end
    def addToRightBottom( other )
      o = other.renderU()
      if @data.size < o.size
        (@data.size..o.size-1).each { |x| @data += [''.unpack( "U*" )] }
      end
      normalizeWidth
      off = @data.size - o.size
      (0..o.length-1).each do |rowNum|
        if @data[rowNum+off] == nil
          @data[rowNum+off] = ''.unpack( "U*" )
        end
        @data[rowNum+off] += o[rowNum]
      end
      normalizeWidth
    end
    def addBelow( other )
      @data += other.renderU
      normalizeWidth
    end
    def overwrite( x, other )
      o = other.renderU
      minH = o.size
      if @data.size < minH
        minH = @data.size
      end
      (0..minH-1).each do |rowNum|
        w= o[rowNum].size
        @data[rowNum][x,w] = o[rowNum]
      end
    end

  private
    def initialize
      @data = [] # ''.unpack( "U*" ) ]
    end
    def normalizeWidth
      max = 0
      @data.each { |row| max = row.length if row.length > max }
      @data.map! { |row| row + ((' '*(max-row.length))).unpack( "U*" ) }
    end
    # list of lines
    @data
end

end
end
end

