require 'rails_helper'

describe 'Items search API' do
  it 'should be able to find an item by name' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant: merchant)

    item_1 = create(:item, merchant: merchant, name: 'The Item')

    get "/api/v1/items/find?name=#{item_1.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item['id']).to be(item_1.id)
    expect(item['name']).to eq(item_1.name)
  end

  it 'should be able to find multiple items' do
    merchant = create(:merchant)

    count = 3
    create_list(:item, count, merchant: merchant)

    price_string = (Item.last.unit_price / 100.0).to_s
    
    get "/api/v1/items/find_all?unit_price=#{price_string}"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to be(count)
  end

  it 'should be able to find a random item' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant: merchant)

    get '/api/v1/items/random'

    item = JSON.parse(response.body)
    item_names = Item.pluck(:name)

    expect(response).to be_successful
    expect(item_names).to include(item['name'])
  end
end
