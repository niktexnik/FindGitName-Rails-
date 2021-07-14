# frozen_string_literal: true

require_relative './name_generator.rb'
require_relative './parser.rb'
require_relative './check.rb'
require_relative './github_api.rb'
class Main
  def self.call(name, numeric)
    begin
      parsed_name = Parser.parse_name(name)
      parsed_numeric = Parser.parse_numeric(numeric)
    rescue Parser::ParseError => e
      puts e.message
    end

    generated_names = NameGenerator.process(parsed_name, parsed_numeric)
    generated_names.each do |name|
      begin
        checked_name = CheckUsername.process(name)
      rescue CheckUsername::CheckNameError => e
        puts e.message
        next
      end
      checked_name
    end
  end
end
Main.new.call
