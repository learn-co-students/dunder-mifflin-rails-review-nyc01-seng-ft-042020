class Dog < ApplicationRecord
    has_many :employees


    def owner_names
    self.employees.each do |e|
            e.first_name
        end
    end

end
