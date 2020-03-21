class Tweet < ApplicationRecord
  belongs_to :user

  # contentカラムが空の場合は保存しない
  validates :content, presence: true
end
