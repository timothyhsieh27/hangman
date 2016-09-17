
old_dict = File.readlines "/usr/share/dict/words"
new_dict = old_dict.map do |x| x.chomp end

easy_array = []
normal_array = []
difficult_array = []

puts "Please type 'Easy', 'Normal', or 'Difficult' to select the difficulty of your mystery word: "
game_choice = gets.chomp.downcase

def store_sort_words(all_words, choice, word, all_easy, all_normal, all_difficult)
  if choice == "easy"
    all_words.each do |word|
      if  4 <= word.length && word.length <= 6
        all_easy << word
      end
    end
  elsif choice == "normal"
    all_words.each do |word|
      if  6 <= word.length && word.length <= 8
        all_normal << word
      end
    end
  elsif choice == "difficult"
    all_words.each do |word|
      if  8 <= word.length
        all_difficult << word
      end
    end
  end
end
#based on the user's answer in line 9, creates a bank of possible answer choices of the appropriate length in the appropriate array.

a_word = new_dict.each #ask how I did this.

store_sort_words(new_dict, game_choice, a_word, easy_array, normal_array, difficult_array)

p easy_array
p normal_array
p difficult_array
