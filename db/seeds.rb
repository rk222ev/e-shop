

default_admin_password = "password"

Admin.create(email: "admin@example.com",
             password: default_admin_password,
             password_confirmation: default_admin_password)
