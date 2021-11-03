require_relative("normal_item")

class Backstage < NormalItem
  def update
    ages_one_day
    return @item.quality = 0 if expired?

    increase_quality_up_to_fifty
    increase_quality_up_to_fifty_again if item.days_remaining < 10
    increase_quality_up_to_fifty_again if item.days_remaining < 5
  end
end