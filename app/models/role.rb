class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        self.auditions
    end

    def actors
        actors = []
        for audition in self.auditions
            actors << audition.actor
        end
        actors
    end

    def locations
        locations = []
        for audition in self.auditions
            locations << audition.location
        end
        locations
    end

    def lead
        lead_actor = self.auditions.find_by hired: true
        if lead_actor == nil
            "no actor has been hired for this role"
        else
            lead_actor
    end

    def understudy
        actors = self.auditions.where(hired: true)
        if actors.second == nil
            "no actor has been hired for this role"
        else
            actors.second
    end

end