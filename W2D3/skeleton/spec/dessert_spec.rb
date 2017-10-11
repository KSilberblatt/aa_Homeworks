require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Kevin") }
  subject(:dessert) { Dessert.new("Banana Split", 3, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Banana Split")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Banana Split", 3, chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("fudge")
      expect(dessert.ingredients).to include("fudge")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["fudge", "banana", "ice cream", "nuts", "caramel"]

      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end


  describe "#eat" do
      it "subtracts an amount from the quantity"
      dessert.eat(2)
      expect(dessert.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
    expect { dessert.eat(5) }. to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
    allow(chef).to receive(:titleize).and_return("Chef Kevin the Great Baker")
    expect(dessert.serve).to eq
    ("Chef Kevin the Great Baker has made 3 Banana Splits!")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
