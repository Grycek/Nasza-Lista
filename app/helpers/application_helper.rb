module ApplicationHelper
    def points_to_pos(points)
        return {12 => 1, 10 => 2, 8 => 3, 7 => 4, 6 => 5, 5 => 6, 4 => 7, 3 => 8, 2 => 9, 1 => 10, 0 => 11}[points]
    end
    
    def pos_to_points(points)
        return {1 => 12, 2 => 10, 3 => 8, 4 => 7, 5 => 6, 6 => 5, 7 => 4, 8 => 3, 9 => 2, 10 => 1, 11 => 0}[points]
    end
end
