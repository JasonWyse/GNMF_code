f1=open('omim2ncbi')
f2=open('omim2ncbi_2016_2_24.txt')
f_out=open('omim2ncbi_true','w')
d={}
for line_f1 in f1.readlines():
	d[line_f1.split()[0]]=line_f1.split()[1]
for line_f2 in f2.readlines():
	d[line_f2.split()[0]]=line_f2.split()[1]

for i in sorted(d.keys()):
	f_out.write(i)
	f_out.write(" ")
	f_out.write(d[i])
	f_out.write("\n")


