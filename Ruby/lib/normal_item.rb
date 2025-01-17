require_relative("item")

class NormalItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
    ages_one_day
    decrease_quality_down_to_zero
    decrease_quality_down_to_zero_again if expired?
  end

  private

  def ages_one_day
    @item.days_remaining -= 1
  end

  def expired?
    @item.days_remaining < 0
  end

  def decrease_quality_down_to_zero(time: 1)
    time.times { @item.quality -= 1 if @item.quality > 0 }
  end
  alias decrease_quality_down_to_zero_again decrease_quality_down_to_zero

  def increase_quality_up_to_fifty
    @item.quality += 1 if @item.quality < 50
  end
  alias increase_quality_up_to_fifty_again increase_quality_up_to_fifty
end