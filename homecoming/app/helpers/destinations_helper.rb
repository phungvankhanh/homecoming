module DestinationsHelper
    def google_map(center)
        center.gsub! ' ', '+'
        "https://www.google.com/maps/embed/v1/place?q=#{center}&key=AIzaSyDawjr56ZnzpNjJ3sfRqQQiJtyE1JNc6AA"
    end

    def ave_rating(sum, count)
        if count == 0
            0
        else
            sum/count
        end
    end
end
