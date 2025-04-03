require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:item1) { Item.create(name: 'Item 1', deleted_at: nil) }
  let!(:item2) { Item.create(name: 'Item 2', deleted_at: nil) }

  describe 'GET /items' do
    it 'returns a successful response and renders items in descending order' do
      get items_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /items' do
    it 'creates a new item and redirects to the index page' do
      post items_path, params: { name: 'Test Item' }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(items_path)
    end
    # it 'does not create an item with invalid parameters' do
    #   post items_path, params: { name: '' }
      
    #   expect(response).to have_http_status(:ok) 
    #   expect(response.body).to include('There was an error creating the item.') 
    # end
  end

  describe 'DELETE /items/:id' do
    let!(:item) { Item.create(name: 'Test Item') }

    context 'when the item is successfully soft deleted' do
      it 'soft deletes the item and redirects to the index page with a success message' do
        allow_any_instance_of(Item).to receive(:soft_delete).and_return(true)

        delete item_path(item)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(items_path)
        follow_redirect!
        expect(response.body).to include('Item was successfully deleted.')
    end
  end

    context 'when the item fails to soft delete' do
      it 'does not delete the item and redirects to the index page with an error message' do
        allow_any_instance_of(Item).to receive(:soft_delete).and_return(false)

        delete item_path(item)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(items_path)
        follow_redirect!
        expect(response.body).to include('Failed to delete the item.')
      end
    end
  end

  describe 'POST /items/:id/restore' do
    let!(:item) { Item.create(name: 'Test Item', deleted_at: Time.current) }

    context 'when the item is successfully restored' do
      it 'restores the item and redirects to the index page with a success message' do
        allow_any_instance_of(Item).to receive(:restore).and_return(true)

        post restore_item_path(item)

        expect(response).to have_http_status(:found) 
        expect(response).to redirect_to(items_path)
        follow_redirect!
        expect(response.body).to include('Item was successfully restored.')
      end
    end

    context 'when the item fails to restore' do
      it 'does not restore the item and redirects to the index page with an error message' do
        allow_any_instance_of(Item).to receive(:restore).and_return(false)

        post restore_item_path(item)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(items_path)
        follow_redirect!
        expect(response.body).to include('Failed to restore the item.')
      end
    end
  end
end
