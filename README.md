# Flowaker

Are you bummed out by acceptance specs taking forever? Do you go through the whole sign in and creation process through the application everytime you want to just test, say, deleting a resource? Wouldn't it be nice if you could maintain well-organized, modular specs but not have to do all that? Now you can!

Flowaker is intended to provide organization and helpful output for specs with the understanding that each `step` block is part of the `flow`, meaning that it's dependent on preceding steps.

Only RSpec is currently supported. Feel free to add support of additional testing frameworks!

## Installation

Add this line to your application's Gemfile:

    gem 'flowaker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flowaker

Finally, in your spec helper, add:

    require 'flowaker/rspec'

## Usage

Here's an example:

```ruby
feature 'Posts', js: true do
  background do
    sign_in(:admin)
  end

  flow 'Post CRUD flow', js: true do
    step 'Viewing all' do
      visit '/admin/posts'
      expect(page).to have_content 'All Posts'
      # etc ...
    end

    step 'Creating' do
      click_on 'Add New Post'
      # etc ...
    end

    step 'Editing' do
      # etc ...
    end

    step 'Deleting' do
      # etc ...
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
