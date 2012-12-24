module Rulers
  module Model
    class FileModel
      def initialize id
        @id = id.to_i
        @path = "db/quotes/#{@id}.yml"
        @hash = YAML.load_file @path
      end

      def [] key; @hash[key.to_s] end
      def []= key, val; @hash[key] = val end

      def self.find id
        FileModel.new id
      end
    end
  end
end
