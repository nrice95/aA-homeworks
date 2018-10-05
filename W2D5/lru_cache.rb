class LRUCache
    attr_reader :size
    attr_accessor :cache

    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      self.cache.count
    end

    def add(el)
      idx = self.cache.index(el)
      unless idx.nil?
        self.cache.delete_at(idx)
      end
      self.cache << el
      self.cache.shift if count > self.size
    end

    def show
      # shows the items in the cache, with the LRU item first
      print self.cache
      puts
      self.cache      
    end

    private
    # helper methods go here!

  end
