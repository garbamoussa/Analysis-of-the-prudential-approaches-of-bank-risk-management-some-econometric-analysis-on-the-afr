 ## importer de données .txt 
 mydata <- read.table("C:/Users/garbamoussa/Desktop/Data/data_file.txt", header=TRUE, sep="\t", na.strings = "-9")
 
 
 ## Exporter les données 
 write.table(mydata, file = "data_file.txt", sep ="\t")
 
 ##  Afficher le mode de chaque élément 
 apply(mylist,mode)
 sapply(data,mode)
 
 
 ## Afficher la classe de chaque élément 
 
 sapply(mylist,class)
 sapply(data,class)
 
 
 
 # 
x = c(one=1,two=2,three=3) (1)


x = c(1,2,3)


names(x) = c("one","two","three")  ### cette fonction revient à écrire la (1)

names(x)[1:2] = c("uno","dos")

