require 'rails_helper'

RSpec.describe 'Relationship', type: :system do
  let(:user){ create(:user) }
  let(:followed_user){ create(:user) }
  let(:owner_user){ create(:user) }
  let!(:event_with_followed_user){ create(:event, user: owner_user) }
  let!(:event_by_followed_user){ create(:event, user: followed_user) }
  before do
    followed_user.attend(event_by_followed_user)
  end
  describe 'フォロー機能' do
    describe '#create' do
      context '他のユーザーのフォローボタンを押すと' do
        it 'フォローが正常にできること' do
        end
      end
    end
    describe '#destroy' do
      context 'フォロー済ボタンをもう一度押すと' do
        it 'フォローが解除されること' do
        end
      end
      context 'フォロー一覧で削除ボタンを押すと' do
        it 'フォローが解除されること' do
        end
      end
    end
  end

  describe 'マイページ' do
    describe 'フォロー一覧' do
      context 'ヘッダーからフォロー一覧を開くと' do
        it 'フォローしたユーザーの名前が見られること' do
        end
      end
    end
    describe 'イベントカレンダー' do
      context 'フォローが参加のイベントタブを押すと' do
        it 'フォローが参加のイベント一覧が表示されること' do
        end
        it 'フォローが開催するイベントが表示されること' do
        end
        it 'フォローが参加しないイベントが表示されないこと' do
        end
      end
    end
  end
end