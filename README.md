## README

### Description

A very basic web shop.

### Info about app

- Ruby version
    - Ruby 2.3.0

- System dependencies
    - Docker
    - ImageMagick see: https://github.com/thoughtbot/paperclip#image-processor

- Database creation
    ```shell
    $ docker-compose start
    $ bundle exec rake db:setup
    ```

- How to run the test suite
    ```shell
    $ bundle exec rspec
    ```

- Credentials 
  ```
  admin/
  email: user@example.com
  password: password
  ```
