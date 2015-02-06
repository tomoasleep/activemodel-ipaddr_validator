require 'spec_helper'

# Shared examples for value.

shared_examples_for 'valid IPv4 string is given', given: :ipv4 do
  let(:value) do
    '192.168.2.0/24'
  end
end

shared_examples_for 'valid IPv6 string is given', given: :ipv6 do
  let(:value) do
    '3ffe:505:2::1'
  end
end

shared_examples_for 'valid IPv4 array is given', given: :ipv4_array do
  let(:value) do
    ['192.168.2.0/24', '192.168.3.0/24']
  end
end

shared_examples_for 'valid IPv6 array is given', given: :ipv6_array do
  let(:value) do
    ['3ffe:505:2::1', '3ffe:505:2::2']
  end
end

shared_examples_for 'invalid string is given', given: :invalid do
  let(:value) do
    'invalid ipaddr'
  end
end

shared_examples_for 'invalid array is given', given: :invalid_array do
  let(:value) do
    ['invalid ipaddr']
  end
end

# Shared examples for options.

IpaddrValidator.default_options.keys.product([true, false]).each do |option, value|
  shared_examples_for "#{option} is #{value}", option => value do
    let(option) do
      value
    end
  end
end

describe IpaddrValidator do
  let(:options) do
    options = {}
    described_class.default_options.keys.each do |option_name|
      options[option_name] = send(option_name) if respond_to? option_name
    end
    options
  end

  describe '.valid?' do
    subject do
      described_class.valid?(value, options)
    end

    context 'when a valid IPv4 string is given', given: :ipv4 do
      context 'and ipv4 option is true', ipv4: true do
        context 'and array option is true', array: true do
          it { should be_falsey }
        end

        context 'and array option is false', array: false do
          it { should be_truthy }
        end
      end

      context 'and ipv4 option is false', ipv4: false do
        it { should be_falsey }
      end
    end

    context 'when a valid IPv6 string is given', given: :ipv6 do
      context 'and ipv6 option is true', ipv6: true do
        context 'and array option is true', array: true do
          it { should be_falsey }
        end

        context 'and array option is false', array: false do
          it { should be_truthy }
        end
      end

      context 'and ipv6 option is false', ipv6: false do
        it { should be_falsey }
      end
    end

    context 'when a valid IPv4 array is given', given: :ipv4_array do
      context 'and ipv4 option is true', ipv4: true do
        context 'and array option is true', array: true do
          it { should be_truthy }
        end

        context 'and array option is false', array: false do
          it { should be_falsey }
        end
      end

      context 'and ipv4 option is false', ipv4: false do
        it { should be_falsey }
      end
    end

    context 'when a valid IPv6 array is given', given: :ipv6_array do
      context 'and ipv6 option is true', ipv6: true do
        context 'and array option is true', array: true do
          it { should be_truthy }
        end

        context 'and array option is false', array: false do
          it { should be_falsey }
        end
      end

      context 'and ipv6 option is false', ipv6: false do
        it { should be_falsey }
      end
    end

    context 'when an invalid string is given', given: :invalid do
      context 'and array option is true', array: true do
        it { should be_falsey }
      end

      context 'and array option is false', array: false do
        it { should be_falsey }
      end
    end

    context 'when an invalid array is given', given: :invalid_array do
      context 'and array option is true', array: true do
        it { should be_falsey }
      end

      context 'and array option is false', array: false do
        it { should be_falsey }
      end
    end
  end
end
