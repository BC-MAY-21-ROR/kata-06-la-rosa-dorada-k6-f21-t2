# frozen_string_literal: true

def fecha_pasada(item)
  return item.quality = 0 if item.name == 'Backstage passes to a TAFKAL80ETC concert'
  return item.quality += 1 if item.name == 'Aged Brie'

  disminuir_calidad(item)
end

def aumentar_calidad(item)
  item.quality += 1
  return if item.name != 'Backstage passes to a TAFKAL80ETC concert'
  item.quality += 1 if item.sell_in < 11
  item.quality += 1 if item.sell_in < 6
end

def disminuir_calidad(item)
  item.quality -= 1
  item.quality -= 1 if item.name == 'Conjured Mana Cake'
end

# GildedRose class
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      names = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert']
      names.include?(item.name) ? aumentar_calidad(item) : disminuir_calidad(item)
      fecha_pasada(item) if (item.sell_in -= 1).negative?
      item.quality.clamp(0, 50)
    end
  end
end

# Item class
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
