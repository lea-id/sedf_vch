class ConvertToHaml
  def initialize
    @from_path = File.join(File.dirname(__FILE__), 'app', 'views')
  end

  def convert!
    Dir["#{@from_path}/**/*.erb"].each do |file|
      puts file
      # for each .erb file in the path, convert it & output to a .haml file
      `bundle exec html2haml -ex #{file} #{file.gsub(/\.erb$/, '.haml')}`
    end
  end
end
