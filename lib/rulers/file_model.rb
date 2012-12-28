module Rulers
  module Model
    class FileModel
      def initialize id
        @id = id.to_i
        @path = self.class._path_pattern % id
        @hash = YAML.load_file @path
      end

      def [] key; @hash[key.to_sym] end
      def []= key, val; @hash[key] = val end

      class << self
        def find id
          FileModel.new id
        end

        def all
          all_ids.map{|e| FileModel.new e}
        end

        def all_ids
          Dir[_path_pattern % '*'].map do |yaml|
            File.basename(yaml, '.yml').to_i
          end
        end

        def create attrs
          [:submitter, :quote, :attribution].each do |key|
            attrs[key] ||= ''
          end
          id = 1 + all_ids.max
          path = _path_pattern % id
          File.write path, YAML.dump(attrs)

          new id
        end

        def _path_pattern; 'db/quotes/%s.yml' end
      end
    end
  end
end
