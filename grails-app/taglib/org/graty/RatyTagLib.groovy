package org.graty

class RatyTagLib {

	static namespace = "ry"


	/**
	*
	*
	* @param divId
	* @param score
	* @param number
	* @param scoreName
	* @param readOnly
	* @param half
	* @param click
	*
	**/
	def stars = { attrs ->
                                    

		//def images = grailsApplication.config.raty.images  // ?:'/secureapp/images'
                //def images = "/${grails.util.Metadata.current.'app.name'}/images"
                
                def images = "${request.contextPath}/images"                
		def divId = attrs.divId                          
		def score = attrs.score         
		def number = attrs.number
		def scoreName = attrs.name
		def readOnly = attrs.readOnly
		def half = attrs.half
		def click = attrs.click
                
                def hints = attrs.hints
                
		def ratyConfig = ""

                if(hints)
                	ratyConfig <<= "hints:${hints},"                        
		if(score)
			ratyConfig <<= "score:${score},"
		if(number)
			ratyConfig <<= "number:${number},"
		if(scoreName)
			ratyConfig <<= "scoreName:'${scoreName}',"
		if(readOnly)
			ratyConfig <<= "readOnly:${readOnly},"
		if(half)
			ratyConfig <<= "half:${half},"
		if(click)
			ratyConfig <<= "click: function(score, evt){ ${click} }"

		def scratch = """ 
			jQuery.fn.raty.defaults.path = '${images}';
			jQuery('#${divId}').raty({
				${ratyConfig}
			});
		"""

		out << scratch
	}

}
