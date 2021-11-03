require_relative("normal_item")

class ConjuredMana < NormalItem
  def update
    ages_one_day
    decrease_quality_down_to_zero(time: 2)
    decrease_quality_down_to_zero_again(time: 2) if expired?
  end
end