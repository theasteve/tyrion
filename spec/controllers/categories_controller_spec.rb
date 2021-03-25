require 'rails_helper'

describe CategoriesController do
  it "fetches categories with 5 items each" do
    user = User.create!
    stock = user.stocks.create!(name: 'PLTR')
    category1 = stock.categories.create!(name: "News", user: user)
    category2 = stock.categories.create!(name: "Risks", user: user)

    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)
    category1.items.create!(name: 'Me', user: user)

    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)
    category2.items.create!(name: 'You', user: user)

    get :index, params: { stock_id: stock.id}
    expect(response).to have_http_status(:ok)
    body = JSON.parse(response.body)
    # 10 items and 1 user side loaded within the response
    expect(body["included"].length).to eq 11

  end
end
