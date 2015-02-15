# activemodel-ipaddr_validator

[![Build Status](https://travis-ci.org/yuku-t/activemodel-ipaddr_validator.svg?branch=master)](https://travis-ci.org/yuku-t/activemodel-ipaddr_validator) [![Code Climate](https://codeclimate.com/github/yuku-t/activemodel-ipaddr_validator/badges/gpa.svg)](https://codeclimate.com/github/yuku-t/activemodel-ipaddr_validator) [![Coverage Status](https://coveralls.io/repos/yuku-t/activemodel-ipaddr_validator/badge.svg)](https://coveralls.io/r/yuku-t/activemodel-ipaddr_validator) [![Dependency Status](https://gemnasium.com/yuku-t/activemodel-ipaddr_validator.svg)](https://gemnasium.com/yuku-t/activemodel-ipaddr_validator)


## Usage

Add to your Gemfile:

```rb
gem 'activemodel-ipaddr_validator'
```

Run:

```
bundle install
```

Then add the following to your model:

```rb
validates :my_ipaddr_attribute, ipaddr: true
```

### Custom options

Name    | Value   | Default | Description
--------|---------|---------|-------------------------------------
`ipv4`  | Boolean | true    | Accept IPv4.
`ipv6`  | Boolean | false   | Accept IPv6.
`array` | Boolean | false   | Expect an array of strings.

```rb
validates :ipv6s_attribute, ipaddr: { array: true, ipv4: false, ipv6: true }
serialize :ipv6s_attribute, Array
```

## Validation outside a model

If you need to validate an IP outside a model, you can do that:

```rb
IpaddrValidator.valid?(value, options)
```
