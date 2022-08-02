class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        self.auditions
    end

    def actors
        actors = []
        for audition in auditions
            actors << audition.actor
        end
        actors
    end

end