require_relative("normal_item")

class AgedBrie < NormalItem
  def update
    ages_one_day
    increase_quality_up_to_fifty
    increase_quality_up_to_fifty_again if expired?
  end
end
