class List < ApplicationRecord
  validates :title, presence: true #バリデーションの設定,コントローラーも修正が必要
  validates :body, presence: true #validates => バリデーション, presence => 存在
end
