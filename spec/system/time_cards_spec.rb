require 'rails_helper'

describe '勤怠登録機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, email: 'a@example.com')
      FactoryBot.create(:time_card, day: '2019-01-01', user: user_a)
    end
  　context 'ユーザーAがログインしているとき' do
   　　before do
    　 visit login_path
    　 fill_in 'メールアドレス', with: 'a@example.com'
    　 fill_in 'パスワード', with: 'password'
    　 click_button 'ログイン'
      end
      
      it 'ユーザーAが作成した勤怠が表示される' do
        expect(page).to have_content '出勤'
      end
    end
  end
end
