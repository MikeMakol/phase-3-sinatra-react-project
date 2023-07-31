require_relative "/home/mike/Development/code/phase-3/FinFriend/phase-3-sinatra-react-project/config/environment.rb"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Welcome to FinFriend!" }.to_json
  end

  # get all users
  get "/users" do
    # get all the users from the database
    users = User.all.order(id: :desc)

    # return a JSON response with an array of all the users data
    users.to_json(include: :cards)
  end

  # get one user
  get "/users/:id" do
    user = User.find_by(id: params[:id])

    # send a JSON-formatted response of the user data if user is found
    if user
      user.to_json(include: :cards)
    else
      { message: 'User not found'}.to_json
    end
  end

  # create user
  post "/users" do
    user = User.create(params)

    # send a JSON-formatted response of the user if user is created
    if user
      { user: user, message: 'User created successfully!' }.to_json
    else
      { message: 'Unable to create user' }.to_json
    end
  end

  # delete user
  delete '/users/:id' do
    # find user using the ID
    user = User.find(params[:id])
    # delete user
    user.destroy
    # send a response with the deleted user as JSON
    if user
      { user: user, message: 'User deleted successfully!' }.to_json
    else
      { message: 'Unable to delete user' }.to_json
    end
  end

  # get all cards
  get "/cards" do
    # get all the cards from the database
    cards = Card.all.order(id: :desc)

    # return a JSON response with an array of all the cards data
    cards.to_json
  end

  # get one card
  get "/cards/:id" do
    # look up the card in the database using its ID
    card = Card.find(params[:id])

    # send a JSON-formatted response of the card data if card is found
    if card
      card.to_json
    else
      { message: 'Card not found'}.to_json
    end
  end

  # create card
  post "/cards" do
    card = Card.create(
      card_number: params[:card_number],
      card_holder_name: params[:card_holder_name],
      expiry_date_month: params[:expiry_date_month],
      expiry_date_year: params[:expiry_date_year],
      cvv: params[:cvv],
      user_id: params[:user_id]
    )

    # send a JSON-formatted response of the card if card is created
    if card
      { card: card, message: 'Card created successfully!' }.to_json
    else
      { message: 'Unable to create card' }.to_json
    end
  end

  # update card
  patch "/cards/:id" do
    card = Card.find(params[:id])
    card.update(
      card_number: params[:card_number],
      card_holder_name: params[:card_holder_name],
      expiry_date_month: params[:expiry_date_month],
      expiry_date_year: params[:expiry_date_year],
      cvv: params[:cvv],
    )

    # send a JSON-formatted response of the card if card is updated
    if card
      { card: card, message: 'Card updated successfully!' }.to_json
    else
      { message: 'Unable to update card' }.to_json
    end
  end

  # delete card
  delete '/cards/:id' do
    # find card using the ID
    card = Card.find(params[:id])
    # delete card
    card.destroy
    # send a response with the deleted card as JSON
    if card
      { card: card, message: 'Card deleted successfully!' }.to_json
    else
      { message: 'Unable to delete card' }.to_json
    end
  end

end
