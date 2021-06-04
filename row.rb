require_relative 'plank'

class Row
  PLANK_A = Plank.new(quantity: 2, length: 90)
  PLANK_B = Plank.new(quantity: 2, length: 45)
  PLANK_C = Plank.new(quantity: 2, length: 22.5)
  PLANK_D = Plank.new(quantity: 2, length: 8 )

  MAXIMUM_LENGTH = 196
  ALL_PLANKS = [PLANK_A, PLANK_B, PLANK_C, PLANK_D]

  def build
    row = [0]
    shuffled_planks_for_row.each do |n|
      if row.sum == MAXIMUM_LENGTH
        return row.reject(&:zero?)
      end

      if n + row.sum <= MAXIMUM_LENGTH
        row << n
      end
    end

    build
  end

  private

  def shuffled_planks_for_row
    all_lengths = []
    ALL_PLANKS.each do |plank|
      next if plank.quantity.zero?
      plank.quantity.times do
        all_lengths << plank.length
      end
    end
    all_lengths.shuffle
  end
end