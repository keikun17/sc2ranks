class Sc2ranks
  class Team
    attr_accessor :bracket,:is_random,:fav_race,:updated_at,:league,:division,:division_rank,:world_rank,:region_rank,:wins,:losses,:points,:ratio
    def initialize(params = {})
      @bracket        = params[:bracket]
      @is_random      = params[:is_random]
      @fav_race       = params[:fav_race]
      @updated_at     = params[:updated_at]
      @league         = params[:league]
      @division       = params[:division]
      @division_rank  = params[:division_rank]
      @world_rank     = params[:world_rank]
      @region_rank    = params[:region_rank]
      @wins           = params[:wins]
      @losses         = params[:losses]
      @points         = params[:points]
      @ratio          = params[:ratio]
    end
    
    alias :is_random? :is_random
  end
end
