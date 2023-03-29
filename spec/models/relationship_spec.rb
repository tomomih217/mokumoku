require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user){ create(:user) }
  let(:followed_user){ create(:user) }
  describe '#create' do
    context 'userがfollowed_userをフォローしたとき' do
      before { @relationship = user.follow(followed_user.id) }
      it '正常にフォローができるかどうか' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォロー相手を指定しない場合' do
      before do
        @relationship = Relationship.new
        @relationship.followed_id = ''
        @relationship.follower_id = user.id
      end
      it 'フォローに失敗すること' do
        expect(@relationship).to be_invalid
      end
    end
    context 'フォロー元のユーザーを指定しない場合' do
      before do
        @relationship = Relationship.new
        @relationship.followed_id = followed_user.id
        @relationship.follower_id = ''
      end
      it 'フォローに失敗すること' do
        expect(@relationship).to be_invalid
      end
    end
    context 'すでにフォロー済みの場合' do
      before do
        user.follow(followed_user.id)
        @relationship = Relationship.new(followed_id: followed_user.id, follower_id: user.id)
      end
      it 'フォローに失敗すること' do
        expect(@relationship).to be_invalid
      end
    end
  end
end
