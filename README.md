# WardenSkeletonKey

[![Gem Version](https://badge.fury.io/rb/warden_skeleton_key.svg)](http://badge.fury.io/rb/warden_skeleton_key)

WardenSkeletonKey is a Rack middleware to automatically log you into 
your development environment. Saving you seconds and from forgetting
those testing passwords. Was it "test123"?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'warden_skeleton_key'
```

And then execute:

    $ bundle

Add the middleware to your Rails development environment:

```ruby
# config/environments/development.rb

Application.configure do
  # ...

  if ENV["SKIP_SKELETON_KEY"].blank?
    config.middleware.use WardenSkeletonKey do
      # Return a user object to log in
      developer_email = `git config user.email`.chomp
      User.find_by email: [developer_email, 'admin@example.com']
    end
  end
end
```

## Usage

The block provided to WardenSkeletonKey must return a valid user object.
How that user is located is up to you because every system is different.
Above we're using the current user's git email address and falling 
back to the default "admin@example.com".

With the above configuration 
it is possible to skip the middleware entirely using ENV variables
when you want to restore the log in functionality:

```shell
$ SKIP_SKELETON_KEY=true rails server  # skip the middleware
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/warden_skeleton_key/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
