def some?(arr, &proc)
    arr.each do |elm|
        return true if proc.call(elm)
    end
    false
end

def exactly?(arr, num, &proc)
    counter = 0
    arr.each do |elm|
        counter += 1 if proc.call(elm)
    end
    if counter == num
        return true
    else
        return false
    end
end

def filter_out(arr, &proc)
    newArr = []
    arr.each do |elm|
        newArr.push(elm) if !proc.call(elm)
    end
    newArr
end

def at_least?(arr, num, &proc)
    counter = 0
    arr.each do |elm|
        counter += 1 if proc.call(elm)
    end
    if counter >= num
        return true
    else
        return false
    end
end

def every?(arr, &proc)
    arr.each do |elm|
        return false if !proc.call(elm)
    end
    true
end

def at_most?(arr, num, &proc)
    counter = 0
    arr.each do |elm|
        counter += 1 if proc.call(elm)
    end
    if counter <= num
        return true
    else
        return false
    end
end

def first_index(arr, &proc)
    arr.each_with_index do |elm, i|
        return i if proc.call(elm)
    end
    nil
end

def xnor_select(arr, proc, proc2)
    newArr = []
    arr.each do |elm|
        newArr.push(elm) if (proc.call(elm) && proc2.call(elm)) || !(proc.call(elm) || proc2.call(elm))
    end
    newArr
end

def filter_out!(arr, &proc)
    i = 0
    while i < arr.length
        if proc.call(arr[i]) 
            arr.delete(arr[i])
            i = 0
            next
        end
        i += 1
    end
    arr
end

def multi_map(arr, num = 1, &proc)
    (1..num).each do |i|
        arr = arr.map { |elm| proc.call(elm)}
    end
    arr
end

def proctition(arr, &proc)
    accArr = []
    rejArr = []
    arr.each do |elm|
        if proc.call(elm) 
            accArr.push(elm)
        else
            rejArr.push(elm)
        end
    end
    return accArr + rejArr
end

def selected_map!(arr, proc1, proc2)
    arr.map! do |elm|
        if(proc1.call(elm))
            proc2.call(elm)
        else
            elm
        end
    end
    nil
end

def chain_map(num, arr)
    arr.each do |proc|
        num = proc.call(num)
    end
    num
end

def proc_suffix(str, hash)
    strArr = str.split(" ")
    newstrArr = Array.new(strArr)
    hash.each do |key, val|
        newstrArr.map!.with_index do |elm, i|
            if key.call(strArr[i])
                elm + val
            else
                elm
            end
        end
    end
    newstrArr.join(" ")
end

def proctition_platinum(arr, *args)
    hash = Hash.new{|h,k| h[k] = Array.new }
    args.each_with_index do |elm,i|
        hash[i+1] = []
    end
    arr.each do |elm|
        (1..args.length).each do |i|
            if(args[i-1]).call(elm)
                hash[i].push(elm)
                break
            end
        end
    end
    hash
end

def procipher(str, hash) 
    strArr = str.split(" ")
    newStrArr = Array.new(strArr)
    hash.each do |key, val|
        strArr.each_with_index do |elm, i|
            if key.call(elm)
                newStrArr[i] = val.call(newStrArr[i])
            end
        end
    end
    newStrArr.join(" ")
end

def picky_procipher(str, hash)
    strArr = str.split(" ")
    newStrArr = Array.new(strArr)
    hash.each do |key, val|
        strArr.each_with_index do |elm, i|
            if key.call(elm)
                newStrArr[i] = val.call(newStrArr[i])
                break
            end
        end
    end
    newStrArr.join(" ")
end