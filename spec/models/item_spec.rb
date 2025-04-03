require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'scopes' do
    let!(:active_item) { Item.create(name: 'Active Item') }
    let!(:deleted_item) { Item.create(name: 'Deleted Item', deleted_at: Time.current) }

    it 'includes only items that are not soft-deleted in the default scope' do
      expect(Item.all).to include(active_item)
      expect(Item.all).not_to include(deleted_item)
    end
  end

  describe '#soft_delete' do
    let!(:item) { Item.create(name: 'Test Item') }

    it 'sets the deleted_at attribute to the current time' do
      expect { item.soft_delete }.to change { item.deleted_at }.from(nil).to(be_present)
    end
  end

  describe '#restore' do
    let!(:item) { Item.create(name: 'Test Item', deleted_at: Time.current) }

    it 'sets the deleted_at attribute to nil' do
      expect { item.restore }.to change { item.deleted_at }.from(be_present).to(nil)
    end
  end

  describe '#deleted?' do
    context 'when the item is soft deleted' do
      let!(:item) { Item.create(name: 'Deleted Item', deleted_at: Time.current) }

      it 'returns true' do
        expect(item.deleted?).to be true
      end
    end

    context 'when the item is not soft deleted' do
      let!(:item) { Item.create(name: 'Active Item') }

      it 'returns false' do
        expect(item.deleted?).to be false
      end
    end
  end
end
