class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    update_quality
    update_days_remaining
  end

  private

  def update_quality
    case @name
    when 'Sulfuras, Hand of Ragnaros'
      return
    when 'Aged Brie'
      if @quality < 50 && @days_remaining > 0
        @quality += 1
      elsif @quality < 50 && @days_remaining <= 0
        @quality == 49 ? @quality = 50 : @quality += 2 # 50 is limit
      end
    when 'Backstage passes to a TAFKAL80ETC concert'
      if @days_remaining <= 0
      @quality = 0
      elsif @quality < 50 && @days_remaining < 6
        @quality > 47 ? @quality = 50 : @quality += 3 # 50 is limit
      elsif @quality < 50 && @days_remaining < 11
        @quality += 2
      elsif @quality < 50
        @quality += 1
      end
    when 'Normal Item'
      if @quality > 0  && @days_remaining > 0
        @quality -= 1
      elsif @quality > 0 && @days_remaining <= 0
        @quality -= 2
      end
    when 'Conjured Mana Cake'
      if @quality > 0 && @days_remaining > 0
        @quality -= 2
      elsif @quality > 0 && @days_remaining <= 0
        @quality -= 4
      end
    end
  end

  def update_days_remaining
    if @name != 'Sulfuras, Hand of Ragnaros'
      @days_remaining -= 1
    end
  end
end
