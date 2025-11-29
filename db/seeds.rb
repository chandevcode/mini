puts "Clearing old data..."
MenuItem.delete_all
Category.delete_all

puts "create USer..."

User.create!(
  email_address: "test@mail.com",
  password_digest: "password",
  password_confirmation: "password"
)

puts "Creating categories..."
categories = [
  "Coffee",
  "Tea",
  "Milk Based",
  "Snacks",
  "Desserts"
].map { |name| Category.create!(name: name) }

puts "Creating menu items..."

10.times do
  category = categories.sample

  MenuItem.create!(
    category: category,
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: rand(10_000..50_000),
    is_available: [true, true, true, false].sample # 75% available
  )
end

puts "Done seeding! 🎉"
