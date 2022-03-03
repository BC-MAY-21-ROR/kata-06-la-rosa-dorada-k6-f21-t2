require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Conjured Mana Cake", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Conjured Mana Cake"
    end
    
    it "mantain sellIn " do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 80
    end

    it "reduce quality" do
      item = Item.new("Conjured Mana Cake", 0, 80)
      disminuir_calidad(item)
      expect(item.quality).to eq 78
    end
  end

end