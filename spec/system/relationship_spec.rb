require 'rails_helper'

RSpec.describe 'Relationship', type: :system do
  let(:user){ create(:user) }
  let(:followed_user){ create(:user) }
  let(:owner_user){ create(:user) }
  let!(:event_with_followed_user){ create(:event, user: owner_user) }
  let!(:event_without_attendee){ create(:event, user: followed_user) }
  describe 'フォロー機能' do
    describe '#create' do
      before do
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
      end
      context '他のユーザーのフォローボタンを押すと' do
        before do
          click_link "follow-#{followed_user.id}"
          visit user_relationships_path(user.id)
        end
        it 'フォローが正常にできること' do
          expect(user.followings.count).to eq 1
          expect(page).to have_content followed_user.name
        end
      end
    end
    describe '#destroy' do
      before do
        user.follow(followed_user.id)
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
      end
      context 'フォロー済ボタンをもう一度押すと' do
        before do
          click_link "unfollow-#{followed_user.id}"
          visit user_relationships_path(user.id)
        end
        it 'フォローが解除されること' do
          expect(user.followings.count).to eq 0
          expect(page).to have_no_content followed_user.name
        end
      end
      context 'フォロー一覧で削除ボタンを押すと' do
        before do
          visit user_relationships_path(user.id)
          click_on '削除'
        end
        it 'フォローが解除されること' do
          expect(user.followings.count).to eq 0
          expect(page).to have_no_content followed_user.name
        end
      end
    end
  end

  describe 'マイページ' do
    describe 'イベントカレンダー' do
      before do
        user.follow(followed_user.id)
        followed_user.attend(event_with_followed_user)
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
        visit mypage_event_calendar_path
      end
      context 'フォローが参加のイベントタブを押すと' do
        before { find('a', text: 'フォローが参加のイベント').click }
        it 'フォローが参加のイベント一覧が表示されること' do
          expect(page).to have_content event_with_followed_user.title
        end
        it 'フォローが参加しないイベントが表示されないこと' do
          expect(page).to have_no_content event_without_attendee.title
        end
      end
    end
  end
end