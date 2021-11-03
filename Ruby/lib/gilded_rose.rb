require_relative("item")
require_relative("normal_item")
require_relative("aged_brie")
require_relative("backstage")
require_relative("sulfuras")
require_relative("conjured_mana")

class GildedRose
  ITEM_CLASSES = {
    "Aged Brie"                                 => AgedBrie,
    "Sulfuras, Hand of Ragnaros"                => Sulfuras,
    "Backstage passes to a TAFKAL80ETC concert" => Backstage,
    "Conjured Mana Cake"                        => ConjuredMana
  }

  def initialize(name:, days_remaining:, quality:)
    item = Item.new(name, days_remaining, quality)
    @current_item = class_from(name: name).new(item)
  end

  def tick
    @current_item.update
  end

  def days_remaining
    @current_item.item.days_remaining
  end

  def quality
    @current_item.item.quality
  end

  private

  def class_from(name:)
    ITEM_CLASSES[name] || NormalItem
  end
end

gilded_rose = GildedRose.new(name: "Conjured Mana Cake", days_remaining: 5, quality: 10)
gilded_rose.tick
