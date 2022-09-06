# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

  attr_accessor :link

  def initialize(link='https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json')
    @url=link
  end

  def get_response_body
    uri = URI.parse(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json
    programs = JSON.parse(self.get_response_body)
    programs.collect do |program|
      program["agency"]
    end
  end

end
