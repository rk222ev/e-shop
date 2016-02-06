

default_admin_password = "password"

Admin.create(email: "admin@example.com",
             password: default_admin_password,
             password_confirmation: default_admin_password)

(1..200).each do |i|
  Product.create(name: "product #{i}",
                 price: 500 - rand(500),
                 quantity: 100 - rand(100),
                 description: "Lorem ipsum dolor...")
end
