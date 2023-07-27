puts "🌱 Seeding spices..."

# Seed your database here
# Make 10 users
10.times do
    User.create(username: Faker::Username.username)
end
  
# Make 5 cards
5.times do
    # create a card with random data
    card = Card.create(
        card_number: rand(0..16), # random number between 0 and 16
        card_holder_name: Faker::Card.card_holder_name,
        expiry_date_month: Faker::Card.expiry_date_month,
        expiry_date_year: Faker::Card.expiry_date_year,
        cvv: rand(0..4) # random cvv number between 0 and 4
    )

    # A card belongs to a user, so we must provide a foreign key
    Card.create(
    card_number: rand(1..16),
    user_id: user.id
    )
end

puts "✅ Done seeding!"
