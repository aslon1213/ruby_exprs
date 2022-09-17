require 'erb'

meaning_of_lif = 42

question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_lif %>"
template = ERB.new question

results = template.result(binding)
puts results