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
    if @buckets[bucket_index].nil?
      # No existing key-value pair: insert the new key-value pair
      @buckets[bucket_index] = { key: key, value: value }
      # Check if the same key is already present
    elsif @buckets[bucket_index][:key] == key
      # Key already exists, so update the value
      @buckets[bucket_index][:value] = value
    else
      # Collision detected: different key in the same bucket
      puts 'COLLISION: we need a bigger bucket'
    end
  end

  def get(key)
    hash_code = hash(key) # Compute the hash code for the key
    bucket_index = hash_code % @buckets.length # Find the correct bucket
    return nil if @buckets[bucket_index].nil?

    @buckets[bucket_index][:value] if @buckets[bucket_index][:key] == key
  end

  def has?(key)
    @buckets.each do |pair|
      # puts "testing pair:#{pair}"
      next if pair.nil?

      if pair[:key] == key
        # puts 'found'
        return true
      end
    end
    # puts 'none found'
    false
  end

  def remove(key)
    return nil unless has?(key)

    output = get(key)
    hash_code = hash(key) # Compute the hash code for the key
    bucket_index = hash_code % @buckets.length # Find the correct bucket
    @buckets[bucket_index] = nil
    output
  end

  def length
    count = 0
    @buckets.each do |bucket|
      count += 1 unless bucket.nil?
    end
    count
  end

  def clear
    @buckets.fill(nil)
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      keys << bucket[:key] unless bucket.nil?
    end
    keys
  end

  def values
    values = []
    @buckets.each do |bucket|
      values << bucket[:values] unless bucket.nil?
    end
    values
  end

  def entries
    entries = []

    @buckets.each do |bucket|
      entries << [bucket[:key], bucket[:value]] if bucket
    end

    entries
  end
end
