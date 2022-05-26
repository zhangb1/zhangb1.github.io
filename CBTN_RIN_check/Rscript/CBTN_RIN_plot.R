library(ggplot2)
library(factoextra)
library(janitor)
library(tidyr)
library(dplyr)
library(reshape2)
library(umap)
library(Rtsne)

data <- read.table('/Users/zhangb1/Documents/D3b-project/D3b-CBTN-RNA-check/master_sample_matrix_MRate.tsv',header = T, sep = '\t',row.names = 1,quote = "")
data[1:3,1:3]

process_data <- data
process_data[1:3,1:3]

## get logfpkm
tpm <- process_data[,-(1:2)]
tpm[1:3,1:3]
## remove constant TPM=0
pre_data <- tpm[, colSums(tpm != 0 ) > 1]
logdata<- log2(pre_data+1)


## define group
group_RIN_type <- process_data$RIN_type
group_Cancer_type <- process_data$Cancer_type

# group_recorded_capture_method <- process_data$recorded_capture_method

RIN <- group_RIN_type
Cancer_type <- group_Cancer_type
# legname <- "Group (seq center)"


##################### .umap ##################
library(umap)

cbtn_umap = umap(logdata)

df <- data.frame(x = cbtn_umap$layout[,1],
                 y = cbtn_umap$layout[,2],
                 Group = RIN,
                 Cancer_type =Cancer_type)
write.csv(df,"/Users/zhangb1/Documents/D3b-project/D3b-CBTN-RNA-check/umap_bo_check.csv",quote=FALSE)
ggplot(df, aes(x, y, colour = Cancer_type, shape= Group)) +
  geom_point(size = 3.5)+
  scale_shape_manual(values = 0:3) +
  ggtitle("Umap plot") +
 # scale_color_discrete(name = legname)+
  theme(legend.title = element_text(size=16),
        legend.text = element_text(size=10), 
        axis.title.x=element_text(size=14,face="bold",color="blue",hjust=0.5), 
        axis.title.y=element_text(size=14,face="bold",color="blue"),
        axis.text=element_text(size=12),
        plot.title = element_text(hjust = 0.5,size=20))
        
        
##################### .tSNE ##################
library(Rtsne)
cbtn_tsne <- Rtsne(as.matrix(logdata))

tsne_plot <- data.frame(x = cbtn_tsne$Y[,1], 
                        y = cbtn_tsne$Y[,2], 
                        Group = RIN,
                        Cancer_type =Cancer_type)
ggplot(tsne_plot, aes(x, y, colour = Cancer_type,shape= Group)) +
  geom_point(size = 3.5)+
  scale_shape_manual(values = 0:3) +
  ggtitle("tSNE plot") +
  #scale_color_discrete(name = legname)+
  theme(legend.title = element_text(size=16),
        legend.text = element_text(size=10), 
        axis.title.x=element_text(size=14,face="bold",color="blue",hjust=0.5), 
        axis.title.y=element_text(size=14,face="bold",color="blue"),
        axis.text=element_text(size=12),
        plot.title = element_text(hjust = 0.5,size=20))

##################### boxplot ##################

steps=read.table("/Users/zhangb1/Documents/D3b-project/D3b-CBTN-RNA-check/sample_matrix.txt", header = T,sep = '\t',quote = "")

level_order <- c('BadRin', 'LowRin', 'GoodRin')

p <- ggplot(steps,aes(x = factor(RINstatus,level = level_order),Mapping_rate))

p + geom_boxplot() +geom_jitter(width = 0.2) + xlab("RINstatus")
