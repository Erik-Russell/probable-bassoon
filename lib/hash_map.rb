# frozen_string_literal: true

# lib/hash_map.rb

# HashMap - create and manage a hash map
class HashMap
  attr_reader :buckets

  def initialize
    @buckets = Array.new(16)
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash_code = hash(key) # Compute the hash code for the key
    bucket_index = hash_code % @buckets.length # Find the correct bucket
    # Initialize the bucket if it's empty
    @buckets[bucket_index] ||= []

    # Check if the key already exists in the bucket
    @buckets[bucket_index].each do |pair|
      if pair.key?(key)
        pair[key] = value # Key exists, update the value
        break
      end
    end

    # If the key doesn't exist, add a new hash { key => value }
    @buckets[bucket_index] << { key => value }
  end
end
