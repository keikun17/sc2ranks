require 'httparty'
require 'sc2ranks/character'

class Sc2ranks
  include HTTParty
  format :xml
  base_uri 'sc2ranks.com'

  # Constant used to parse bnet profile urls
  RE = %r{http://([a-zA-Z]+)\.battle\.net/sc2/[a-zA-Z0-9]+/profile/([0-9]+)/[01]/([a-zA-Z0-9]+)/}

  def initialize(key)
    self.class.default_params :appKey => key
  end

  def character(url)
    region, char = parse_bnet_url url

    data = self.class.get("/api/base/teams/#{region}/#{char}.xml").symbolize_keys!
    Character.new data[:hash].symbolize_keys!
  end

  def parse_bnet_url(url)
    Sc2ranks::RE =~ url
    return $1, "#{$3}!#{$2}"
  end
end
