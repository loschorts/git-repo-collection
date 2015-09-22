class XmlDocument
	@@tab_level = -1

	def initialize (indent = false)
		@tab = ""
		@indent = indent
		@tab_level = -1

	end


	def method_missing (name, *attrib, &block)
		if attrib.empty? && block == nil
			empty_tag name
		elsif !attrib.empty?
			tag_with_attributes name, *attrib
		else
			@indent ? indented_tag(name, &block) : nested_tag(name, &block)
		end
	end

	def empty_tag name
		@tab_level +=1
		tag = "#{'  '*@tab_level}<#{name}/>"
		tag += "\n" if @tab_level != 0
		@tab_level -=1
		tag
	end

	def tag_with_attributes name, *attrib
		@tab_level +=1
		tag= "#{'  '*@tab_level}<"+name.to_s+" "+attrib[0].keys.first.to_s+'="'+attrib[0].values.first+'"/>'
		tag += "\n" if @tab_level != 0
		@tab_level -=1
		tag

	end

	def nested_tag name, &block
		open_tag = "<#{name}>"
		close_tag = "</#{name}>"
		"#{open_tag}#{block.call}#{close_tag}"
	end

	def indented_tag name, &block
		@tab_level +=1
		open_tag = "<#{name}>\n"
		close_tag = "</#{name}>"
		tag = "#{'  '*@tab_level}#{open_tag}#{block.call}"
		tag += "#{'  '*@tab_level}#{close_tag}\n"
		@tab_level -=1
		tag
	end
end