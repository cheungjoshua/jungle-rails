require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    subject do
      @category = Category.new(name: "testing")
      @product =
        Product.new(
          name: "testing",
          price_cents: 2,
          quantity: 3,
          category: @category
        )
    end
    before { subject.save }

    context "Validates product" do
      it "return valid when product not empty" do
        expect(subject).to be_valid
      end

      it "return not valid when name is empty" do
        subject.name = nil
        expect(subject).to_not be_valid
        puts @product.errors.full_messages
      end

      it "return not valid when price is empty" do
        subject.price_cents = nil
        expect(subject).to_not be_valid
        puts @product.errors.full_messages
      end

      it "return not valid when quantity is empty" do
        subject.quantity = nil
        expect(subject).to_not be_valid
        puts @product.errors.full_messages
      end

      it "return not valid when category is empty" do
        subject.category = nil
        expect(subject).to_not be_valid
        puts @product.errors.full_messages
      end
    end
  end
end
