def duos(str)
    counter = 0
    (1..str.length).each do |i|
        if str[i-1] == str[i]
            counter += 1
        end
    end
    counter
end

def sentence_swap(str, hash)
    strArr = str.split(" ")
    strArr.map! do |elm|
        if hash.has_key?(elm)
            hash[elm]
        else
            elm
        end
    end
    strArr.join(" ")
end

def hash_mapped(hash, proc1, &proc2)
    newHash = Hash.new()
    hash.each do |key, val|
        newHash[proc2.call(key)] = proc1.call(val)
    end
    newHash
end

def counted_characters(str)
    charHash = Hash.new(0)
    charArr = []
    str.each_char do |elm|
        charHash[elm] += 1
    end
    charHash.each do |key, val|
        if val > 2
            charArr.push(key)
        end
    end
    charArr
end

def triplet_true(str)
    counter = 1
    (1...str.length).each do |i|
        if str[i] == str[i-1]
            counter += 1
        else
            counter = 1
        end
        if counter >=3 
            return true
        end
    end
    false
end

def energetic_encoding(str, hash)
    strArr = str.split("")
    strArr.map! do |elm|
        if hash.has_key?(elm)
            hash[elm]
        elsif elm == " "
            elm
        else
            "?"
        end
    end
    strArr.join("")
end

def uncompress(str)
    newStr = ""
    strArr = str.split("")
    (1...strArr.length).each do |i|
        newStr += strArr[i-1] * strArr[i].to_i
    end
    newStr
end

def conjunct_select(arr, *args)
    args.each do |proc|
        arr.select! do |elm|
            proc.call(elm)
        end
    end
    arr
end

def convert_pig_latin(str)
    strArr = str.split(" ")
    strArr.map! do |word|
        if word.length < 3
            word
        elsif "aeiou".include?(word[0].downcase)
            word += "yay"
        else
            isCapital = false
            isCapital = true if word[0].upcase == word[0]

            splitIndex = word.index(/[aeiou]/)
            newWord = word[splitIndex..-1].downcase + word[0...splitIndex].downcase + "ay"

            if isCapital
                newWord[0].upcase + newWord[1..-1]
            else
                newWord
            end
        end
    end
    strArr.join(" ")
end

def reverberate(str)
    strArr = str.split(" ")
    strArr.map! do |word|
        if word.length < 3
            word
        elsif "aeiou".include?(word[-1].downcase)
            word += word
        else
            isCapital = false
            isCapital = true if word[0].upcase == word[0]

            splitIndex = word.rindex(/[aeiou]/)
            newWord = word.downcase + word[splitIndex..-1].downcase

            if isCapital
                newWord[0].upcase + newWord[1..-1]
            else
                newWord
            end
        end
    end
    strArr.join(" ")
end

def disjunct_select(arr, *args)
    newArr = []
    arr.each.with_index do |elm, i|
        args.each do |proc|
            if proc.call(elm)
                newArr.push(elm)
                break
            end
        end
    end
    newArr
end

def alternating_vowel(str)
    vowels = /[aeiou]/
    strArr = str.split(" ")
    strArr.map!.with_index do |word, i|
        if !word.index(vowels)
            word
        elsif i % 2 == 0
            firstVowel = word.index(vowels)
            word[0...firstVowel] + word[firstVowel+1..-1]
        else 
            lastVowel = word.rindex(vowels)
            word[0...lastVowel] + word[lastVowel+1..-1]
        end
    end
    strArr.join(" ")
end

def silly_talk(str)
    vowels = "aeiou"
    strArr = str.split(" ")
    strArr.map!.with_index do |word, i|
        if vowels.include?(word[-1])
            word + word[-1]
        else
            newWord = ""
            word.each_char do |char|
                if vowels.include?(char)
                    newWord += char + "b" + char
                else 
                    newWord += char
                end
            end
            newWord
        end
    end
    strArr.join(" ")
end

def compress(str)
    strArr = str.split("")
    newArr = []
    counter = 1
    (1..strArr.length).each do |i|
        if strArr[i-1] == strArr[i]
            counter += 1
        else
            newArr.push(strArr[i-1])
            if counter > 1
                newArr.push(counter)
            end
            counter = 1
        end
    end
    newArr.join("")
end
