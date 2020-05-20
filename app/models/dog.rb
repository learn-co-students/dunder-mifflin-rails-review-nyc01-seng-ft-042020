class Dog < ApplicationRecord
    has_many :employees

    def self.search(search)
    end

end
