# Brewmaster

Given a configuration will install homebrew/brew-cask/ruby-build/chruby and use them to install brews, casks, and rubies.

## Installation

Add this line to your application's Gemfile:

    gem 'brewmaster'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brewmaster

## Usage ##

### Create ~/.bootstrap.yml ###

    --- 
    brews:
    - jq
    - chruby
    - ruby-build
    casks:
    - handbrake
    rubies:
    - 2.0.0-p195

`brewmaster --bootstrap`

## This will: ##

### Install homebrew ###

`ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`

### Tap brew-cask ###

`brew tap phinze/homebrew-cask`
`brew install brew-cask`

### Installs ruby-build and chruby ###

`brew install ruby-build chruby`

### Then it will: ###

* Install any listed brews
* Upgrade any listed outdated brews
* Install any listed casks
* Install any listed rubies with ruby-build into `~/.rubies/{{version}}`

## Contributing ##

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
