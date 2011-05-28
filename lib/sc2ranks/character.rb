require 'sc2ranks/team'
require 'sc2ranks/portrait'

class Sc2ranks
  class Character 
    attr_accessor :name, :bnet_url, :bnet_id, :id, :region, :updated_at, :achievement_points, :character_code, :portrait, :teams

    def initialize(params = {})
      @name               = params[:name] 
      @bnet_url           = params[:bnet_url]
      @bnet_id            = params[:bnet_id]
      @id                 = params[:id]
      @region             = params[:region]
      @updated_at         = params[:updated_at]
      @achievement_points = params[:achievement_points]
      @character_code     = params[:character_code]
      @portrait           = Portrait.new(params[:portrait])
      @teams              = params[:teams].map{|team| Team.new(team.symbolize_keys!)} if params[:teams]
    end

    # Look up a team via bracket number and is_random setting. If you are trying
    # to find the user's 1v1 team or a random team this will return the Team
    # object or nil. If you are looking for 2's, 3's or 4's this will return an
    # array of teams (or an empty array if their are none).
    def team(bracket, is_random = false)
      if bracket == 1 or is_random
        self.teams.detect do |team|
          team.bracket == bracket and team.is_random == is_random
        end
      else
        self.teams.select do |team|
          team.bracket == bracket and team.is_random == is_random
        end
      end
    end
    
  end
end
