require_relative 'row'

class Rows
  attr_reader :totals

  def initialize(quantity:, show_totals: false)
    stats = []
    totals = Hash.new(0)
    quantity.times do
      row = Row.new.build
      row.each{ |length| print build_visual(length: length) }
      puts ''
      stats << build_totals(row: row)
    end

    stats.each{|x| p x}
    stats.flatten.each do |l|
      totals[l] += 1
    end
    puts totals

  end

  def build_totals(row:)
    row.each { |length| totals[length] += 1 }
  end

  def totals
    @totals ||= Hash.new(0)
  end

  def build_visual(length:)
    middle = '%' * (length / 2)
    "|#{middle}|"
  end

end

Rows.new(quantity: 10, show_totals: false)