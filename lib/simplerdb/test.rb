require 'query_language'
require 'simplerdb'

parser = Dhaka::Parser.new(QueryGrammar)
#File.open('dice_parser.rb', 'w') {|file| file << parser.compile_to_ruby_source_as(:DiceParser)}
    lexer = Dhaka::Lexer.new(QueryLexerSpec)
 #  File.open('dice_lexer.rb', 'w') {|file| file << lexer.compile_to_ruby_source_as(:DiceLexer)}
 t = lexer.lex(ARGV[0])
    result = parser.parse(t)
    
    
    #puts result.unexpected_token
    
    domain = Domain.new("test")
    
    item = domain.items["item1"]
    attributes = [ AttributeParam.new("a1", "v1")]
    attributes.each { |attr| item.put_attribute(attr) }
    
    item = domain.items["item2"]
    attributes = [ AttributeParam.new("a1", "v1"), AttributeParam.new("a1", "v2")]
    attributes.each { |attr| item.put_attribute(attr) }
    
    set = QueryExecutor.new.do_query(ARGV[0], domain)
    set.each { |s| puts s }