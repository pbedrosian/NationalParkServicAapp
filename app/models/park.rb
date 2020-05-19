class Park < ActiveRecord::Base
    belongs_to :user
    validates :name, :state, :city, :date_visited, presence: true
end
