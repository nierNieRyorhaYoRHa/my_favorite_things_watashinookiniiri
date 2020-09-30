require 'rails_helper'

RSpec.describe Thing, type: :model do
  before do
    @thing = FactoryBot.build(:thing)
    @thing.image.attach(fixture_file_upload('public/images/test_image.png'))
  end

  describe '商品出品機能' do
    context '実装の条件' do
      it '画像は1枚必須であること' do
        @thing.image = nil
        @thing.valid?
        expect(@thing.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @thing.name = nil
        @thing.valid?
        expect(@thing.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @thing.explanation = nil
        @thing.valid?
        expect(@thing.errors.full_messages).to include("Explanation can't be blank")
      end
      it '価格の情報が必須であること' do
        @thing.price = nil
        @thing.valid?
        expect(@thing.errors.full_messages).to include("Price can't be blank")
      end
      it 'お気に入り度についての情報が必須であること' do
        @thing.score = nil
        @thing.valid?
        expect(@thing.errors.full_messages).to include("Score can't be blank")
      end
      it '日付についての情報が必須であること' do
        @thing.date = nil
        @thing.valid?
        expect(@thing.errors.full_messages).to include("Date can't be blank")
      end
    end
  end
end
