#'
#' impute_data
#' @param data
impute_run_data <- function(data,plot_num) {
	
	if(plot_num==1){
	
	gp_split <- data %>% group_split(data$type)
	types <- vector()
	
  for(i in 1:length(gp_split)){
		assign(paste0("df_",unique(gp_split[[i]]$type)),gp_split[[i]])
		types[i] <- paste0("df_",unique(gp_split[[i]]$type))
	}
	
	y_variable <- c("average_heart_rate_bpm","distance_km","climb_m","average_speed_km_h")
	colours_list <- c("red","green","purple","blue")
	plot_loop <- vector('list',length=length(y_variable))
	
	for(i in 1:length(y_variable)){
		
		running_data <- 	eval(parse(text=paste0("df_Running %>% mutate(y_variable = ifelse(is.na(",y_variable[i],"),mean(",y_variable[i],",na.rm=TRUE),",y_variable[i],"),
				 date=lubridate::date(date))%>% 
	select(date,y_variable)")))
		
		plot_loop[[i]] <- running_data %>% 
			ggplot(aes(x=date,y=y_variable))+
			geom_point(colour=colours_list[i],size=1.5,alpha=.8)+
			theme(axis.text = element_blank(),
						axis.ticks = element_blank(),
						axis.title = element_blank())+
			ggtitle(paste(y_variable[i],"vs Date"))
		
	}
	
	return(plot_loop)

	} else if (plot_num==2){
		
		plot2 <- data %>% 
			filter(lubridate::year(lubridate::date(date)) >=2013 & 
						 	lubridate::year(lubridate::date(date)) <=2018) %>% 
			select(date,distance_km) %>% 
			mutate(weeknumber=lubridate::week(lubridate::date(date)),
						 date=lubridate::date(date)) %>% 
			group_by(weeknumber) %>% 
			fill() %>% 
			ggplot(aes(x=date,y=distance_km))+
			geom_line(colour="lightblue",size=0.75)+
			geom_smooth(colour="red",size=1.5,method="loess")
		
		return(plot2)
		
	}
	
}
	
