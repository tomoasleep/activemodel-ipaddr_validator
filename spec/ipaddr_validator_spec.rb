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

shared_examples_for 'valid IPv4 IPAddr is given', given: :ipv4_ipaddr do
  let(:value) do
    IPAddr.new('192.168.2.0/24')
  end
end

shared_examples_for 'valid IPv6 IPAddr is given', given: :ipv6_ipaddr do
  let(:value) do
    IPAddr.new('3ffe:505:2::1')
  end
end

shared_examples_for 'valid IPv4 array of IPAddrs is given', given: :ipv4_array_ipaddr do
  let(:value) do
    [IPAddr.new('192.168.2.0/24'), IPAddr.new('192.168.3.0/24')]
  end
end

shared_examples_for 'valid IPv6 array of IPAddrs is given', given: :ipv6_array_ipaddr do
  let(:value) do
    [IPAddr.new('3ffe:505:2::1'), IPAddr.new('3ffe:505:2::2')]
  end
end

shared_examples_for 'invalid string is given', given: :invalid_ipaddr do
  let(:value) do
    nil
  end
end

shared_examples_for 'invalid array is given', given: :invalid_array_ipaddr do
  let(:value) do
    [nil]
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

    context 'when strings are given' do
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

    context 'when IPAddrs are given' do
      context 'when a valid IPv4 IPAddr is given', given: :ipv4_ipaddr do
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

      context 'when a valid IPv6 IPAddr is given', given: :ipv6_ipaddr do
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

      context 'when a valid IPv4 array of IPAddrs is given', given: :ipv4_array_ipaddr do
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

      context 'when a valid IPv6 array of IPAddrs is given', given: :ipv6_array_ipaddr do
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

      context 'when an invalid IPAddr is given', given: :invalid_ipaddr do
        context 'and array option is true', array: true do
          it { should be_falsey }
        end

        context 'and array option is false', array: false do
          it { should be_falsey }
        end
      end

      context 'when an invalid array  of IPAddrs is given', given: :invalid_array_ipaddr do
        context 'and array option is true', array: true do
          it { should be_falsey }
        end

        context 'and array option is false', array: false do
          it { should be_falsey }
        end
      end
    end
  end

  describe 'validation' do
    subject do
      model_class.new(attr: value)
    end

    let(:model_class) do
      opts = options
      Class.new(TestModel) do
        validates :attr, ipaddr: opts
      end
    end

    context 'when invalid value is given', given: :invalid do
      it { should be_invalid }
    end

    context 'when invalid array is given', given: :invalid_array do
      it { should be_invalid }
    end

    context 'when default option is used' do
      let(:options) do
        true
      end

      context 'and IPv4 string is given', given: :ipv4 do
        it { should be_valid }
      end

      [:ipv4_array, :ipv6, :ipv6_array].each do |given|
        context "and #{given} is given", given: given do
          it { should be_invalid }
        end
      end
    end

    context(
      'when ipv4 and ipv6 options are true and false respectively',
      ipv4: true, ipv6: false
    ) do
      context 'and array option is true', array: true do
        context 'and IPv4 array is given', given: :ipv4_array do
          it { should be_valid }
        end

        [:ipv4, :ipv6, :ipv6_array].each do |given|
          context "and #{given} is given", given: given do
            it { should be_invalid }
          end
        end
      end

      context 'and array option is false', array: false do
        context 'and IPv4 string is given', given: :ipv4 do
          it { should be_valid }
        end

        [:ipv4_array, :ipv6, :ipv6_array].each do |given|
          context "and #{given} is given", given: given do
            it { should be_invalid }
          end
        end
      end
    end

    context(
      'when ipv4 and ipv6 options are false and true respectively',
      ipv4: false, ipv6: true
    ) do
      context 'and array option is true', array: true do
        context 'and IPv6 array is given', given: :ipv6_array do
          it { should be_valid }
        end

        [:ipv4, :ipv4_array, :ipv6].each do |given|
          context "and #{given} is given", given: given do
            it { should be_invalid }
          end
        end
      end

      context 'and array option is false', array: false do
        context 'and IPv6 string is given', given: :ipv6 do
          it { should be_valid }
        end

        [:ipv4, :ipv4_array, :ipv6_array].each do |given|
          context "and #{given} is given", given: given do
            it { should be_invalid }
          end
        end
      end
    end
  end
end
