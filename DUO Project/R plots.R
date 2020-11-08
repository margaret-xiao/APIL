#Duo analysis 

if (!require("gplots")) {
  install.packages("gplots", dependencies = TRUE)
  library(gplots)
}
if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
}

library(pheatmap)

#APIL DUO HEATMAP (GRADED)
expression <- read.csv("C:\\Users\\zixua\\Documents\\APIL\\APIL\\Duo Project\\Duo_Heatmap_V1.csv", stringsAsFactors = F)


#drops <- c("S2_62F","S3_44M", "S6_47M", "S16_33M", "S18_55F", "S19_42M")
#expression <- expression [ , !(names(expression ) %in% drops)]

rnames <- expression[,1]
expression_matrix <- data.matrix(expression[,2:ncol(expression)])
rownames(expression_matrix) <- rnames 

#z.expression_matrix <- t(scale(t(expression_matrix), center = TRUE, scale=TRUE))

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("green", "red"))(n = 299)


#mat = matrix( rnorm(1), ncol=27 )

#APIL SSM prototype 
#Bitrex tested 3M N95									


annot <- read.csv("C:\\Users\\zixua\\Documents\\APIL\\APIL\\Duo Project\\annotation_master.csv", stringsAsFactors = F)

annot_df = data.frame("Model" = annot$code)

rownames(annot_df) = colnames(expression_matrix)


setwd("C:\Users\zixua\Documents\APIL\APIL\DUO Project")

#png(filename="testing2.png", units = "px", width = 4500, height =1000, res=300)


go.esg.stat.heatmap <- pheatmap(expression_matrix,
                                fontsize = 10,
                                main = "Validation of APIL Duo", 
                                cluster_rows = FALSE,
                                cluster_cols = FALSE,
                                annotation_col = annot_df, 
                                breaks = seq(from=-0.75, to=0.75, length.out = 1000),
                                #fontsize = 8,
                                 fontsize_row  = 14, 
                                fontsize_col = 10,
                                color = colorRampPalette(c("red", "lightgreen", "green4"),space = 'rgb')(1000), 
                                srtCol=90,
                                legend_breaks = -0.5:0.5, 
                                legend=T, 
                               
                                legend_labels = c("Fail", "100","Pass")
)





#N95 HEATMAP (GRADED)

expression <- read.csv("C:\\Users\\zixua\\Documents\\APIL\\APIL\\Duo Project\\N95_Heatmap_V1.csv", stringsAsFactors = F)


#drops <- c("S2_62F","S3_44M", "S6_47M", "S16_33M", "S18_55F", "S19_42M")
#expression <- expression [ , !(names(expression ) %in% drops)]

rnames <- expression[,1]
expression_matrix <- data.matrix(expression[,2:ncol(expression)])
rownames(expression_matrix) <- rnames 

#z.expression_matrix <- t(scale(t(expression_matrix), center = TRUE, scale=TRUE))

# creates a own color palette from red to green
my_palette <- colorRampPalette(c("green", "red"))(n = 299)


#mat = matrix( rnorm(1), ncol=27 )

#APIL SSM prototype 
#Bitrex tested 3M N95									


go.esg.stat.heatmap <- pheatmap(expression_matrix,
                                fontsize = 14,
                                main = "Bitrex Tested 3M N95", 
                                cluster_rows = FALSE,
                                cluster_cols = FALSE,
                                # annotation_col = annot_df, 
                                breaks = seq(from=-0.75, to=0.75, length.out = 1000),
                                #fontsize = 8,
                                fontsize_row  = 14, 
                                fontsize_col = 10,
                                
                                
                                color = colorRampPalette(c("red", "lightgreen", "green4"),space = 'rgb')(1000), 
                                srtCol=90,
                                legend_breaks = -1:1, 
                                legend=T, 
                                
                                legend_labels = c( "Fail", "100","Pass")
)



go.esg.stat.heatmap <- pheatmap(expression_matrix,
                                fontsize = 14,
                                main = "Bitrex Tested 3M N95", 
                                cluster_rows = FALSE,
                                cluster_cols = FALSE,
                                breaks = seq(from=-1.3, to=2.0, length.out = 1000),
                                fontsize_row          = 14, 
                                fontsize_col = 10,
                                
                                color = colorRampPalette(c("red", "lightgreen", "green4"),space = 'rgb')(1000), 
                                srtCol=90,
                                #legend_breaks = -0.3:1.0, 
                                legend=T, 
                                #legend_labels = c("Fail","100","Pass")
)



#Do not use 

heatmap.2(expression_matrix,
          #cellnote = expression_matrix,  # same data set for cell labels
          #main = "APIL SSM prototype", # heat map title
          main = "Preliminary Validation of SSM", # heat map title
          key = "False",
          notecol="black",      # change font color of cell labels to black
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(5,12),     # widens margins around plot
          col=my_palette,      # use on color palette defined earlier
          #breaks=col_breaks,    # enable color transition at specified limits
          dendrogram="none",     # only draw a row dendrogr
          Colv="NA", 
          Rowv = "NA", 
          scale = "none", 
          xlab = NULL,
          sepwidth=c(0.01,0.01),
          sepcolor="black",
          colsep=0:44,
          rowsep=0:8, 
          srtCol=0)  
mtext(c("Green indicates pass: fit-factor of 100 or greater"), side = 3, line= 1, at = c(0))


