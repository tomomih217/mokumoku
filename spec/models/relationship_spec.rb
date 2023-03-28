require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user){ create(:user) }
  let(:followed_user){ create(:user) }
  describe '#create' do
    context 'userがfollowed_userをフォローしたとき' do
      before { @relationship = user.follow(followed_user) }
      it '正常にフォローができるかどうか' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォロー相手を指定しない場合' do
      it 'フォローに失敗すること' do
      end
    end
    context 'フォロー元のユーザーを指定しない場合' do
      it 'フォローに失敗すること' do
      end
    end
    context 'すでにフォロー済みの場合' do
      it 'フォローに失敗すること' do
      end
    end
  end
end
