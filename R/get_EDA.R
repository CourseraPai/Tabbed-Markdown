#' @title
#' @param data
get_EDA <- function(data,list_num) {
	
	
	data <- data %>% 
		clean_names()
	
	
	glimpse_of_data <- ExpData(data)
	number_stats <- ExpNumStat(data, round = 1)
	
	par(mfrow=c(2,2))
	number_viz <- ExpNumViz(data)
	
	cat_stats <- ExpCTable(data)
	cat_viz <- ExpCatViz(data)
	
	
	missing_viz <- vis_dat(data)
	corr_viz <- data %>% 
		select_if(is.numeric) %>% 
		vis_cor()
	
	
	 # return(list(glimpse_of_data,number_stats,number_viz,cat_stats,cat_viz,missing_viz,corr_viz))
	
	if(list_num==1){
		return(glimpse_of_data)
	}else if(list_num==2){
		return(number_stats)
	}else if(list_num==3){
		return(number_viz)
	}else if(list_num==4){
		return(cat_stats)
	}else if(list_num==5){
		return(cat_viz)
	}else if(list_num==6){
		return(missing_viz)
	}else if(list_num==7){
		return(corr_viz)
	}
	
	
	
}
