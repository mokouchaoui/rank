require "oauth2"
UID = "5f098420ac985c69454de207c0ed775aa09f12c7e1e2dc7d7070dd6ec27d49da"
SECRET = "14642a473c3549245fb4250b701349f5c11cbe31461a60693aacf30d7facee90"
client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
token = client.client_credentials.get_token

response = token.get("/v2/campus/39")
response.status
# => 200
response.parsed
puts response.inspect
# => {"id"=>1, "name"=>"Paris", "time_zone"=>"Europe/Paris", "language"=>{"id"=>1, "name"=>"Français", "identifier"=>"fr"}, "users_count"=>22997, "vogsphere_id"=>1, "country"=>"France", "address"=>"96, boulevard Bessières", "zip"=>"75017", "city"=>"Paris", "website"=>"http://www.42.fr/", "facebook"=>"https://facebook.com/42born2code", "twitter"=>"https://twitter.com/42born2code", "active"=>true, "public"=>true, "email_extension"=>"42.fr", "default_hidden_phone"=>false, "endpoint"=>{"id"=>33, "url"=>"https://endpoint.42paris.fr", "description"=>"42paris's new ldapkdc endpoint", "created_at"=>"2021-06-14T07:49:14.872Z", "updated_at"=>"2021-06-28T15:24:45.089Z"}}
