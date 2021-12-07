class List < ApplicationRecord
  #Refileを使うために必要
  #指定のカラムにアクセスする
  attachment :image
  
  #varidatesに指定された者がないとtrueにならない
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true 
  
end
