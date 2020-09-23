require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nick_name、email、password、password_confirmation、family_name、
     first_name、family_furigana、first_furigana、birthdayが存在しているときに登録できる" do
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上、半角英数字混合だと登録できる' do
        @user.password = 'Takahiro0924'
        @user.password_confirmation = 'Takahiro0924'
        expect(@user).to be_valid
      end

      it 'ユーザー本名は全角漢字、ひらがな、カタカナで登録できる' do
        @user.first_name = 'タカヒロ'
        @user.first_name = 'たかひろ'
        @user.family_name = 'ねもと'
        @user.family_name = 'ネモト'
        expect(@user).to be_valid
      end

      it 'ユーザー本名のフリガナは全角カタカナで登録できる' do
        @user.first_furigana = 'アイウエ'
        @user.family_furigana = 'カキクケ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nick_nameが空だと登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aiueogmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードには英字と数字の両方を含めて設定してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = 'Kah78'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
      it 'passwordが英数字混合でないと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前全角文字を使用してください")
      end
      it 'first_nameが全角漢字、ひらがな、カタカナ以外だと登録できない' do
        @user.first_name = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字全角文字を使用してください")
      end
      it 'family_nameが全角漢字、ひらがな、カタカナ以外だと登録できない' do
        @user.family_name = 'DEF'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")
        @user.family_name = '456'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")
      end
      it 'first_furiganaが空だと登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前の振り仮名を入力してください", "名前の振り仮名全角カタカナを使用してください")
      end
      it 'first_furiganaが全角カタカナ以外だと登録できない' do
        @user.first_furigana = 'さしすせ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前の振り仮名全角カタカナを使用してください")
        @user.first_furigana = '怠惰'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前の振り仮名全角カタカナを使用してください")
        @user.first_furigana = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前の振り仮名全角カタカナを使用してください")
      end
      it 'family_furiganaが空だと登録できない' do
        @user.family_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字の振り仮名を入力してください", "苗字の振り仮名全角カタカナを使用してください")
      end
      it 'family_furiganaが全角カタカナ以外だと登録できない' do
        @user.family_furigana = 'たちつて'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字の振り仮名全角カタカナを使用してください")
        @user.family_furigana = '勝利'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字の振り仮名全角カタカナを使用してください")
        @user.family_furigana = '456edf'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字の振り仮名全角カタカナを使用してください")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
