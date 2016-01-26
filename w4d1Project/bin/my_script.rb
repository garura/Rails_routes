require 'addressable/uri'
require 'rest_client'
require 'byebug'


def show_index
  index_url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.get(index_url)

end

def show_create
  create_url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json',
  ).to_s
  # begin
    puts RestClient.post(create_url, { user: {name: "test"} })
  rescue RestClient::UnprocessableEntity => e
    p e.response
  # end
end


def show_show
  create_url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json', # how to make this modular? :id
  ).to_s
    puts RestClient.get(create_url)
  rescue RestClient::ResourceNotFound => e
    p "404 - File not found"
end

def show_update
  update_url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/10.json',
  ).to_s

    puts RestClient.patch(update_url, { user: { name: "Glob", email: "glob@glob.glob" } })
  rescue RestClient::UnprocessableEntity => e
    p e.class, e.response
  rescue RestClient::ResourceNotFound => e
    p "404 - File not found"
end

def show_destroy
  destroy_url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2.json',
  ).to_s
  puts RestClient.delete(destroy_url)
  rescue RestClient::ResourceNotFound => e
    p "404 - File not found"
end

# show_create
# show_index
show_show
# show_update
# show_destroy

# url3 = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/123.json',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s





# puts RestClient.patch(url2,{
#   'id' => 5,
#   'some_category' => {
#     'a_key' => 'another value',
#     'a_second_key' => 'yet another value',
#     'inner_inner_hash' => {
#       'key' => 'value'}
#   },
#   'something_else' => 'aaahhhhh'
# })

# puts RestClient.get(url3)
