def duos(str)
    counter = 0
    (1..str.length).each do |i|
        if str[i-1] == str[i]
            counter += 1
        end
    end
    counter
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0