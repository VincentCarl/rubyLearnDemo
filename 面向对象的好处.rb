#!!�������ĺô�
#���������������֮ǰ�����ݴ���ʽ
#���� �����봦���������� 
#!!!�������봦�����ֿ�����  pg 96ҳ
#eg ��������
def search_info(book,name)
	for i in book.data	
		if i.name==name
			return i
		end
	end
end
#search_info(addr_book,"adele")
#�������� �����ݽṹ�ı�ʱ �޷����м򵥵���
#book ���պ����ֿ�  ��ʱ��Ҫ�޸� ͬ�������������ɾ���Ȳ���ҲҪ�����޸�
def search_info2(book,name)
	for i in book.data	
		if (i.firstname+i.secondname)
	end
end

class AddressBook
	attr_accessor :name
	attr_accessor :data
	...
end
class PersonalInfo
	attr_accessor :firstname
	attr_accessor :secondname
	....
end

#���������ݽṹ�ı���Ҫ�����µĴ������
#�����ܶ����Ƶ����ݲ���׷���µĴ������ #����ó����úܸ���
#ʵ�ʿ��������ݽṹ�޸���׷���Ǽҳ��㷹 
#�ܶ���˼����θ�����Ӧ�����ݵı�� ����ҵ�һ��������� �����������

#������� �������ӵ���������⻹ӵ����Ϊ
#������˭ӵ������˭��ӵ�в������ݵķ���
class PersonalInfo2
	attr_accessor :firstname
	attr_accessor :secondname
	........
	#��Ϊ
	def name
		return @firstname+@secondname
	end
end
#ͨѶ¼
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
=begin �����ĺô� ֻ��PersonalInfo�ܹ��ش�name��ʲô
��˵�ͨѶ¼(AddressBook)�����۴�����ָ�����Ϣ(PersonalInfo)
��ش�����(AddressBook.search_info)������Ҫ�޸�
#�����Ҫ�޸����ݽṹ����Ϊʱ �޸�����������
#��very amazy
=end