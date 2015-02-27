user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

city_list = [
    ["Paris", "Pr"],
    ["London", "Ld"],
    ["Warsaw", "Wr"],
    ["Tokyo", "Tk"],
    ["New York", "Ny"],
    ["Madrid", "Md"]
]

city_list.each do |name, short_name|
  City.create(name: name, short_name: short_name)
end