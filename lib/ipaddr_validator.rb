require 'ipaddr'

class IpaddrValidator < ActiveModel::EachValidator
  class << self
    def valid?(value, options = {})
      options = default_options.merge(options)
      array =
        if options[:array]
          return false unless value.is_a?(Array)
          value
        else
          [value]
        end
      array.all? do |value|
        validate_single_ipaddr(value, options)
      end
    end

    def default_options
      { ipv4: true, ipv6: false, array: false }
    end

    private

    def validate_single_ipaddr(value, options)
      ip =
        if value.is_a?(IPAddr)
          value
        else
           IPAddr.new(value)
        end
      case
      when options[:ipv4] && ip.ipv4?
        true
      when options[:ipv6] && ip.ipv6?
        true
      else
        false
      end
    rescue IPAddr::Error
      false
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value, options)
      record.errors.add(attribute, options[:message] || :invalid_ipaddr)
    end
  end
end
