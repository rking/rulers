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

      class << self
        def find id
          FileModel.new id
        end

        def all
          Dir['db/quotes/*.yml'].map do |yaml|
             FileModel.new File.basename yaml, '.yml'
          end
        end
      end
    end
  end
end
