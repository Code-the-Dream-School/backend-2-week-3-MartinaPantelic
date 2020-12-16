require "rails_helper"

RSpec.describe Order, type: :model do
  customer = Customer.create(first_name: "Martina", last_name: "Panteliv", phone: "0123456789", email: "martina@gmail.com")
  subject { Order.new(product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer)) }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with invalid attributes" do
    subject.product_name = nil
    expect(subject).to_not be_valid
  end

  it "is valid with an integer product_count " do
    subject.product_count = 10
    expect(subject).to be_valid
  end

  it "is not valid without a product_count is integer" do
    subject.product_count = "ten"
    expect(subject).to_not be_valid
  end

  it "is valid with an existing customer" do
    puts customer.id
    subject.customer_id = customer.id
    expect(subject).to be_valid
  end

  it "is not valid without a customer exist" do
    subject.customer_id = "50000"
    expect(subject).to_not be_valid
  end
end
