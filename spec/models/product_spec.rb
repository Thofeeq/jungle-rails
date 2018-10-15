require 'rails_helper'
# Product model specs- Tests for the presence of 'Name','Unit Price', 'Quantity', 'Category ID' in the Product Model
RSpec.describe Product, type: :model do
  describe "validations" do 
    it "should not create a product without a name" do
    @category = Category.new
    @category.name = "Apparel"
    @category.save
    @product = @category.products.create(name: nil,description: "Anything",image: "Anything", price_cents: 2, 
      quantity:2, category_id: @category.id  )
    expect(@product.name).to be_nil
    end
    it "should not create a product without a price" do
      @category = Category.new
      @category.name = "Apparel"
      @category.save
      @product = @category.products.create(name: "Anything",description: "anything",image: "Anything", price_cents: nil, 
        quantity:2, category_id: @category.id  )
      expect(@product.price_cents).to be_nil
    end

    it "should not create a product without quantity specified" do
      @category = Category.new
      @category.name = "Apparel"
      @category.save
      @product = @category.products.create(name: "Anything",description: "Anything",image: "Anything", price_cents: 2, 
        quantity:nil, category_id: @category.id  )
      expect(@product.quantity).to be_nil
      end

    it "should not create a product without category assigned" do
      @product = Product.new(name: "Anything",description: "Anything",image: "Anything", price_cents: 2, 
        quantity:2, category_id: nil )
      expect(@product.category_id).to be_nil
      end

    it "should find the expect errors" do
      @product = Product.create(name: nil,description:nil,image: "Anything", price_cents: 2, 
        quantity:2, category_id: nil )
      expect(@product.errors.full_messages).to_not be_empty
    end
  end
end
