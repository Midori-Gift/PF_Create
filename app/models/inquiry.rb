# frozen_string_literal: true

class Inquiry
  # DB不使用のため、ActiveModel使用
  include ActiveModel::Model

  # DBを使わなくてもゲッター、セッターとして利用可能なカラムたちを定義
  attr_accessor :name, :email, :message

  validates :name, presence: { message: '名前を入力してください' }
  validates :email, presence: { message: 'メールアドレスを入力してください' }
end
