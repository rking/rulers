module Rulers
  module Model
    class FileModel
      def initialize path
        @path = path
        # Note: Page 52 makes this excessively verbose:
        @id = File.basename(path, '.yml').to_i
        # Note: Page 52 has no sanity check on this, it seems. Sort of fixing:
        actual_path = "db/quotes/#{@id}.yml"
        @hash = YAML.load_file actual_path
      end

      def [] key; @hash[key.to_s] end
      def []= key, val; @hash[key] = val end

      def self.find id
        redundant_against_above = "db/quotes/#{id}.yml"
        FileModel.new redundant_against_above
      rescue
        p $!
        raise "FileModel for #{id} not found"
        # Note: page 53 says this will return nil when not found. It won't.
      end
    end
  end
end
