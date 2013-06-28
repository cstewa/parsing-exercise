require "pry"
require "pry-debugger"
require "soundcloud"
require "nokogiri"
require "open-uri"

wdi2 = {:instructors => [{:name => "jane", :gender => "female", :favorite_movies => ["the dark knight rises", "the dark knight", "batman begins"], :favorite_foods =>["tacos", "tamales", "enchiladas"]}, {:name => "sumeet", :gender => "male", :favorite_movies => ["x-men", "x2", "x3: the last stand", "x-men: first class"], :favorite_foods=>["pizza", "pasta", "cheese"]}, {:name => "dwayne", :gender => "male", :favorite_movies=>["harry potter 1", "harry potter 2", "harry potter 3", "harry potter 4"]}], :students => [{:name => "tom", :favorite_movie => "the hunger games"},{:name => "christina", :favorite_movie=>"my fair lady"},{:name=>"baylee", :favorite_movie=>"mary poppins"}, {:name =>"jason", :favorite_movie =>"the sound of music"}, {:name => "zara", :favorite_movie => "the princess diaries"}], :date => "6/27/13"}

def parse_class(x)
	class_movies = {}
	instructors = x[:instructors]
	instructors.each do |instructor|
		class_movies[instructor[:name]] = instructor[:favorite_movies]
	end
	students = x[:students]
	students.each do |student|
		class_movies[student[:name]] = student[:favorite_movie]
	end
	class_movies
end

a = parse_class(wdi2)

the_hunger_games_contestants = [{:name => "c1", :district => {:name => "1", :specialty => "luxury goods", :population => "1,000,000"}, :rating => "11", :specialty => ["bow and arrow", "hand to hand combat", "sword throwing"]}, {:name => "c2", :district => {:name => "2", :specialty => "peacekeepers", :population => "1,687,098"}, :rating => "3", :specialty => ["sword throwing", "bow and arrow", "hand to hand combat"]}, {:name => "c3", :district => {:name => "3", :specialty => "electronics", :population => "239,908"}, :rating => "7", :specialty => ["hand to hand combat", "sword throwing", "bow and arrow"]}, {:name => "c4", :district => {:name => "4", :specialty => "fishing", :population => "987,123"}, :rating => "9", :specialty => ["trident throwing","hand to hand combat", "sword throwing", "bow and arrow"]}, {:name => "c5", :district => {:name => "5", :specialty => "power", :population => "123,987,324"}, :rating => "4", :specialty => ["hand to hand combat", "sword throwing", "bow and arrow"]}, {:name => "c6", :district => {:name => "6", :specialty => "transportation", :population => "724,345"}, :rating => "2", :specialty => ["knife throwing", "hand to hand combat", "sword throwing", "bow and arrow"]}, {:name => "c7", :district => {:name => "7", :specialty => "lumber", :population => "724,345"}, :rating => "8", :specialty => ["axe handling", "hand to hand combat", "sword throwing", "bow and arrow"]}, {:name => "c8", :district => {:name => "8", :specialty => "textiles", :population => "724,345"}, :rating => "9", :specialty => ["survival skills", "hand to hand combat", "sword throwing", "bow and arrow"]}, {:name => "c9", :district => {:name => "9", :specialty => "grain", :population => "2,309,832"}, :rating => "1", :specialty => ["survival skills", "bow and arrow"]}, {:name => "c10", :district => {:name => "10", :specialty => "livestock", :population => "2,309,832"}, :rating => "9", :specialty => ["knife throwing", "bow and arrow"]}, {:name => "c11", :district => {:name => "11", :specialty => "agriculture", :population => "2,309,832"}, :rating => "3", :specialty => ["survival skills", "bow and arrow"]}, {:name => "Katniss Everdeen", :district => {:name => "12", :specialty => "mining", :population => "324,789"}, :rating => "12", :specialty => ["bow and arrow"]}]

def parse_hunger_games(x)
	specialties = {}
	x.each do |contestant|
		specialties[contestant[:name]] = [contestant[:district][:name], contestant[:district][:specialty], contestant[:specialty][0]]
	end
	specialties
end

b = parse_hunger_games(the_hunger_games_contestants)


client = Soundcloud.new(:client_id => 'd934a1c90d9d16288578bac5d6800e8e', 
  		:client_secret => '23d8c41c38328fc9e4a138789977ba0a')
tracks = client.get('/tracks', :q => 'sea dramas', :licence => 'cc-by-sa')

def parse_tracks(x)
	tracks_info = []
	x.each do |track|
		tracks_info << {:title => track[:title], :duration => track[:duration], :artwork_url => track[:artwork_url], :permalink => track[:permalink] }
	end
	tracks_info
end

c = parse_tracks(tracks) 


