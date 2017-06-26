module ItemsHelper
    def time_til_expiration(dt)
        if dt < Time.now
            return "Expired"
        else
            distance_of_time_in_words(dt, Time.now)
        end
    end
end
