require 'action_view'
class Cat <ApplicationRecord 
    include ActionView::Helpers::DateHelper
     
    validates :birth_date, :color, :name, :sex, presence: true

    validates :color, inclusion: { in: %w(orange black white grey) }

    validates :sex, inclusion: { in: %w(F M) }

    def age
        time_ago_in_words(birth_date)
    end

    

end