## Data Summary

Total of 918 RNAseq samples in CBTN datasets can be found

Source RIN from [link](https://chop365-my.sharepoint.com/:x:/g/personal/sullivanca_chop_edu/EZUZbpJOsmRDrI_o97k68MIB_VFw5ijByrEoFBbCc0-UHw?e=Uureko)

```
RIN<3.5  as BadRin
3.5<RIN<5.5 as LowRin
RIN>5.5 as GoodRin

```

numbers  | RIN
------------- | -------------
40  | BadRin
88  | LowRin
790 |GoodRin


## Stats Figures

### Umap plot

1. use all TPM value from RSEM results 
2. remove TPM sum is 0 
3. use log2(TPM+1) in the Umap

<img width="636" alt="image" src="https://user-images.githubusercontent.com/14929845/170528820-49e13994-a6bd-4f46-a595-de33d0e32e0a.png">

### Box plot

- Mapping_rate

![image](https://user-images.githubusercontent.com/14929845/170529481-20cfe581-c58c-4536-b0e3-9c8d28062afa.png)

- Mismatch_rate

![image](https://user-images.githubusercontent.com/14929845/170529679-186ebb8f-eba4-4aa9-b855-48423ffc0ee9.png)

- Chimeric_reads_mapping_rate

![image](https://user-images.githubusercontent.com/14929845/170529852-9cb6b524-044e-41a7-b73d-6156d09b8bd5.png)

- Mapped_multiple_loci_rate

![image](https://user-images.githubusercontent.com/14929845/170530003-38625ac7-f063-4f1d-86e4-b885f06c1b9d.png)

- Mapped_too_many_loci_rate

![image](https://user-images.githubusercontent.com/14929845/170530103-a0666cee-848b-429e-9baf-e7e3dc66d6f2.png)

- Reads_unmapped_rate

![image](https://user-images.githubusercontent.com/14929845/170530177-851f4dbe-fc37-4d83-9b90-6777cff7f2a4.png)

