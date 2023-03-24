require 'rails_helper'

RSpec.describe 'AddUserLang', type: :system do
  describe 'プロフィール' do
    let(:user){ create(:user) }
    before do
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
        visit mypage_profile_path
    end
    context 'プロフィール画面を開いたら' do
      it '経験言語を登録するフォームが存在すること' do
        expect(page).to have_content 'Language'
      end
    end
    context '経験言語を入力して更新すると' do
      before do
        fill_in 'Language', with: 'Ruby'
        click_button '更新する'
      end
      it '更新に成功すること' do
        expect(page).to have_field 'Language', with: 'Ruby'
      end
    end
  end
  describe 'イベント' do
    let(:organizer){ create(:user, :with_lang_ruby) }
    let(:participant){ create(:user, :with_lang_php) }
    let!(:event){ create(:event, user: organizer) }
    before do
      visit login_path
      fill_in 'Email', with: participant.email
      fill_in 'Password', with: 'password'
      click_button 'ログイン'
    end
    describe '一覧画面' do
      before { visit events_path }
      context '主催者が経験言語を登録しているとき' do
        it '主催者の下に経験言語が表示されていること' do
          expect(page).to have_content 'Ruby'
        end
      end
    end
    describe '詳細画面' do
      before { visit event_path(event.id) }
      context '主催者が経験言語を登録しているとき' do
        it '主催者の下に経験言語が表示されていること' do
          within(page.all('.card-body')[2]) do
            expect(page).to have_content 'Ruby'
          end
        end
      end
      context '経験言語を登録した参加者が存在する時' do
        before do
          visit event_path(event.id)
          page.accept_confirm do
            find('a', text: 'このもくもく会に参加する').click
          end
        end
        it 'イベント参加者の名前の下に経験言語が表示されていること' do
          within(page.all('.card-body')[4]) do
            expect(page).to have_content 'PHP'
          end
        end
      end
      context '経験言語を登録したユーザーがコメントした時' do
        before do
          visit event_path(event.id)
          fill_in 'comment[content]', with: 'コメントだよ'
          click_button '登録する'
        end
        it 'コメントしたユーザーの名前の下の経験言語が表示されていること' do
          within(page.all('.card-body')[5]) do
            expect(page).to have_content 'PHP'
          end
        end
      end
    end
  end
end