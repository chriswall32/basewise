class Todo < ActiveRecord::Base
  belongs_to :todo_list

  validates :title, presence: true


end
