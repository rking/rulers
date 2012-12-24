module Rulers
  module Model
    class FileModel
      def initialize(hash)
        @hash = hash
      end

      def [](key)
        @hash[key.to_s]
      end

      def []=(key, val)
        @hash[key] = val
      end

      def self.find(id)
        hash = MultiJson.decode(read_quote(id))
        FileModel.new(hash)
      end

      private
      def self.read_quote id
        id = id.to_i
        path = "db/quotes/#{id}.json"
        return unless File.exists?(path)
        File.read(path)
      end
    end
  end
end
