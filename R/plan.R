run_plan <-
  drake_plan(

  url = "https://raw.githubusercontent.com/VolodymyrGavrysh/DataCamp_projects/master/Analyze%20Your%20Runkeeper%20Fitness%20Data/datasets/cardioActivities.csv",
  runkeeper = get_data(url),
  runkeeperEDA1= get_EDA(runkeeper,1),
  runkeeperEDA2= get_EDA(runkeeper,2),
  runkeeperEDA3= get_EDA(runkeeper,3),
  runkeeperEDA4= get_EDA(runkeeper,4),
  runkeeperEDA5= get_EDA(runkeeper,5),
  runkeeperEDA6= get_EDA(runkeeper,6),
  runkeeperEDA7= get_EDA(runkeeper,7),
  runkeeper_run_stats1=impute_run_data(runkeeper,1),
  runkeeper_run_stats2=impute_run_data(runkeeper,2),
  
  report = target(
  	command = {
  		rmarkdown::render(knitr_in("doc/Runkeeper.Rmd"))
  		file_out("doc/Runkeeper.html")
  	}
  )
  
  
)
