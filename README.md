# rails-messages-transfer-project

This is an upgraded version of sinatra-messages-transfer-project (a social web application for users to interact with friends) adding posts, messages functions and rebuilding using Ruby on Rails


## Installation

- Clone this repository from github to your desired folder, cd to ```rails-messages-transfer-project``` directory
- This web application requires to install quite a few gems in order to work so please check out the ***gemfile*** before running. It mainly needs these fundamental gems: bundler, ruby, rails, node, thin,...

- After install these gems, in the terminal type:
```
$ bundle install
```
```
$ rake db:migrate
```
```
$ rake db:seed
```

## Usage

- Type the command below
```
$ rails server thin
```
-  Then enter your browser : http://localhost:3000/ to start the web application in your local machine


> ***In order for user to have better first hand experience/interaction.***
> ***I already made up some accounts and messages between the existing users***
> ***. Please log in with the account provided below for better experience.***


| Username: | robindao
| :-- | :-- |
| Password:  | nhinh12345


- Log out, then create a new account or Log in using your facebook account

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[nhinhdao]/sinatra-messages-transfer-project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MarvelBestSuperheroes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[nhinhdao]/sinatra-messages-transfer-project/blob/master/CODE_OF_CONDUCT.md).
