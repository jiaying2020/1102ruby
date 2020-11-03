
#javascript大括號可以獨立存在
#但ruby不行

def say_hello 
    puts "開始"
    yield #把控制權交給block{}
    puts "結束"
end

say_hello {
    puts "這裡是block"
}

5.times do |i|
    puts i
 end
    
#要去查手冊，time讓什麻東西出來 
#全域變數是給系統用的，不要亂下，平常用不到
#程式碼是一行行往下走的

list =[1,2,3,4,5]
result =[]
list.each do |i|
result<< i*2-1
end
p result

# end

list = [1,2,3,4,5]
p list.map {|x|x*2-1}

p [*1..5].select{|x| x.odd?}

#block大部分是做套件給別人用時候，因為內容物可以「抽換」，但沒有辦法單獨存在
#block不是參數
#javascript的變數範圍很大，也不限在fuction裡面使用，但ruby變數只能在fuction裡執行
#netscape與ie之爭
#查map,select,result方法
#沒事不要在block 裡面寫return(控制權轉移)
#keyword argument
#puts沒有回傳值 是nil,印是印東西，會得到一個回傳結果，但p有
#ruby會把最後一行當成回傳結果
#repl 讀取評估迴圈

def hello
    return "123"
    puts "abc"
end
p hello

#只會停在49行，因為控制權交出去了，所以不會執行50行
#可以在return放檢驗機制，因為不過就不會往下執行


#方法1 select 選出來
def my_select(list)
    result =[] 
    list.each do | x| 
        result <<  x if yield(x) 
    end
    result
end
p my_select([1,2,3,4,5]) {|x| x.odd? }  

#方法2 map 判斷t/s
def my_map(list)
    result = [] 
    list.each do |x| 
        result << yield(x) 
    end
    result
end 
p my_map([1,2,3,4,5]) {|x| x.odd? }  

#大括號與 do end 的差別
#大括號優先順序高

#2;13 hash講解
#p111 把block物件化 pdf 2.13d

# pdf 2.13d p5
add_two = Proc.new {|x|x + 2}
p add_two.call(3) #call -> yield(2)
#call是實體方法，內建yield

add_a = Proc.new{|x|x + 2}
add_b = lambda { |n| n + 2 }
add_b = proc { |n| n + 2 }

#add_a 裡{|x|x + 2}只是寄生在new後面，無法單獨存在
#lambda的目的是讓寄生蟲可以單獨存活
#Proc是個類別，Proc.new把block物件化
#Lambda是方法，可以包物件，跟箭頭一樣
#block無法單獨存在，所以被包在物件裡

# class Book < ApplicationRecord
#     scope cheap, -> { where("price <= 100") }
#     end
#注意逗點，新手會忽略

#以上都是proc的一種
#比喻：他們都是一種貓，但品種不同


add_two_proc = Proc.new { |n| n + 2 } #像方法
p add_two_proc.call(1, 2, 3) #正常執⾏，印出 3。2,3被丟掉
#因為絕對值裡面只有一個n，參數是一個蘿蔔一個坑

# add_two_lambda = lambda { |n| n + 2 }
# p add_two_lambda.call(1, 2, 3) # 發⽣生引數個數錯誤

def hello(a, *b)
end
hello(1,2,23,4,5,6,7,8)
    

class Animal
    def eat
        "bbb"
    end
end

class Cat < Animal
    def eat
        "aaa"
    end
end 

kitty = Cat.new
kitty.eat

p Cat.superclass
p Animal.superclass
p Object.superclass
p BasicObject.superclass


module Flyable
    def fly
      puts  " I can fly "
    end
end

class Cat
 include Flyable
end

kitty = Cat.new
kitty.fly
p Cat.ancestors
p Cat.class

#include類似外掛模組，不用繼承屬性
#不想寫兩行，中間要隔分號
#book p.129
#ancestors可以印出資料路徑
#兩個陣列相減，重複會刪掉
#模組不能new，只能加，但class可以
#模組不能繼承，沒有superclass
p Class.instance_methods.count
p Class.instance_methods - Module.instance_methods
# [allocate, new, :superclass]