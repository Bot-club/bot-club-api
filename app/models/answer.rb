class Answer < ApplicationRecord
  validates_presence_of :description
  belongs_to :question
  belongs_to :user
end
