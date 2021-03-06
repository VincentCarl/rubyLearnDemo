#循环
from=0
to=10
sum=0
for i in from..to  #.. 包含to  ...不包含to
	sum=sum+i #sum+=i
	#puts sum
end
p sum

#

names=["alex","ailen","adele"]
for name in names 
	print name,"\n"
end
names.each{|name|
	print name,"\n"

}
(1..5).each{|name|
	print name,"\n"
}
(1...5).each{|name|
	print name,"\n"
}

i=0
while i<3
	print i,"\n"
	i+=1
end

sum=0
until sum>=50
	sum+=i
	i+=1
end
print sum

#loop 没有结束条件 只是不断进行循环
#需要和break配合 
#next 类似java continue
#redo 以相同条件重新进行这一次循环

loop{	
	if(i==40)
		break;
	elsif i==20
		i+=1;
		redo;
		print "redo i=20"

	end


	i+=1
	print "ruby",i,"\t"
}

#redo 详解  redo 必须在redo 之前做循环增加 类似next 
#但是redo之后的语句也会执行
i=0
["adele","alex","alen","demon"].each{|name|
	i+=1
	if(i===3)
		redo;
	end
	print [i,name]
}

#abbbabbbaaaaababbb=>abababab=>ab
arr="abbbabbbaaaaababbb"
for i in 0..(arr.length-1)
	if(arr[i+1]==arr[i])
		#待删除删除arr[i]
		arr[i]="-";
	end
end

i=0
while (i<(arr.length-1))
	if(arr[i]==="-")
		#删除删除-
		arr[i]="";
		i-=1
		next
	end
	i+=1
end

puts arr

#继承 <
class RingArray < Array
	def [](i) #重新 定义运算符[]
		idx=i%size
		super(idx) #调用父类众同名的方法
	end
end

eto=RingArray["1","2","3","4"]
arr=Array["1","2","3","4"]
p eto[5]  #2
p eto[12] #1

p arr[5]  #nil
p arr[12] #nil

#public private protected

class Point
	attr_accessor:x,:y #定义访问方法
	
	def pub
		puts "pub is a public method"
	end
	def pub2
		puts "pub is a public method"
	end
	public :pub,:pub2  #注意add :
	private #没有指定实参的话
			#下面定义的所有方法都是 private
	def priv
		puts "priv is a private method"
	end
	
	protected
	def pro
		puts "pro is a pro method"
	end
	
	
end
puts Point.new.pub
#puts Point.new.pro  protected  子类和自 内部
#puts Point.new.priv   private 方法和java一样

#!!面向对象的好处
#！！！！面向对象之前的数据处理方式
#大赞 数据与处理程序的问题 
#!!!把数据与处理程序分开看待  pg 96页
#eg 检索程序
def search_info(book,name)
	for i in book.data	
		if i.name==name
			return i
		end
	end
end
#search_info(addr_book,"adele")
#存在问题 当数据结构改变时 无法进行简单调整
#book 的姓和名分开  此时需要修改 同理如果有新增与删除等操作也要进行修改
def search_info2(book,name)
	for i in book.data	
		if (i.firstname+i.secondname)
			return i
		end
	end
end

class AddressBook
	attr_accessor :name
	attr_accessor :data
	#... other thing
end
class PersonalInfo
	attr_accessor :firstname
	attr_accessor :secondname
	#....
end

#这样当数据结构改变需要加上新的处理程序
#这样很多相似的数据不断追加新的处理程序 #这会让程序变得很复杂
#实际开发中数据结构修改与追加是家常便饭 
#很多人思考如何更容易应对数据的变更 最后找到一个解决方法 就是面向对象

#面向对象 对象除了拥有数据以外还拥有行为
#！！！谁拥有数据谁就拥有操作数据的方法
class PersonalInfo2
	attr_accessor :firstname
	attr_accessor :secondname
	#........
	#行为
	def name
		return @firstname+@secondname
	end
end
#通讯录
class AddressBook
	attr_accessor :name
	attr_accessor :data #PersonalInfo
	
	def search_info(name)
		for i in data	
			if i.name==name
				return i
			end
		end
	end
end
=begin 这样的好处 只有PersonalInfo能够回答name是什么
因此当通讯录(AddressBook)中无论存放那种个人信息(PersonalInfo)
相关处理部分(AddressBook.search_info)都不需要修改
#如果需要修改数据结构或行为时 修改起来很容易
#这very amazy
=end

#面向对象的特征
#封装  隐藏内部数据处理
#多态  polymorphism  对象对于消息都有其独有的解释方式
require 'io/console'

str="" 
io=$stdout #io对象
str << "ruby"
io << "ruby"
#一样时<< 这个方法 str 与io 对象的处理方式不同
#两者都是用来新增字符串的接口 使用者不需要知道实际的数据结构与处理细节 以对象为中心的的思维 让我们将接口(送什么消息会有什么反应)与实现()分开思考的机会
#另外实际的处理由每个对象各自负责 发生什么问题的时候 也比较容易需要加以修正或修改


# duck typing 
def fetch_and_downcase(ary,index)
	if str=ary[index] #任何不是false or nil 都为true
		return str.downcase
	end
end
ary=["adele","ailen"]
puts fetch_and_downcase(ary,1)

hash={1=>"adele",2=>"ailen",3=>"bitch"}
puts fetch_and_downcase(hash,1)
#对象的特征并不是依赖其实际的种类(class),而是依据对象具有哪些行为(function)来决定的
#使用fetch_and_downcase function只要满足
#1可以使用ary[index]的方式取出元素
#2取出的元素具有downcase function

#Ruby的变量没有类型 所以程序要在执行阶段才能判断变量所指向的对象是否有方法可以调用 从某些方面来说这可能时个缺点 


















